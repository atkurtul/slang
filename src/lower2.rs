use crate::ast;
pub use crate::ast::{Binding, Binop, Literal, Pattern, Prim, Sstr, Unop};
use crate::memory::*;
use crate::*;
use fxhash::FxHashMap;
use fxhash::FxHashSet;
use std::collections::BTreeSet;
use std::{collections::BTreeMap, iter::Skip};
use std::{
  hash::{Hash, Hasher},
  unimplemented, unreachable,
};

pub use std::{rc::*, usize};
pub type Map<K, V> = BTreeMap<K, V>;
pub type Set<K> = BTreeSet<K>;

#[derive(Debug, Default, Clone, Eq, PartialEq)]
pub struct Node {
  pub t: Option<Ty>,
  pub x: Expr,
}

impl Node {
  fn mby_enforce(&self, r: &Node) {
    match (&self.t, &r.t) {
      (Some(t), None) => r.enforce(t),
      (None, Some(t)) => self.enforce(t),
      _ => (),
    }
  }

  fn refresh(&self) {
    use Expr::*;
    match &self.x {
      Expr::Var(_, n) => {
        n.refresh();
        self.mby_enforce(n);
      }

      Expr::Iter(l) => {
        l.refresh();
        if let Some(t) = &l.t {}
      }

      Expr::AssignOp(_, l, r) | Expr::Assign(l, r) | Expr::Range(l, r) => {
        l.mby_enforce(r);
        l.refresh();
        r.refresh();
      }

      Expr::Binary(o, l, r) => {
        l.mby_enforce(r);
        l.refresh();
        r.refresh();
        if !o.is_boolean() {
          if let Some(t) = l.t.as_ref().or(r.t.as_ref()) {
            self.enforce(t);
          }
        }
      }

      Expr::Unary(o, r) => {
        r.refresh();
        match (self.t.as_ref(), r.t.as_ref()) {
          (Some(l), _) => match o {
            Unop::Addrof => r.enforce(l.deref()),
            Unop::Deref => r.enforce(&l.ptr()),
            _ => r.enforce(l),
          },
          (_, Some(r)) => match o {
            Unop::Addrof => self.enforce(&r.ptr()),
            Unop::Deref => self.enforce(r.deref()),
            _ => self.enforce(&r),
          },
          _ => (),
        }
      }

      Expr::IfElse(c, l, r) => {
        c.refresh();
        l.mby_enforce(r);
        l.refresh();
        r.refresh();
        l.t.as_ref().or(r.t.as_ref()).map(|t| self.enforce(&t));
      }

      Expr::If(c, r) => {
        c.refresh();
        r.refresh();
      }

      Expr::Forever(l) | Expr::Let(l) | Expr::Cast(_, l) | Expr::Lambda(.., l) => {
        l.refresh();
      }

      Expr::Block(v) => {
        for x in v {
          x.refresh()
        }
      }

      Expr::Ret(l) => {
        l.as_ref().map(|l| l.refresh());
      }

      Expr::While(l, r) | Expr::For(l, r) => {
        l.refresh();
        r.refresh();
      }

      Literal(..) | Callable(..) | Brk(..) | While(..) | Jmp(..) | Type | Extern | Label
      | Skip | This | Nil | Arg | Va | Accumulator | Counter => (),

      Expr::Agg(a) => {
        //TODO
        match a {
          Aggregate::Struct(s, g, _, x) => {
            //TODO
            x.iter().for_each(|x| x.refresh());
          }
          Aggregate::Tuple(v) => v.iter().for_each(|x| x.refresh()),
          Aggregate::Array(v) => v.iter().for_each(|x| x.refresh()),
        }
      }

      Expr::Call(f, g, a) => {
        f.refresh();
        a.iter().for_each(|x| x.refresh());

        let f = match &f.x {
          Expr::Callable(Invoke::Ctx(ctx)) => &ctx.func,
          Expr::Extern => return,
          Expr::Callable(Invoke::Method(n, f)) => {
            if let Some(t) = &self.t {
              f.set_ret(t.clone());
            }
            for (i, a) in a.iter().enumerate() {
              if let Some(t) = &a.t {
                f.set_arg(i, t.clone());
              }
            }
            &f
          }
          _ => unreachable!()
        };

        assert_eq!(f.gen, g.len());
        let sol = f.solve_type_vars_for_params_and_mby_ret(a, &self.t);
        let known = sol.iter().fold(0, |v, t| v | t.as_ref().map(|t| t.deps()).unwrap_or_default());
        let sol: Vec<_> = sol.into_iter().map(|t| t.unwrap_or(Ty::Gen(usize::MAX))).collect();
        for (t, arg) in f.get_args().iter().zip(a.iter()) {
          let deps = t.deps();
          if (deps | known) <= known {
            arg.enforce(&t.subst(&sol));
          }
        }

        if let (Some(ret), g) = f.deduce_ret_from(a) {
          self.enforce(&ret);
        }
      }

      Expr::Subscript(l, r) => {
        //TODO
        l.refresh();
        r.refresh();
        if let Some(t) = l.t.as_ref().map(|t| t.indexable_type().unwrap()) {
          self.enforce(t);
        }
      }

      Expr::Index(l, r) => {
        //TODO
        l.refresh();
      }

      Expr::Field(l, r) => {
        //TODO
        l.refresh();
      }
    }
  }

  fn enforce(&self, t: &Ty) {
    if let Some(ty) = &self.t {
      assert_eq!(ty, t);
    } else {
      //println!("Lol wut xd");
      ptr(self).t = Some(t.clone());
    }
    use Expr::*;
    match &self.x {
      Expr::Var(_, n) => n.enforce(t),

      Expr::Binary(o, l, r) => {
        //Refresh
        if o.is_boolean() {
          l.mby_enforce(r);
        } else {
          l.enforce(t);
          r.enforce(t);
        }
      }

      Expr::Unary(o, l) => match o {
        Unop::Addrof => l.enforce(t.deref()),
        Unop::Deref => l.enforce(&t.ptr()),
        _ => l.enforce(t),
      },

      Expr::Range(l, r) => l.mby_enforce(r),

      Expr::Lambda(_, a, r) => match t {
        Ty::Func(a1, r1, _) => {
          for (a, b) in a.iter().zip(a1.iter()) {
            assert_eq!(a.as_ref(), Some(b));
          }
          r.enforce(r1);
        }
        _ => panic!(),
      },

      Expr::IfElse(_, l, r) => {
        l.enforce(t);
        r.enforce(t);
      }

      Expr::Assign(l, r) | Expr::AssignOp(_, l, r) => l.mby_enforce(r),

      Expr::Block(v) => {
        v.last().map(|x| x.enforce(t));
      }

      Literal(..) | Cast(..) | Callable(..) | Ret(..) | Brk(..) | If(..) | While(..)
      | Forever(..) | Jmp(..) | For(..) | Let(..) | Type | Extern | Label | Skip | This
      | Nil | Arg | Va | Accumulator | Counter => (),

      Expr::Iter(n) => {
        //TODO
      }

      Expr::Agg(..) => {
        //TODO
      }

      Expr::Call(f, g, a) => {

        let f = match &f.x {
          Expr::Callable(Invoke::Ctx(ctx)) => &ctx.func,
          Expr::Extern => return,
          Expr::Callable(Invoke::Method(n, f)) => {
            if let Some(t) = &self.t {
              f.set_ret(t.clone());
            }
            for (i, a) in a.iter().enumerate() {
              if let Some(t) = &a.t {
                f.set_arg(i, t.clone());
              }
            }
            &f
          }
          _ => unreachable!()
        };

        *ptr(g) = f.solve_type_vars_for_params_and_ret(a, t);
        if g.iter().filter(|x| x.is_some()).count() == g.len() {
          let g: Vec<_> = g.iter().filter_map(|x| x.clone()).collect();
          let args = Ty::agg_subst(f.get_args(), &g);
          for (x, t) in a.iter().zip(args.into_iter()) {
            x.enforce(t);
          }
        }
      }

      Expr::Subscript(..) => {
        //TODO
      }

      Expr::Index(..) => {
        //TODO
      }

      Expr::Field(..) => {
        //TODO
      }
    }
  }

  pub fn flatten(self: &Rc<Node>) -> Vec<Rc<Node>> {
    use Expr::*;
    match &self.x {
      Expr::Iter(n)
      | Expr::Index(n, _)
      | Expr::Field(n, _)
      | Expr::Ret(Some(n))
      | Expr::Forever(n)
      | Expr::Let(n)
      | Expr::Cast(_, n)
      | Expr::Lambda(.., n)
      | Expr::Unary(_, n)
      | Expr::Var(_, n) => {
        let mut v = n.flatten();
        v.insert(0, self.clone());
        v
      }
      Expr::Subscript(l, r)
      | Expr::While(l, r)
      | Expr::For(l, r)
      | Expr::If(l, r)
      | Expr::Binary(_, l, r)
      | Expr::AssignOp(_, l, r)
      | Expr::Assign(l, r)
      | Expr::Range(l, r) => {
        let mut re = vec![self.clone()];
        re.into_iter()
          .chain(l.flatten().into_iter())
          .chain(r.flatten().into_iter())
          .collect()
      }
      
      Expr::IfElse(c, l, r) => {
        let mut re = vec![self.clone()];
        re.into_iter()
          .chain(c.flatten().into_iter())
          .chain(l.flatten().into_iter())
          .chain(r.flatten().into_iter())
          .collect()
      }

      Expr::Agg(Aggregate::Array(n) | Aggregate::Tuple(n) | Aggregate::Struct(.., n))
      | Expr::Block(n) => {
        let mut re = vec![self.clone()];
        re.into_iter()
          .chain(n.iter().flat_map(|x| x.flatten()).into_iter())
          .collect()
      }

      Literal(..) | Callable(..) | Brk(..) | While(..) | Jmp(..) | Type | Extern | Label
      | Skip | This | Nil | Arg | Va | Accumulator | Counter => vec![self.clone()],

      Ret(None) => vec![],

      Expr::Call(f, g, a) => {
        //TODO
        let mut re = vec![self.clone()];
        re.into_iter()
          .chain(f.flatten().into_iter())
          .chain(a.iter().flat_map(|x| x.flatten()).into_iter())
          .collect()
      }
    }
  }
}

#[derive(Clone, Eq, PartialEq, Hash)]
pub struct Adt {
  name: Sstr,
  names: Box<[Sstr]>,
  tys: Box<[Ty]>,
  sum: u8,
  gen: usize,
}

#[derive(Debug, Clone, Eq, PartialEq, Hash)]
pub enum Ty {
  Void,
  Prim(Prim),
  Tuple(Rc<[Ty]>),
  Union(Rc<[Ty]>),
  Slice(Rc<Ty>),
  Ptr(Rc<Ty>),
  Array(usize, Rc<Ty>),
  Func(Rc<[Ty]>, Rc<Ty>, bool),
  Adt(Rc<Adt>),
  Gadt(Rc<Adt>, Rc<[Ty]>),
  Gen(usize),
}

impl Ty {
  fn autoderef(&self) -> Option<&Ty> {
    match self {
      Ty::Adt(_) | Ty::Gadt(..) => Some(self),
      Ty::Ptr(t) => t.autoderef(),
      _ => None,
    }
  }

  fn indexable_type(&self) -> Option<&Ty> {
    match self {
      Ty::Array(_, t) | Ty::Slice(t) | Ty::Ptr(t) => Some(t),
      _ => None,
    }
  }

  fn satisfies(&self, r: &Ty) -> bool {
    // if let Ty::Alias(t) = r {
    // return self.satisfies(t);
    // }
    match self {
      //Ty::Alias(t) => t.satisfies(r),
      Ty::Gen(..) => true,
      Ty::Adt(st0) => match r {
        Ty::Adt(st1) => st0 == st1,
        _ => false,
      },
      Ty::Tuple(v) => match r {
        Ty::Tuple(v1) => v
          .iter()
          .zip(v1.iter())
          .fold(true, |c, (a, b)| c && a.satisfies(b)),
        _ => false,
      },
      Ty::Union(v) => match r {
        Ty::Union(v1) => v
          .iter()
          .zip(v1.iter())
          .fold(true, |c, (a, b)| c && a.satisfies(b)),
        _ => false,
      },
      Ty::Slice(a) => match r {
        Ty::Slice(b) => a.satisfies(b),
        _ => false,
      },
      Ty::Array(l, v) => match r {
        Ty::Array(l1, v1) => l == l1 && v.satisfies(v1),
        _ => false,
      },
      Ty::Ptr(v) => match r {
        Ty::Ptr(v1) => v.satisfies(v1),
        _ => false,
      },
      Ty::Func(a, b, va) => match r {
        Ty::Func(a1, b1, va1) => {
          a.iter()
            .zip(a1.iter())
            .fold(true, |c, (a, b)| c && a.satisfies(b))
            && b.satisfies(b1)
            && (va == va1)
        }
        _ => false,
      },
      _ => match r {
        Ty::Gen(..) => panic!(),
        _ => self == r,
      },
    }
  }

  fn agg_subst(a: &[Ty], map: &[Ty]) -> Rc<[Ty]> {
    a.iter().map(|t| t.subst(map)).collect()
  }

  fn subst(&self, map: &[Ty]) -> Ty {
    match self {
      Ty::Void => Ty::Void,
      Ty::Prim(p) => Ty::Prim(*p),
      Ty::Tuple(t) => Ty::Tuple(Ty::agg_subst(t, map)),
      Ty::Union(t) => Ty::Union(Ty::agg_subst(t, map)),
      Ty::Slice(t) => Ty::Slice(Rc::new(t.subst(map))),
      Ty::Ptr(t) => Ty::Ptr(Rc::new(t.subst(map))),
      Ty::Array(l, t) => Ty::Array(*l, Rc::new(t.subst(map))),
      Ty::Gen(x) => {
        if let Ty::Gen(usize::MAX) = map[*x] {
          panic!();
        }
        map[*x].clone()
      }
      Ty::Func(a, t, va) => Ty::Func(Ty::agg_subst(a, map), Rc::new(t.subst(map)), *va),
      Ty::Adt(t) if t.gen == 0 => self.clone(),
      Ty::Gadt(t, g) => Ty::Gadt(t.clone(), Ty::agg_subst(g, map)),
      _ => panic!("{:?}", self),
    }
  }

  fn agg_gather(t: &[Ty], t1: &[Ty], map: &mut [Option<Ty>]) {
    t.iter()
      .zip(t1.iter())
      .for_each(|(t, t1)| t.gather(t1, map))
  }

  fn gather_opt(&self, eq: &Option<Ty>, map: &mut [Option<Ty>]) {
    let eq = if let Some(eq) = eq { eq } else { return };
    self.gather(eq, map);
  }

  fn gather(&self, eq: &Ty, map: &mut [Option<Ty>]) {
    match (self, eq) {
      (Ty::Gen(i), _) => {
        if let Some(t) = &map[*i] {
          assert_eq!(t, eq);
        } else {
          map[*i] = Some(eq.clone());
        }
      }
      (Ty::Tuple(t), Ty::Tuple(t1)) => Ty::agg_gather(t, t1, map),
      (Ty::Union(t), Ty::Union(t1)) => Ty::agg_gather(t, t1, map),
      (Ty::Slice(t), Ty::Slice(t1)) => t.gather(t1, map),
      (Ty::Ptr(t), Ty::Ptr(t1)) => t.gather(t1, map),
      (Ty::Array(l, t), Ty::Array(l1, t1)) => t.gather(t1, map),
      (Ty::Func(a, t, va), Ty::Func(a1, t1, va1)) => {
        Ty::agg_gather(a, a1, map);
        t.gather(t1, map);
      }
      (Ty::Adt(t), Ty::Adt(t1)) => {
        assert_eq!(t, t1);
        assert_eq!(t.gen, 0);
      }
      (Ty::Gadt(t, g), Ty::Gadt(t1, g1)) => {
        assert_eq!(t, t1);
        Ty::agg_gather(g, g1, map);
      }
      //(l, Ty::Alias(t)) => l.gather(t, map),
      //(Ty::Alias(l), t) => l.gather(t, map),
      _ => (),
    }
  }

  fn deps(&self) -> usize {
    match self {
      Ty::Gen(i) => 1 << i,
      Ty::Tuple(t) | Ty::Union(t) => t.iter().fold(0, |x, t| x | t.deps()),
      Ty::Slice(t) => t.deps(),
      Ty::Ptr(t) => t.deps(),
      Ty::Array(l, t) => t.deps(),
      Ty::Func(a, t, va) => a.iter().fold(0, |x, t| x | t.deps()) | t.deps(),
      Ty::Adt(t) => {
        assert_eq!(t.gen, 0);
        0
      }
      Ty::Gadt(t, g) => g.iter().fold(0, |x, t| x | t.deps()),
      Ty::Void | Ty::Prim(_) => 0,
    }
  }

  fn ptr(&self) -> Ty {
    Ty::Ptr(Rc::new(self.clone()))
  }
  fn deref(&self) -> &Ty {
    match self {
      Ty::Ptr(p) => p,
      _ => unreachable!("{:?}", self),
    }
  }

  fn agg(v: &[ast::Ty], ctx: &Context) -> Rc<[Ty]> {
    v.iter().map(|t| Ty::new(t, ctx)).collect()
  }

  fn new(ty: &ast::Ty, ctx: &Context) -> Ty {
    match ty {
      ast::Ty::Void => Ty::Void,
      ast::Ty::Prim(t) => Ty::Prim(*t),
      ast::Ty::Tuple(t) => Ty::Tuple(Ty::agg(t, ctx)),
      ast::Ty::Union(t) => Ty::Union(Ty::agg(t, ctx)),
      ast::Ty::Slice(t) => Ty::Slice(Rc::new(Ty::new(t, ctx))),
      ast::Ty::Ptr(t) => Ty::Ptr(Rc::new(Ty::new(t, ctx))),
      ast::Ty::Array(l, t) => Ty::Array(*l, Rc::new(Ty::new(t, ctx))),
      ast::Ty::Adt(s) => {
        if let Some(st) = ctx.find_named_type(s) {
          Ty::Adt(st)
        } else {
          ctx.find_alias(s).expect(s)
        }
      }
      ast::Ty::Gadt(s, g) => {
        if let Some(st) = ctx.find_named_type(s) {
          Ty::Gadt(st, Ty::agg(g, ctx))
        } else {
          ctx.find_alias(s).unwrap()
        }
      }
      ast::Ty::Gen(x) => Ty::Gen(*x),
      ast::Ty::Func(args, ret, va) => {
        Ty::Func(Ty::agg(args, ctx), Rc::new(Ty::new(ret, ctx)), *va)
      }
    }
  }
}

#[derive(Debug, Clone, Eq, PartialEq)]
pub enum Expr {
  //LEAF
  This,
  Nil,
  Arg,
  Va,
  Accumulator,
  Counter,
  Literal(Literal),

  Var(Sstr, Rc<Node>),
  Cast(Ty, Rc<Node>),
  Binary(Binop, Rc<Node>, Rc<Node>),
  Unary(Unop, Rc<Node>),

  AssignOp(Binop, Rc<Node>, Rc<Node>),
  Assign(Rc<Node>, Rc<Node>),

  Subscript(Rc<Node>, Rc<Node>),
  Index(Rc<Node>, usize),
  Field(Rc<Node>, Sstr),
  Iter(Rc<Node>),

  Range(Rc<Node>, Rc<Node>),
  Block(Vec<Rc<Node>>),

  Lambda(Box<[Sstr]>, Box<[Option<Ty>]>, Rc<Node>),

  Agg(Aggregate),
  Call(Rc<Node>, Vec<Option<Ty>>, Vec<Rc<Node>>),
  Callable(Invoke),

  Ret(Option<Rc<Node>>),
  Brk(Option<Sstr>),
  IfElse(Rc<Node>, Rc<Node>, Rc<Node>),
  If(Rc<Node>, Rc<Node>),
  While(Rc<Node>, Rc<Node>),
  Forever(Rc<Node>),
  Jmp(Rc<Node>, Vec<(Pattern, Node)>),
  For(Rc<Node>, Rc<Node>),
  Let(Rc<Node>),
  Type,
  Extern,
  Label,
  Skip,
}

impl Default for Expr {
  fn default() -> Self {
    Expr::Skip
  }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Aggregate {
  Struct(
    Rc<Adt>,
    Rc<[Option<Ty>]>, // Gradually filled
    Box<[Sstr]>,
    Vec<Rc<Node>>,
  ),
  Tuple(Vec<Rc<Node>>),
  Array(Vec<Rc<Node>>),
}

impl Node {
  fn new(t: Option<Ty>, x: Expr) -> Rc<Node> {
    let re = Rc::new(Node { t, x });
    re.refresh();
    re
  }
}

#[derive(Clone, Default, Eq, PartialEq)]
pub struct Tree<Data, Below> {
  pub above: Option<*const Tree<Data, Below>>,
  pub below: Below,
  pub data: Data,
}

#[derive(Debug, Clone, Default, Eq, PartialEq)]
pub struct Func {
  va: Option<Sstr>,
  names: Box<[Sstr]>,
  this: Option<Ty>,
  gen: usize,
  ty: Ty,
}

// pub above: Option<Rc<VarStack>>,
// pub below: Vec<Rc<VarStack>>,
// pub data: Map<Sstr, Vec<Rc<Node>>>,

#[derive(Debug, Clone, Eq, PartialEq, Hash)]
pub enum Constraint {
  Method(Sstr, Rc<[Ty]>, Option<Ty>),
}

#[derive(Clone, Default, Eq, PartialEq)]
pub struct ContextData {
  pub name: Sstr,
  pub assocs: Map<Sstr, Vec<Rc<Context>>>,
  pub records: Map<Sstr, Rc<Adt>>,
  pub aliases: Map<Sstr, Ty>,
  pub extsymbols: Map<Sstr, Rc<Node>>,
  pub nodes: Vec<Rc<Node>>,
  pub labels: Set<Sstr>,
  pub locals: Vec<Map<Sstr, Vec<Rc<Node>>>>,
  pub func: Func,
  pub constraints: FxHashMap<Ty, FxHashSet<Constraint>>,
}

#[derive(Debug, Clone, Eq, PartialEq)]
pub enum Invoke {
  Ctx(Rc<Context>),
  Method(Rc<Node>, Func),
}

#[derive(Clone, Default, Eq, PartialEq)]
pub struct Context {
  pub inner: Inner,
}

type Inner = Tree<ContextData, Map<Sstr, Rc<Context>>>;

impl Context {
  pub fn new(x: Vec<ast::Expr>) -> Context {
    let mut ctx = Context::default();
    ctx.locals.push(defo());
    ctx.collect(&x);
    ctx.nodes = ctx.lowerv(&x);
    ctx.nodes.iter().for_each(|x| x.refresh());
    for x in ctx.nodes.iter().flat_map(|x| x.flatten()) {
      assert_ne!(x.t, None);
    }
    ctx
  }

  fn branch(&self, data: ContextData) -> Context {
    Context {
      inner: Inner {
        above: Some(&self.inner),
        below: defo(),
        data,
      },
    }
  }

  fn collect(&mut self, x: &Vec<ast::Expr>) {
    //First collect the types defined in this scope
    //this must be done first otherwise we wont be able to map types
    for x in x.iter() {
      match x {
        ast::Expr::Type {
          sum,
          name, //Sstr,
          mems, //Vec<Ty>,
          names, //Vec<Sstr>,
          gen,  //usize,
        } => {
          let st = Rc::new(Adt {
            name,
            tys: box [],
            names: names.into_iter().cloned().collect(),
            gen: *gen,
            sum: *sum,
          });
          if let Some(st) = self.records.insert(name, st) {
            panic!("Duplicate definition {}", name);
          }
        }
        ast::Expr::Alias(t, n) => {
          println!("Aliasing {}", n);
          if let Some(st) = self.aliases.insert(n, Ty::Void) {
            panic!("Duplicate alias {}", n);
          }
        }
        _ => (),
      }
    }

    for x in x.iter() {
      match x {
        //Extern symbol is just a name and a type e.g.: malloc (long) -> *[]
        ast::Expr::Extern(f) => {
          for (s, ty) in f.into_iter() {
            //println!("Extern {}", s);
            let node = Node::new(Some(Ty::new(ty, self)), Expr::Extern);
            self.extsymbols.insert(s, node);
          }
        }
        //Functions under this scope. Initialize them, we will process bodies later.
        ast::Expr::Func {
          va,
          body, //Box<Expr>
          name, //Sstr,
          this, //Option<Ty>,
          gen,  //usize,
          args, //Vec<Ty>,
          ret,  //Ty,
          names, //Vec<Sstr>,
        } => {
          let ctx = ContextData {
            name,
            locals: vec![defo()],
            constraints: defo(),
            func: Func {
              va: *va,
              gen: *gen,
              names: names.iter().cloned().collect(),
              this: this.as_ref().map(|t| Ty::new(&t, self)),
              ty: Ty::Func(
                args.into_iter().map(|t| Ty::new(t, self)).collect(),
                Rc::new(Ty::new(ret, self)),
                va.is_some(),
              ),
            },
            ..defo()
          };
          let mut ctx = self.branch(ctx);
          ctx.collect(&body);
          let ctx = Rc::new(ctx);
          //if this is an associated function dont put it with free functions
          //free functions are global by default unlike assocs
          if this.is_some() {
            self.assocs.entry(name).or_default().push(ctx);
          } else {
            self.below.insert(name, ctx.clone());
          }
        }

        ast::Expr::Type {
          sum,
          name, //Sstr,
          mems, //Vec<Ty>,
          names, //Vec<Sstr>,
          gen,  //usize,
        } => {
          //TODO: check for recursive types
          //Initialize the fields for real this time
          let types = mems.into_iter().map(|t| Ty::new(t, self)).collect();
          ptr::<Adt>(&**self.records.get_mut(name).unwrap()).tys = types;
        }
        ast::Expr::Alias(t, n) => {
          *ptr(self).aliases.get_mut(n).unwrap() = Ty::new(t, self);
        }
        _ => (),
      }
    }
  }

  fn insert_var(&mut self, var: &Binding, x: Rc<Node>) {
    //println!("Inserting {:?}", var);
    match var {
      Binding::Ignore => (),
      Binding::Ident(s) => {
        self.locals
          .last_mut()
          .unwrap()
          .entry(s)
          .or_default()
          .push(x);
      }
      Binding::Tuple(v) => {
        for (i, var) in v.into_iter().enumerate() {
          let x = Node::new(None, Expr::Index(x.clone(), i));
          self.insert_var(var, x);
        }
      }
    }
  }

  fn find_named_type(&self, n: Sstr) -> Option<Rc<Adt>> {
    self.inner.visit(|ctx| ctx.records.get(n).cloned())
  }

  fn find_assoc(&self, n: Sstr, t: &Ty) -> Option<Rc<Context>> {
    if let Some(f) = self.visit(|ctx| ctx.assocs.get(n).map(|v| v.as_slice())) {
      for f in f {
        if f.func.this.as_ref().unwrap().satisfies(t) {
          return Some(f.clone());
        }
      }
    }
    None
  }

  fn find_alias(&self, n: Sstr) -> Option<Ty> {
    self.visit(|ctx| ctx.aliases.get(n).cloned())
  }

  fn find_func(&self, n: Sstr) -> Option<Rc<Node>> {
    self.visit(|ctx| {
      ctx.below
        .get(n)
        .cloned()
        .map(|ctx| Node::new(Some(ctx.func.ty.clone()), Expr::Callable(Invoke::Ctx(ctx))))
    })
  }

  fn find_extern(&self, n: Sstr) -> Option<Rc<Node>> {
    self.visit(|ctx| ctx.extsymbols.get(n).cloned())
  }

  fn find_var(&self, n: Sstr) -> Option<Rc<Node>> {
    self.locals
      .iter()
      .rev()
      .find_map(|x| x.get(n))
      .map(|v| v.last().unwrap().clone())
      .or(self.func.find_arg(n))
  }

  fn find_symbol(&self, n: Sstr) -> Option<Rc<Node>> {
    self.func
      .find_arg(n)
      .or(self.find_func(n))
      .or(self.find_extern(n))
  }

  fn lowerv(&mut self, v: &Vec<ast::Expr>) -> Vec<Rc<Node>> {
    let mut re = vec![];
    for x in v {
      re.push(self.lower(x));
    }
    re
  }

  fn lower(&mut self, x: &ast::Expr) -> Rc<Node> {
    match x {
      ast::Expr::This => {
        Node::new(Some(self.func.this.as_ref().unwrap().clone()), Expr::This)
      }

      ast::Expr::Nil => Node::new(None, Expr::Nil),

      ast::Expr::Literal(n) => Node::new(
        Some(match n {
          Literal::Int(_) => Ty::Prim(Prim::Int(true)),
          Literal::Real(_) => Ty::Prim(Prim::Real),
          Literal::Str(_) => Ty::Prim(Prim::Str),
        }),
        Expr::Literal(*n),
      ),

      ast::Expr::Var(s) => {
        let node = self.find_var(s).expect(s);
        Node::new(None, Expr::Var(s, node))
      }

      ast::Expr::Binary(op, l, r) => {
        let l = self.lower(l);
        let r = self.lower(r);
        l.mby_enforce(&r);
        match op {
          Binop::Lt
          | Binop::Le
          | Binop::Ge
          | Binop::Gt
          | Binop::Eq
          | Binop::Ne
          | Binop::And => {
            Node::new(Some(Ty::Prim(Prim::Bool)), Expr::Binary(*op, l.clone(), r))
          }
          _ => {
            //println!("Type of left {:?} {:?}", l.t, l.x);
            Node::new(l.t.clone(), Expr::Binary(*op, l.clone(), r))
          }
        }
      }

      ast::Expr::Unary(op, x) => {
        let l = self.lower(x);
        let x = Node::new(None, Expr::Unary(*op, l.clone()));
        // match op {
        // Unop::Deref => {
        //  //println!("Unifying {:?} [@@DEREF@@] {:?} {:?}", x, x.t, l.t);
        //  x.enforce(match &l.t {
        //  Some(Ty::Ptr(t)) => t,
        //  _ => unreachable!(),
        //  })
        // }
        // Unop::Addrof => x.enforce(&Ty::Ptr(Rc::new(l.t.clone()))),
        // _ => x.enforce(&l.t),
        // }
        x
      }

      ast::Expr::Cast(t, x) => {
        let t = Ty::new(&t, self);
        let l = self.lower(x);
        Node::new(Some(t.clone()), Expr::Cast(t, l))
      }

      ast::Expr::Accumulator => Node::new(None, Expr::Accumulator),

      ast::Expr::Counter => Node::new(Some((Ty::Prim(Prim::Long(true)))), Expr::Counter),

      ast::Expr::AssignOp(op, l, r) => {
        let l = self.lower(l);
        let r = self.lower(r);
        Node::new(Some(Ty::Void), Expr::AssignOp(*op, l, r))
      }

      ast::Expr::Assign(l, r) => {
        let l = self.lower(l);
        let r = self.lower(r);
        Node::new(Some(Ty::Void), Expr::Assign(l, r))
      }

      ast::Expr::Subscript(l, r) => {
        let l = self.lower(l);
        let r = self.lower(r);
        Node::new(None, Expr::Subscript(l, r))
      }

      ast::Expr::TupleIndex(x, i) => {
        let x = self.lower(x);
        Node::new(None, Expr::Index(x, *i))
      }

      ast::Expr::Range(l, r) => {
        let l = self.lower(l);
        let r = self.lower(r);

        Node::new(None, Expr::Range(l, r))
      }

      ast::Expr::Alias(..) => Node::new(Some(Ty::Void), Expr::Skip),

      ast::Expr::Member(x, i) => {
        let x = self.lower(x);
        if let Some(t) = &x.t {
          match t.autoderef() {
            Some(Ty::Adt(t)) => {
              if let Some(t) = t.get_mem_ty(i) {
                return Node::new(Some(t), Expr::Field(x, *i));
              }
            }
            Some(Ty::Gadt(t, g)) => {
              if let Some(t) = t.get_mem_ty(i) {
                let t = t.subst(&g);
                return Node::new(Some(t), Expr::Field(x, *i));
              }
            }
            _ => (),
          }
        }

        if let Some(t) = &x.t {
          if let Some(ctx) = self.find_assoc(i, t) {
            return Node::new(Some(ctx.func.ty.clone()), Expr::Callable(Invoke::Ctx(ctx)));
          }
        }

        Node::new(None, Expr::Field(x, *i))
      }

      ast::Expr::Call(l, g, r) => {
        let l = self.lower(l);
        let r = self.lowerv(r);
        let g = Ty::agg(&g, self);
        match &l.x {
          Expr::Callable(Invoke::Ctx(ctx)) => {
            if ctx.func.gen == g.len() {
              //let arg_tys = Ty::agg_subst(ctx.func.get_args(), &g);
              //println!("{} {} {}", ctx.name, ctx.func.gen, g.len());
              let ret = ctx.func.get_ret().subst(&g);
              let g = g.into_iter().map(|t| Some(t.clone())).collect();
              return Node::new(Some(ret), Expr::Call(l, g, r));
            }
            //DEDUCE
            else {
              if g.len() > 0 { panic!("Partial type variable not allowed") };

              let (ret, g) = ctx.func.deduce_ret_from(&r);
              if let Some(ret) = ret {
                return Node::new(Some(ret), Expr::Call(l, g, r));
              } else {
                return Node::new(None, Expr::Call(l, g, r));
              }
              panic!();
            }
          }

          Expr::Field(obj, method) => {
            if let Some(t) = &obj.t {
              let f = Func {
                names: box [],
                this: Some(t.clone()),
                gen: g.len(),
                ty: Ty::Func(
                    r.iter().map(|x| x.t.clone().unwrap()).collect(),
                    Rc::new(Ty::Void), false),
                //ty: Ty::Void,
                va: None,
              };
              ptr(l.as_ref()).x = Expr::Callable(Invoke::Method(obj.clone(), f));
              let g = g.into_iter().map(|t| Some(t.clone())).collect();
              Node::new(None, Expr::Call(l, g, r))
            } else {
              panic!("{:?}", obj.t);
            }

          }
          _ => panic!(),
        }
      }

      ast::Expr::FreeCall(l, g, r) => {
        let r = self.lowerv(r);
        let f = self
          .find_symbol(l)
          .expect(&format!("Cannot find symbol {}", l));
        match &f.t {
          Some(Ty::Func(args, ret, va)) => {
            let g = match &f.x {
              Expr::Callable(Invoke::Ctx(c)) => {
                //All good
                if c.func.gen == g.len() {
                  Ty::agg(g, self)
                }
                //Needs deducing
                else {
                  if g.len() > 0 { panic!("Partial type variable not allowed") };
                  let (ret, g) = c.func.deduce_ret_from(&r);
                  if let Some(ret) = ret {
                    return Node::new(Some(ret), Expr::Call(f, g, r));
                  } else {
                    return Node::new(None, Expr::Call(f, g, r));
                  }
                }
              }
              Expr::Extern => Rc::new([]),
              _ => unreachable!(),
            };
            let args = Ty::agg_subst(&args, &g);
            let ret = ret.subst(&g);
            for (x, t) in r.iter().zip(args.iter()) {
              x.enforce(t);
            }
            Node::new(
              Some(ret),
              Expr::Call(f, g.into_iter().map(|t| Some(t.clone())).collect(), r),
            )
          }
          _ => unreachable!(),
        }
      }

      ast::Expr::Aggregate(v) => match v {
        ast::Aggregate::Constructor(n, g, v, x) => {
          panic!()
          // let x = self.lowerv(x);
          // Node::new(None, Expr::Aggregate(Aggregate::Constructor(n, Ty::aggvec(&g, self), v, x)))
        }

        ast::Aggregate::Struct(n, g, x) => {
          let (s, v): (Vec<_>, Vec<_>) =
            x.into_iter().map(|(s, x)| (*s, self.lower(x))).unzip();
          let st = self.find_named_type(n).unwrap();

          let (ty, g): (_, Rc<[_]>) = match (st.gen, g.len()) {
            (0, 0) => (Some(Ty::Adt(st.clone())), Rc::new([])),
            (n, 0) => (None, (0..n).map(|_| None).collect()),
            (n, m) if n == m => {
              let g = Ty::agg(g, self);
              (
                Some(Ty::Gadt(st.clone(), g.clone())),
                g.into_iter().map(|t| Some(t.clone())).collect(),
              )
            }
            what => unreachable!("{:?}", what),
          };

          Node::new(
            ty,
            Expr::Agg(Aggregate::Struct(st, g, s.into_boxed_slice(), v)),
          )
        }

        ast::Aggregate::Tuple(v) => {
          let v = self.lowerv(v);
          Node::new(None, Expr::Agg(Aggregate::Tuple(v)))
        }

        ast::Aggregate::Array(v) => {
          let v = self.lowerv(v);
          Node::new(None, Expr::Agg(Aggregate::Array(v)))
        }
      },

      ast::Expr::Lambda(a, x) => {
        let x = self.lower(x);
        let (a, b): (Vec<_>, Vec<_>) = a
          .iter()
          .map(|(s, t)| (s, t.as_ref().map(|t| Ty::new(&t, self))))
          .unzip();
        Node::new(
          None,
          Expr::Lambda(a.into_boxed_slice(), b.into_boxed_slice(), x),
        )
      }

      ast::Expr::Block(b) => {
        let b = self.lowerv(b);
        Node::new(Some(Ty::Void), Expr::Block(b))
      }

      ast::Expr::Ret(x) => {
        let x = x.as_ref().map(|x| {
          let re = self.lower(&x);
          re.enforce(self.func.get_ret());
          re
        });
        Node::new(Some(Ty::Void), Expr::Ret(x))
      }

      ast::Expr::Brk(x) => Node::new(Some(Ty::Void), Expr::Brk(*x)),

      ast::Expr::IfElse(c, t, f) => {
        let c = self.lower(c);
        c.enforce(&Ty::Prim(Prim::Bool));
        let t = self.lower(t);
        let f = self.lower(f);
        t.mby_enforce(&f);
        Node::new(Some(Ty::Void), Expr::IfElse(c, t, f))
      }

      ast::Expr::If(c, t) => {
        let c = self.lower(c);
        c.enforce(&Ty::Prim(Prim::Bool));
        let t = self.lower(t);
        Node::new(Some(Ty::Void), Expr::If(c, t))
      }

      ast::Expr::While(c, b) => {
        let c = self.lower(c);
        c.enforce(&Ty::Prim(Prim::Bool));
        let b = self.lower(b);
        Node::new(Some(Ty::Void), Expr::While(c, b))
        //Node::new(Some(Ty::Void), Expr::While(c, t))
      }

      ast::Expr::Forever(t) => {
        let x = self.lower(x);
        Node::new(Some(Ty::Void), Expr::Forever(x))
      }

      ast::Expr::Jmp(..) => unreachable!(),

      ast::Expr::For(v, x, b) => {
        self.locals.push(defo());
        let x = self.lower(x);
        let it = Node::new(None, Expr::Iter(x));
        self.insert_var(v, it.clone());
        let b = self.lower(b);
        self.locals.pop();
        Node::new(Some(Ty::Void), Expr::For(it, b))
      }

      ast::Expr::Let(v, t, x) => {
        let x = self.lower(x);
        t.as_ref().map(|t| {
          let t = Ty::new(&t, self);
          x.enforce(&t);
        });
        self.insert_var(v, x.clone());
        Node::new(Some(Ty::Void), Expr::Let(x))
      }

      ast::Expr::Label(s) => {
        self.labels.insert(s);
        Node::new(Some(Ty::Void), Expr::Label)
      }

      ast::Expr::Func {
        va,
        body, //Box<Expr>
        name, //Sstr,
        this, //Option<Ty>,
        gen,  //usize,
        args, //Vec<Ty>,
        ret,  //Ty,
        names, //Vec<Sstr>,
      } => {
        let ctx = if let Some(ctx) = self.below.get_mut(name) {
          ctx
        } else {
          let this = this.as_ref().map(|t| Ty::new(&t, self));
          self.assocs
            .get_mut(name)
            .expect(name)
            .iter_mut()
            .find(|ctx| ctx.func.this == this)
            .unwrap()
        };
        ptr(ctx.as_ref()).nodes = ptr(ctx.as_ref()).lowerv(body);
        Node::new(Some(Ty::Void), Expr::Skip)
      }

      ast::Expr::Extern { .. } => Node::new(Some(Ty::Void), Expr::Extern),

      ast::Expr::Type {
        sum,
        name, //Sstr,
        mems, //Vec<Ty>,
        names, //Vec<Sstr>,
        gen,  //usize,
      } => Node::new(Some(Ty::Void), Expr::Type),
    }
  }
}

impl Adt {
  fn get_mem_ty(&self, n: Sstr) -> Option<Ty> {
    self.names
      .iter()
      .enumerate()
      .find(|(i, s)| **s == n)
      .map(|(i, _)| self.tys[i].clone())
  }
}

impl Func {
  fn set_ret(&self, t: Ty) {
    let ret = self.get_ret();
    if let Ty::Void = ret {
      *ptr(ret) = t;
    } else {
      assert_eq!(ret, &t);
    }
  }

  fn set_arg(&self, i: usize, t: Ty) {
    let arg = self.get_arg(i);
    if let Ty::Void = arg {
      *ptr(arg) = t;
    } else {
      assert_eq!(arg, &t);
    }
  }

  fn get_args(&self) -> &[Ty] {
    if let Ty::Func(args, ..) = &self.ty {
      return args;
    }
    unreachable!()
  }

  fn get_ret(&self) -> &Ty {
    if let Ty::Func(_, ret, _) = &self.ty {
      return &ret;
    }
    unreachable!()
  }
  fn get_arg(&self, i: usize) -> &Ty {
    &self.get_args()[i]
  }

  fn find_arg(&self, n: Sstr) -> Option<Rc<Node>> {
    for (i, s) in self.names.iter().enumerate() {
      if *s == n {
        return Some(Node::new(Some(self.get_arg(i).clone()), Expr::Arg));
      }
    }
    if Some(n) == self.va {
      return Some(Node::new(None, Expr::Va));
    }
    None
  }

  fn solve_type_vars_for_params_and_ret(&self, params: &[Rc<Node>], ret: &Ty) -> Vec<Option<Ty>> {
    let mut re = self.solve_type_vars_for_params(params);
    self.get_ret().gather(ret, &mut re);
    re
  }

  fn solve_type_vars_for_params_and_mby_ret(&self, params: &[Rc<Node>], ret: &Option<Ty>) -> Vec<Option<Ty>> {
    let mut re = self.solve_type_vars_for_params(params);
    ret.as_ref().map(|ret| self.get_ret().gather(ret, &mut re));
    re
  }

  fn solve_type_vars_for_params(&self, params: &[Rc<Node>]) -> Vec<Option<Ty>> {
    let args = self.get_args();
    assert_eq!(params.len(), args.len());
    let tys = params.iter().map(|n| &n.t).collect::<Vec<_>>();
    let mut re: Vec<Option<Ty>> = vec![None; self.gen];
    args.iter()
      .zip(tys.iter())
      .for_each(|(t0, t1)| t0.gather_opt(t1, &mut re));
    re
  }

  fn deduce_ret_from(&self, params: &[Rc<Node>]) -> (Option<Ty>, Vec<Option<Ty>>) {
    let g = self.solve_type_vars_for_params(params);
    let known = g.iter().enumerate().fold(0, |n, (i, t)| {
      n | t.is_some().then(|| 1 << i).unwrap_or_default()
    });
    (
      if (self.get_ret().deps() | known) <= known {
        let gg = g
          .iter()
          .map(|t| t.clone().unwrap_or(Ty::Gen(usize::MAX)))
          .collect::<Rc<[_]>>();
        Some(self.get_ret().subst(&gg))
      } else {
        None
      },
      g,
    )
  }
}

impl<A, B> Tree<A, B> {
  fn visit<'a, Ret, F: Fn(&'a Tree<A, B>) -> Option<Ret>>(&'a self, f: F) -> Option<Ret> {
    if let Some(dat) = f(self) {
      Some(dat)
    } else if let Some(up) = self.above {
      unsafe { Tree::visit(&*up, f) }
    } else {
      None
    }
  }
}

impl<A, B> std::ops::DerefMut for Tree<A, B> {
  fn deref_mut(&mut self) -> &mut A {
    &mut self.data
  }
}

impl<A, B> std::ops::Deref for Tree<A, B> {
  type Target = A;
  fn deref(&self) -> &A {
    &self.data
  }
}

impl std::ops::DerefMut for Context {
  fn deref_mut(&mut self) -> &mut Inner {
    &mut self.inner
  }
}

impl std::ops::Deref for Context {
  type Target = Inner;
  fn deref(&self) -> &Inner {
    &self.inner
  }
}

impl Default for Ty {
  fn default() -> Self {
    Ty::Void
  }
}

impl std::fmt::Debug for Context {
  fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
    f.write_str(self.inner.name);
    Ok(())
  }
}

impl std::fmt::Debug for Adt {
  fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
    f.write_str(self.name);
    Ok(())
  }
}

impl Expr {
  pub fn name(&self) -> String {
    match self {
      Expr::This => "This",
      Expr::Nil => "Nil",
      Expr::Arg => "Arg",
      Expr::Va => "Va",
      Expr::Accumulator => "Accumulator",
      Expr::Counter => "Counter",
      Expr::Literal(..) => "Literal",
      Expr::Var(..) => "Var",
      Expr::Cast(..) => "Cast",
      Expr::Binary(..) => "Binary",
      Expr::Unary(..) => "Unary",
      Expr::AssignOp(..) => "AssignOp",
      Expr::Assign(..) => "Assign",
      Expr::Subscript(..) => "Subscript",
      Expr::Index(..) => "Index",
      Expr::Field(..) => "Field",
      Expr::Range(..) => "Range",
      Expr::Agg(..) => "Aggregate",
      Expr::Lambda(..) => "Lambda",
      Expr::Block(..) => "Block",
      Expr::Call(f, g, ..) => return format!("Call({} [{:?}])", f.x.name(), g),
      Expr::Callable(Invoke::Ctx(f), ..) => return f.name.to_owned(),
      Expr::Callable(..) => "Callable",
      Expr::Ret(..) => "Ret",
      Expr::Brk(..) => "Brk",
      Expr::IfElse(..) => "IfElse",
      Expr::If(..) => "If",
      Expr::While(..) => "While",
      Expr::Forever(..) => "Forever",
      Expr::Jmp(..) => "Jmp",
      Expr::For(..) => "For",
      Expr::Iter(..) => "Iter",
      Expr::Let(..) => "Let",
      Expr::Type => "Type",
      Expr::Extern => "Extern",
      Expr::Label => "Label",
      Expr::Skip => "Skip",
    }
    .to_owned()
  }
}

struct BitIterator(usize);

impl Iterator for BitIterator {
  type Item = usize;
  fn next(&mut self) -> Option<usize> {
    extern "C" {
      fn ffsll(i: usize) -> usize;
    }

    if self.0 != 0 {
      let i = unsafe { ffsll(self.0) - 1 };
      self.0 &= !(1 << i);
      Some(i)
    } else {
      None
    }
  }
}
