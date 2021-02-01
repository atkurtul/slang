use crate::ast;
pub use crate::ast::{Binding, Binop, Literal, Pattern, Prim, Sstr, Unop};
use crate::memory::*;
use crate::*;
use fxhash::FxHashMap;
use fxhash::FxHashSet;
use std::{
  hash::{Hash, Hasher},
  unreachable,
};
pub use std::{rc::*, usize};
pub type Map<K, V> = FxHashMap<K, V>;
pub type Set<K> = FxHashSet<K>;

#[derive(Debug, Clone, Default)]
pub struct TypeVariable(Rc<Set<Rc<Node>>>);

impl Hash for TypeVariable {
  fn hash<H: Hasher>(&self, state: &mut H) {
    (Rc::as_ref(&self.0) as *const _ as usize).hash(state);
  }
}

impl Hash for Node {
  fn hash<H: Hasher>(&self, state: &mut H) {
    (self as *const _ as usize).hash(state);
  }
}

pub fn deref<'a, T>(t: *const T) -> &'a mut T {
  return unsafe { &mut *(t as *mut T) };
}

impl TypeVariable {
  pub fn merge(l: &TypeVariable, r: &TypeVariable) -> TypeVariable {
    TypeVariable(Rc::new(
      l.0.iter().chain(r.0.iter()).map(|t| t.clone()).collect(),
    ))
  }

  pub fn get(&self) -> &mut Set<Rc<Node>> {
    return deref(self.0.as_ref());
  }
}

impl Eq for TypeVariable {}

impl PartialEq<Self> for TypeVariable {
  fn eq(&self, rhs: &Self) -> bool {
    Rc::as_ref(&self.0) as *const _ as usize == Rc::as_ref(&rhs.0) as *const _ as usize
  }
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
  Var(TypeVariable),
}

impl Ty {
  pub fn agg_subsitute_generics(agg: &[Ty], map: &[Ty]) -> Rc<[Ty]> {
    agg.into_iter()
      .map(|t| t.subsitute_generics(map))
      .collect()
  }

  pub fn agg_gather(t: &[Ty], map: &mut [Option<Ty>]) {
    t.iter().for_each(|t| t.gather(map))
  }

  pub fn gather(&self, map: &mut [Option<Ty>]) {
    match self {
      Ty::Gen(i) => {
        if let Some(t) = &map[*i] {
          assert_eq!(t, self);
        } else {
          map[*i] = Some(self.clone());
        }
      }
      Ty::Tuple(t) => Ty::agg_gather(t, map),
      Ty::Union(t) => Ty::agg_gather(t, map),
      Ty::Slice(t) => t.gather(map),
      Ty::Ptr(t) => t.gather(map),
      Ty::Array(l, t) => t.gather(map),
      Ty::Func(a, t, va) => {
        Ty::agg_gather(a, map);
        t.gather(map);
      }
      Ty::Adt(t) => {
        panic!();
      },
      Ty::Gadt(..) => {
        panic!();
      },
      Ty::Var(t) => {
        panic!();
      },
      Ty::Void | Ty::Prim(_) => (),
    }
  }

  pub fn subsitute_generics(&self, map: &[Ty]) -> Ty {
    match self {
      Ty::Void => Ty::Void,
      Ty::Prim(p) => Ty::Prim(*p),
      Ty::Tuple(t) => Ty::Tuple(Ty::agg_subsitute_generics(t, map)),
      Ty::Union(t) => Ty::Union(Ty::agg_subsitute_generics(t, map)),
      Ty::Slice(t) => Ty::Slice(Rc::new(t.subsitute_generics(map))),
      Ty::Ptr(t) => Ty::Ptr(Rc::new(t.subsitute_generics(map))),
      Ty::Array(l, t) => Ty::Array(*l, Rc::new(t.subsitute_generics(map))),
      Ty::Gen(x) => map[*x].clone(),
      Ty::Func(a, t, va) => Ty::Func(
        Ty::agg_subsitute_generics(a, map),
        Rc::new(t.subsitute_generics(map)),
        *va,
      ),
      Ty::Adt(t) if t.gen == 0 => self.clone(),
      _ => panic!("{:?}", self),
    }
  }

  pub fn satisfies(&self, r: &Ty) -> bool {
    match self {
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

  pub fn agg(v: &[ast::Ty], ctx: &Context) -> Rc<[Ty]> {
    v.iter().map(|t| Ty::new(t, ctx)).collect()
  }

  pub fn boxed(ty: &Box<ast::Ty>, ctx: &Context) -> Rc<Ty> {
    Rc::new(Ty::new(ty, ctx))
  }

  pub fn new(ty: &ast::Ty, ctx: &Context) -> Ty {
    match ty {
      ast::Ty::Void => Ty::Void,
      ast::Ty::Prim(t) => Ty::Prim(*t),
      ast::Ty::Tuple(t) => Ty::Tuple(Ty::agg(t, ctx)),
      ast::Ty::Union(t) => Ty::Union(Ty::agg(t, ctx)),
      ast::Ty::Slice(t) => Ty::Slice(Ty::boxed(t, ctx)),
      ast::Ty::Ptr(t) => Ty::Ptr(Ty::boxed(t, ctx)),
      ast::Ty::Array(l, t) => Ty::Array(*l, Ty::boxed(t, ctx)),
      ast::Ty::Adt(s) => Ty::Adt(ctx.find_named_type(s).expect(s)),
      ast::Ty::Gen(x) => Ty::Gen(*x),
      ast::Ty::Gadt(n, g) => Ty::Gadt(ctx.find_named_type(n).unwrap(), Ty::agg(g, ctx)),
      ast::Ty::Func(args, ret, va) => Ty::Func(Ty::agg(args, ctx), Ty::boxed(ret, ctx), *va),
    }
  }

  pub fn solved(&self) -> bool {
    match self {
      Ty::Void => true,
      Ty::Prim(t) => true,
      Ty::Tuple(t) => t.iter().fold(true, |x, y| x && y.solved()),
      Ty::Union(t) => t.iter().fold(true, |x, y| x && y.solved()),
      Ty::Slice(t) => t.solved(),
      Ty::Ptr(t) => t.solved(),
      Ty::Array(l, t) => t.solved(),
      Ty::Adt(s) => s.gen == 0,
      Ty::Gen(_) => true,
      Ty::Gadt(n, g) => g.iter().fold(true, |x, y| x && y.solved()),
      Ty::Func(args, ret, _) => {
        args.iter().fold(true, |x, y| x && y.solved()) && ret.solved()
      }
      Ty::Var(_) => false,
    }
  }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Aggregate {
  Struct(Rc<Adt>, 
    Rc<[Ty]>, // Gradually filled
    Box<[Sstr]>, 
    Box<[Rc<Node>]>),
  Tuple(Vec<Rc<Node>>),
  Array(Vec<Rc<Node>>),
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

  Range(Rc<Node>, Rc<Node>),

  Aggregate(Aggregate),
  Lambda(Vec<(Sstr, Option<Ty>)>, Rc<Node>),
  Block(Vec<Rc<Node>>),

  Call(Rc<Node>, Rc<[Ty]>, Vec<Rc<Node>>),
  Ctx(Rc<Context>),
  Method(Rc<Node>, Sstr),

  Ret,   //(Option<Rc<Node>>),
  Brk,   //(Option<Sstr>),
  IfElse, //(Rc<Node>, Rc<Node>, Rc<Node>),
  If,   //(Rc<Node>, Rc<Node>),
  While,  //(Rc<Node>, Rc<Node>),
  Forever, //(Rc<Node>),
  Jmp,   //(Rc<Node>, Vec<(Pattern, Node)>),
  For,   //(Binding, Rc<Node>, Rc<Node>),
  Let(Rc<Node>),
  Type,
  Extern,
  Label,
  Skip,
}

impl VarStack {
  pub fn root() -> Self {
    defo()
  }
  pub fn get(&self, n: Sstr) -> Option<Rc<Node>> {
    if let Some(v) = self.data.get(n) {
      Some(v.last().cloned().unwrap())
    } else {
      self.above.as_ref().map(|s| s.get(n)).unwrap_or(None)
    }
  }
  pub fn insert(&mut self, n: Sstr, x: Rc<Node>) {
    self.data.entry(n).or_default().push(x);
  }
}

#[derive(Debug, Clone, Default, Eq, PartialEq)]
pub struct VarStack {
  pub above: Option<Rc<VarStack>>,
  pub below: Vec<Rc<VarStack>>,
  pub data: Map<Sstr, Vec<Rc<Node>>>,
}

#[derive(Debug, Clone, Default, Eq, PartialEq)]
pub struct Context {
  pub name: Sstr,
  pub above: Option<*const Context>,
  pub below: Map<Sstr, Rc<Context>>,
  pub assocs: Map<Sstr, Vec<Rc<Context>>>,
  pub records: Map<Sstr, Rc<Adt>>,
  pub extsymbols: Map<Sstr, Rc<Node>>,
  pub locals: VarStack,
  pub labels: Set<Sstr>,
  pub nodes: Vec<Rc<Node>>,
  pub represents: Rc<Func>,
}

#[derive(Debug, Clone, Default, Eq, PartialEq)]
pub struct Func {
  va: Option<Sstr>,
  ty: Ty,
  names: Box<[Sstr]>,
  this: Option<Ty>,
  gen: usize,
}

impl Func {
  pub fn get_args(&self) -> Rc<[Ty]> {
    if let Ty::Func(args, ..) = &self.ty {
      return args.clone();
    }
    unreachable!()
  }
  pub fn get_ret(&self) -> &Ty {
    if let Ty::Func(_, ret, _) = &self.ty {
      return &ret;
    }
    unreachable!()
  }
  pub fn get_arg(&self, i: usize) -> Ty {
    if let Ty::Func(args, ..) = &self.ty {
      return args[i].clone();
    }
    unreachable!()
  }
}

impl Default for Ty {
  fn default() -> Self {
    Ty::Void
  }
}

impl Context {
  pub fn new(x: Vec<ast::Expr>) -> Context {
    let mut ctx = Context::default();
    ctx.collect(&x);
    ctx.lowerv(&x);
    ctx.check();
    ctx
  }

  fn check(&self) {
    self.nodes.iter().for_each(|x| x.try_solve());
    self.below.iter().for_each(|(_, x)| x.check());
    self.assocs
      .iter()
      .for_each(|(_, x)| x.iter().for_each(|x| x.check()));
  }

  fn new_node(&self, t: Option<Ty>, x: Expr) -> Rc<Node> {
    let t = t.unwrap_or_else(|| Ty::Var(defo()));
    let x = Rc::new(Node { t, x });
    ptr(self).nodes.push(x.clone());
    x
  }

  pub fn collect(&mut self, x: &Vec<ast::Expr>) {
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
            types: box [],
            names: names.into_iter().cloned().collect(),
            gen: *gen,
            sum: *sum,
          });
          if let Some(st) = self.records.insert(name, st) {
            panic!();
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
            let node = self.new_node(Some(Ty::new(ty, self)), Expr::Extern);
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
          let mut ctx = Context {
            name,
            above: Some(self),
            represents: Rc::new(Func {
              va: *va,
              gen: *gen,
              names: names.iter().cloned().collect(),
              this: this.as_ref().map(|t| Ty::new(&t, self)),
              ty: Ty::Func(
                args.into_iter().map(|t| Ty::new(t, self)).collect(),
                Rc::new(Ty::new(ret, self)),
                va.is_some(),
              ),
            }),
            ..defo()
          };

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
          ptr::<Adt>(&**self.records.get_mut(name).unwrap()).types = types;
        }
        _ => (),
      }
    }
  }

  pub fn insert_var(&mut self, var: &Binding, x: Rc<Node>) {
    match var {
      Binding::Ignore => (),
      Binding::Ident(s) => {
        self.locals.insert(s, x);
      }
      Binding::Tuple(v) => {
        for (i, var) in v.into_iter().enumerate() {
          let x = self.new_node(None, Expr::Index(x.clone(), i));
          self.insert_var(var, x);
        }
      }
    }
  }

  fn lowerv(&mut self, x: &Vec<ast::Expr>) -> Vec<Rc<Node>> {
    let mut re = vec![];
    for x in x {
      re.push(self.lower(x));
    }
    re
  }

  pub fn lowerv_as_root(&mut self, x: &Vec<ast::Expr>) {
    let x = self.lowerv(x);
    self.nodes = x;
  }

  fn find_assoc(&self, st: Sstr) -> Option<&[Rc<Context>]> {
    if let Some(ctx) = self.assocs.get(st) {
      Some(ctx)
    } else if let Some(ctx) = self.above {
      unsafe { (*ctx).find_assoc(st) }
    } else {
      None
    }
  }

  fn find_named_type(&self, st: Sstr) -> Option<Rc<Adt>> {
    if let Some(st) = self.records.get(st) {
      Some(st.clone())
    } else if let Some(ctx) = self.above {
      unsafe { (*ctx).find_named_type(st) }
    } else {
      None
    }
  }

  fn find_func(&self, f: Sstr) -> Option<Rc<Node>> {
    if let Some(ctx) = self.below.get(f) {
      Some(self.new_node(Some(ctx.represents.ty.clone()), Expr::Ctx(ctx.clone())))
    } else if let Some(ctx) = self.above {
      unsafe { (*ctx).find_func(f) }
    } else {
      None
    }
  }

  fn find_extern(&self, f: Sstr) -> Option<Rc<Node>> {
    if let Some(sym) = self.extsymbols.get(f) {
      Some(sym.clone())
    } else if let Some(ctx) = self.above {
      unsafe { (*ctx).find_extern(f) }
    } else {
      None
    }
  }

  fn find_symbol(&self, n: Sstr) -> Option<Rc<Node>> {
    //println!("Looking for {} {:?} {:?}", n, self.extsymbols, self.above);
    self.find_arg(n)
      .or(self.find_func(n))
      .or(self.find_extern(n))
  }

  fn find_arg(&self, n: Sstr) -> Option<Rc<Node>> {
    for (i, s) in self.represents.names.iter().enumerate() {
      if *s == n {
        return Some(self.new_node(Some(self.represents.get_arg(i)), Expr::Arg));
      }
    }
    if Some(n) == self.represents.va {
      return Some(self.new_node(None, Expr::Va));
    }
    None
  }

  fn find_var(&self, n: Sstr) -> Option<Rc<Node>> {
    self.locals.get(n).or(self.find_arg(n))
  }

  pub fn lower(&mut self, x: &ast::Expr) -> Rc<Node> {
    match x {
      ast::Expr::This => self.new_node(
        Some(self.represents.this.as_ref().unwrap().clone()),
        Expr::This,
      ),

      ast::Expr::Nil => self.new_node(None, Expr::Nil),

      ast::Expr::Literal(n) => self.new_node(
        Some(match n {
          Literal::Int(_) => Ty::Prim(Prim::Int),
          Literal::Real(_) => Ty::Prim(Prim::Real),
          Literal::Str(_) => Ty::Prim(Prim::Str),
        }),
        Expr::Literal(*n),
      ),

      ast::Expr::Var(s) => {
        let node = self.find_var(s).unwrap();
        let re = self.new_node(None, Expr::Var(s, node.clone()));
        re.unify_ty(&node.t);
        re
      }

      ast::Expr::Binary(op, l, r) => {
        let l = self.lower(l);
        let r = self.lower(r);
        l.unify_ty(&r.t);
        match op {
          Binop::Lt
          | Binop::Le
          | Binop::Ge
          | Binop::Gt
          | Binop::Eq
          | Binop::Neq
          | Binop::And => self.new_node(Some(Ty::Prim(Prim::Bool)), Expr::Binary(*op, l.clone(), r)),
          _ => {
            println!("Type of left {:?} {:?}", l.t, l.x);
            self.new_node(Some(l.t.clone()), Expr::Binary(*op, l.clone(), r))
          }
        }
      }

      ast::Expr::Unary(op, x) => {
        let l = self.lower(x);
        let x = self.new_node(None, Expr::Unary(*op, l.clone()));
        match op {
          Unop::Deref => {
            //println!("Unifying {:?} [@@DEREF@@] {:?} {:?}", x, x.t, l.t);
            x.unify_ty(match &l.t {
              Ty::Ptr(t) => t,
              _ => unreachable!(),
            })
          }
          Unop::Addrof => x.unify_ty(&Ty::Ptr(Rc::new(l.t.clone()))),
          _ => x.unify_ty(&l.t),
        }
        x
      }

      ast::Expr::Cast(t, x) => {
        let t = Ty::new(&t, self);
        let l = self.lower(x);
        self.new_node(Some(t.clone()), Expr::Cast(t, l))
      }

      ast::Expr::Fold => self.new_node(None, Expr::Accumulator),

      ast::Expr::Accumulator => {
        // let l = self. lower(*x);
        // let x = self.new_node(None, Expr::Accumulator(l));
        // unify(x, l);
        // x
        self.new_node(None, Expr::Accumulator)
      }

      ast::Expr::Counter => self.new_node(Some(Ty::Prim(Prim::Long)), Expr::Counter),

      ast::Expr::AssignOp(op, l, r) => {
        let l = self.lower(l);
        let r = self.lower(r);
        l.unify_ty(&r.t);
        self.new_node(None, Expr::AssignOp(*op, l, r))
      }

      ast::Expr::Assign(l, r) => {
        let l = self.lower(l);
        let r = self.lower(r);
        l.unify_ty(&r.t);
        self.new_node(None, Expr::Assign(l, r))
      }

      ast::Expr::Subscript(l, r) => {
        let l = self.lower(l);
        let r = self.lower(r);
        self.new_node(None, Expr::Subscript(l, r))
      }

      ast::Expr::TupleIndex(x, i) => {
        let x = self.lower(x);
        self.new_node(None, Expr::Index(x, *i))
      }

      ast::Expr::Member(x, i) => {
        let x = self.lower(x);

        if let Ty::Adt(t) = &x.t {
          if let Some(t) = t.get_mem_ty(i) {
            return self.new_node(Some(t), Expr::Field(x, *i));
          }
        }
        if let Ty::Gadt(t, g) = &x.t {
          if let Some(t) = t.get_mem_ty(i) {
            let t = t.subsitute_generics(&g);
            return self.new_node(Some(t), Expr::Field(x, *i));
          }
        }
        if let Some(f) = self.find_assoc(i) {
          for f in f {
            if f.represents.this.as_ref().unwrap().satisfies(&x.t) {
              return self
                .new_node(Some(f.represents.ty.clone()), Expr::Method(x, *i));
            }
          }
        }
        self.new_node(None, Expr::Field(x, *i))
      }

      ast::Expr::Range(l, r) => {
        let l = self.lower(l);
        let r = self.lower(r);
        l.unify_ty(&r.t);
        self.new_node(None, Expr::Range(l, r))
      }

      ast::Expr::Call(l, g, r) => {
        let l = self.lower(l);
        let r = self.lowerv(r);
        match &l.t {
          Ty::Func(args, ret, va) => {
            let g = g.as_ref().map(|v| v.as_slice()).unwrap_or(&[]);
            let g = Ty::agg(g, self);
            let args = Ty::agg_subsitute_generics(args, &g);
            let ret = Ty::subsitute_generics(ret, &g);
            for (x, t) in r.iter().zip(args.iter()) {
              x.unify_ty(t);
            }
            self.new_node(Some(ret), Expr::Call(l, g, r))
          }
          what => unreachable!(),
        }
      }

      ast::Expr::FreeCall(l, g, r) => {
        let r = self.lowerv(r);
        let f = self
          .find_symbol(l)
          .expect(&format!("Cannot find symbol {}", l));
        match &f.t {
          Ty::Func(args, ret, va) => {
            let g = g.as_ref().map(|v| v.as_slice()).unwrap_or(&[]);
            let g = Ty::agg(g, self);
            let args = Ty::agg_subsitute_generics(args, &g);
            let ret = Ty::subsitute_generics(ret, &g);
            for (x, t) in r.iter().zip(args.iter()) {
              x.unify_ty(t);
            }
            self.new_node(Some(ret), Expr::Call(f, g, r))
          }
          _ => unreachable!(),
        }
      }

      ast::Expr::Aggregate(v) => match v {
        ast::Aggregate::Constructor(n, g, v, x) => {
          panic!()
          // let x = self.lowerv(x);
          // self.new_node(None, Expr::Aggregate(Aggregate::Constructor(n, Ty::aggvec(&g, self), v, x)))
        }

        ast::Aggregate::Struct(n, g, x) => {
          let (s, v): (Vec<_>, Vec<_>) = x.into_iter().map(|(s, x)| (*s, self.lower(x))).unzip();
          let st = self.find_named_type(n).unwrap();

          let (ty, g): (_, Rc::<[_]>) = match (st.gen, g.len()) {
            (0, 0) => (Some(Ty::Adt(st.clone())), Rc::new([])),
            (n, 0) => (None, (0..n).map(|_| Ty::Var(defo())).collect()),
            (n, m) if n == m => {
              let g = Ty::agg(g, self);
              (Some(Ty::Gadt(st.clone(), g.clone())), g)
            }
            what => unreachable!("{:?}", what)
          };
          for x in v.iter() {
            println!("\n\n----\n{:?}\n-----\n\n", x.t);
          }
          self.new_node(
            ty,
            Expr::Aggregate(Aggregate::Struct(
              st,
              g,
              s.into_boxed_slice(), 
              v.into_boxed_slice(), 
            )),
          )
        }

        ast::Aggregate::Tuple(v) => {
          let v = self.lowerv(v);
          self.new_node(None, Expr::Aggregate(Aggregate::Tuple(v)))
        }

        ast::Aggregate::Array(v) => {
          let v = self.lowerv(v);
          self.new_node(None, Expr::Aggregate(Aggregate::Array(v)))
        }
      },

      ast::Expr::Lambda(a, x) => {
        let x = self.lower(x);
        self.new_node(
          None,
          Expr::Lambda(
            a.iter()
              .map(|(s, t)| (*s, t.as_ref().map(|t| Ty::new(&t, self))))
              .collect(),
            x,
          ),
        )
      }

      ast::Expr::Block(b) => {
        let b = self.lowerv(b);
        self.new_node(Some(Ty::Void), Expr::Block(b))
      }

      ast::Expr::Ret(x) => {
        let x = x.as_ref().map(|x| {
          let re = self.lower(&x);
          re.unify_ty(self.represents.get_ret())
        });
        self.new_node(Some(Ty::Void), Expr::Ret)
      }

      ast::Expr::Brk(x) => self.new_node(None, Expr::Brk),

      ast::Expr::IfElse(c, t, f) => {
        let c = self.lower(c);
        c.unify_ty(&Ty::Prim(Prim::Bool));
        let t = self.lower(t);
        let f = self.lower(f);
        self.new_node(Some(Ty::Void), Expr::IfElse)
      }

      ast::Expr::If(c, t) => {
        let c = self.lower(c);
        c.unify_ty(&Ty::Prim(Prim::Bool));
        let t = self.lower(t);
        self.new_node(Some(Ty::Void), Expr::If)
      }

      ast::Expr::While(c, t) => {
        let c = self.lower(c);
        c.unify_ty(&Ty::Prim(Prim::Bool));
        let t = self.lower(t);
        self.new_node(Some(Ty::Void), Expr::While)
        //self.new_node(Some(Ty::Void), Expr::While(c, t))
      }

      ast::Expr::Forever(t) => {
        let t = self.lower(t);
        self.new_node(Some(Ty::Void), Expr::Forever)
      }

      ast::Expr::Jmp(..) => unreachable!(),

      ast::Expr::For(v, x, b) => {
        let x = self.lower(x);
        self.new_node(Some(Ty::Void), Expr::For)
      }

      ast::Expr::Let(v, t, x) => {
        let x = self.lower(x);
        t.as_ref().map(|t| {
          let t = Ty::new(&t, self);
          x.unify_ty(&t);
        });
        self.insert_var(v, x.clone());
        self.new_node(Some(Ty::Void), Expr::Let(x))
      }

      ast::Expr::Label(s) => {
        self.labels.insert(s);
        self.new_node(Some(Ty::Void), Expr::Label)
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
            .find(|ctx| ctx.represents.this == this)
            .unwrap()
        };
        deref(&**ctx).lowerv_as_root(body);
        defo()
      }

      ast::Expr::Extern { .. } => self.new_node(Some(Ty::Void), Expr::Extern),

      ast::Expr::Type {
        sum,
        name, //Sstr,
        mems, //Vec<Ty>,
        names, //Vec<Sstr>,
        gen,  //usize,
      } => self.new_node(Some(Ty::Void), Expr::Type),
    }
  }
}

#[derive(Debug, Clone, Eq, PartialEq, Hash)]
pub struct Adt {
  name: Sstr,
  names: Box<[Sstr]>,
  types: Box<[Ty]>,
  gen: usize,
  sum: bool,
}


impl Adt {
  fn get_mem_ty(&self, n: Sstr) -> Option<Ty> {
    self.names
      .iter()
      .enumerate()
      .find(|(i, s)| **s == n)
      .map(|(i, _)| self.types[i].clone())
  }

  fn solve_type_vars_for_members(&self, members: &[Rc<Node>]) -> Vec<Option<Ty>> {
    assert_eq!(members.len(), self.types.len());
    let mut re: Vec<Option<Ty>> = vec![None;self.gen];
    for n in members.iter() {
      //println!("{:?}", n);
      n.t.gather(&mut re);
    }
    re
  }
}

#[derive(Debug, Clone, Default, Eq, PartialEq)]
pub struct Node {
  t: Ty,
  x: Expr,
}

impl Default for Expr {
  fn default() -> Self {
    Expr::Skip
  }
}

pub fn xunify(mut lhs: &Ty, mut rhs: &Ty) {
  match (lhs, rhs) {
    (Ty::Var(l), Ty::Var(r)) => {
      if l != r {
        let new = TypeVariable::merge(l, r);
        *ptr(lhs) = Ty::Var(new.clone());
        *ptr(rhs) = Ty::Var(new);
      }
    }
    (Ty::Var(l), r) => {
      for node in l.0.iter() {
        deref(&**node).t = r.clone();
      }
      *ptr(lhs) = r.clone();
    }
    (l, Ty::Var(r)) => xunify(rhs, lhs),
    (Ty::Prim(l), Ty::Prim(r)) => assert_eq!(l, r),
    (Ty::Void, Ty::Void) => (),
    (Ty::Ptr(l), Ty::Ptr(r)) => xunify(l, r),
    (l, r) => assert_eq!(l, r),
  }
}

impl Node {
  pub fn unify_ty(&self, t: &Ty) {
    //println!("Unifying {:?} {:?}", self.x, t);
    match (&self.x, t.clone()) {
      (Expr::Unary(Unop::Addrof, n), Ty::Ptr(t)) => n.unify_ty(&t),
      (Expr::Unary(Unop::Deref, n), t) => {
        //println!("HERE");
        n.unify_ty(&Ty::Ptr(Rc::new(t)));
      }
      (Expr::Unary(_, n), _) => n.unify_ty(t),
      (Expr::Binary(o, l, r), _) => match o {
        Binop::Lt
        | Binop::Le
        | Binop::Ge
        | Binop::Gt
        | Binop::Eq
        | Binop::Neq
        | Binop::And => assert_eq!(t, &Ty::Prim(Prim::Bool)),
        _ => {
          l.unify_ty(t);
          r.unify_ty(t);
        }
      },
      (Expr::Counter, Ty::Prim(Prim::Int)) => (),
      (
        Expr::AssignOp(..)
        | Expr::Assign(..)
        | Expr::Block(..)
        | Expr::Ret
        | Expr::Brk
        | Expr::IfElse
        | Expr::If
        | Expr::While
        | Expr::Forever
        | Expr::Jmp
        | Expr::For
        | Expr::Let(..)
        | Expr::Type
        | Expr::Extern
        | Expr::Label
        | Expr::Skip,
        Ty::Void,
      ) => (),
      (Expr::This | Expr::Arg | Expr::Va, t) => {
        assert_eq!(self.t, t, "{:?}", self)
      }
      (Expr::Nil, t) => {
        if let Ty::Ptr(_) = t {
          ptr(self).t = t;
        } else {
          panic!()
        }
      }
      (_, t) => (),
    }
    xunify(&self.t, t);
  }

  pub fn try_solve(&self) {
    match &self.x {
      // Expr::Let(x) => x.try_solve(),
      Expr::Aggregate(x) => {
        match x {
          Aggregate::Struct(t, g, _, m) if g.len() > 0 => {
            // println!("Solving {:?} {:?}", t, g.len());
            // println!("{:#?}", m);
            assert_eq!(t.gen, g.len());

            let sol = t.solve_type_vars_for_members(m);

            for (l, r) in g.iter().zip(sol.iter()) {
              if let Some(r) = r {
                xunify(l,r);
              }
            }

            //If the solution gave us the previously unknown type variables 
            if g.iter().filter(|t| match t { Ty::Var(_) => false, _ => true }).count() == t.gen {
              self.unify_ty(&Ty::Gadt(t.clone(), g.clone()))
            }
          }
          _ => unimplemented!()
        }
      }
      _ => (),
    }
    assert!(self.t.solved())
  }
}
