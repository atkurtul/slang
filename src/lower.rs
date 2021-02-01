use crate::ast;
pub use crate::ast::{Binding, Binop, Literal, Pattern, Prim, Sstr, Unop};
use crate::memory::*;
use crate::*;
use fxhash::FxHashMap;
use fxhash::FxHashSet;
use std::{
  hash::{Hash, Hasher},
  unimplemented, unreachable,
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
  // Alias(Rc<Ty>),
  Adt(Rc<Adt>),
  Gadt(Rc<Adt>, Rc<[Ty]>),
  Gen(usize),
  Var(TypeVariable),
}

impl Ty {
  pub fn autoderef(&self) -> Option<&Ty> {
    match self {
      Ty::Adt(_) | Ty::Gadt(..) => Some(self),
      Ty::Ptr(t) => t.autoderef(),
      _ => None,
    }
  }

  pub fn agg_subsitute_generics(agg: &[Ty], map: &[Ty]) -> Rc<[Ty]> {
    agg.into_iter().map(|t| t.subsitute_generics(map)).collect()
  }

  pub fn agg_gather(t: &[Ty], t1: &[Ty], map: &mut [Option<Ty>]) {
    t.iter()
      .zip(t1.iter())
      .for_each(|(t, t1)| t.gather(t1, map))
  }
  pub fn agg_gather2(t: &[Ty], t1: Vec<&Ty>, map: &mut [Option<Ty>]) {
    t.iter()
      .zip(t1.iter())
      .for_each(|(t, t1)| t.gather(t1, map))
  }
  pub fn deps(&self, bit: &mut usize) {
    match self {
      Ty::Gen(i) => {
        *bit |= 1 << i;
      }
      Ty::Tuple(t) => t.iter().for_each(|t| t.deps(bit)),
      Ty::Union(t) => t.iter().for_each(|t| t.deps(bit)),
      Ty::Slice(t) => t.deps(bit),
      Ty::Ptr(t) => t.deps(bit),
      Ty::Array(l, t) => t.deps(bit),
      Ty::Func(a, t, va) => {
        a.iter().for_each(|t| t.deps(bit));
        t.deps(bit);
      }
      Ty::Adt(t) => {
        assert_eq!(t.gen, 0);
      }
      Ty::Gadt(t, g) => g.iter().for_each(|t| t.deps(bit)),
      //Ty::Alias(t) => t.deps(bit),
      Ty::Var(t) => {
        panic!();
      }
      Ty::Void | Ty::Prim(_) => (),
    }
  }

  pub fn gather(&self, eq: &Ty, map: &mut [Option<Ty>]) {
    match (self, eq) {
      (Ty::Gen(i), _) => {
        if let Some(t) = &map[*i] {
          xunify(t, eq);
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
      Ty::Gadt(t, g) => Ty::Gadt(t.clone(), Ty::agg_subsitute_generics(g, map)),
      //Ty::Alias(t) => t.subsitute_generics(map),
      _ => panic!("{:?}", self),
    }
  }

  pub fn satisfies(&self, r: &Ty) -> bool {
    // if let Ty::Alias(t) = r {
    //  return self.satisfies(t);
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
      //Ty::Alias(t) => t.solved(),
      Ty::Var(_) => false,
    }
  }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Aggregate {
  Struct(
    Rc<Adt>,
    Rc<[Ty]>, // Gradually filled
    Box<[Sstr]>,
    Box<[Rc<Node>]>,
  ),
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
  Block(Vec<Rc<Node>>),

  Aggregate(Aggregate),
  Lambda(Vec<(Sstr, Option<Ty>)>, Rc<Node>),

  Call(Rc<Node>, Rc<[Ty]>, Vec<Rc<Node>>),

  Ctx(Rc<Context>),

  Ret(Option<Rc<Node>>),
  Brk, //(Option<Sstr>),
  IfElse(Rc<Node>, Rc<Node>, Rc<Node>),
  If(Rc<Node>, Rc<Node>),
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

impl Expr {
  pub fn name(&self) -> Sstr {
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
      Expr::Aggregate(..) => "Aggregate",
      Expr::Lambda(..) => "Lambda",
      Expr::Block(..) => "Block",
      Expr::Call(..) => "Call",
      Expr::Ctx(..) => "Ctx",
      Expr::Ret(..) => "Ret",
      Expr::Brk => "Brk",
      Expr::IfElse(..) => "IfElse",
      Expr::If(..) => "If",
      Expr::While => "While",
      Expr::Forever => "Forever",
      Expr::Jmp => "Jmp",
      Expr::For => "For",
      Expr::Let(..) => "Let",
      Expr::Type => "Type",
      Expr::Extern => "Extern",
      Expr::Label => "Label",
      Expr::Skip => "Skip",
    }
  }
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

#[derive(Clone, Default, Eq, PartialEq)]
pub struct Context {
  pub name: Sstr,
  pub above: Option<*const Context>,
  pub below: Map<Sstr, Rc<Context>>,
  pub assocs: Map<Sstr, Vec<Rc<Context>>>,
  pub records: Map<Sstr, Rc<Adt>>,
  pub aliases: Map<Sstr, Ty>,
  pub extsymbols: Map<Sstr, Rc<Node>>,
  pub locals: VarStack,
  pub labels: Set<Sstr>,
  pub nodes: Vec<Rc<Node>>,
  pub represents: Rc<Func>,
}

impl std::fmt::Debug for Context {
  fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
    f.write_str(self.name);
    Ok(())
  }
}

impl std::fmt::Debug for Adt {
  fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
    f.write_str(self.name);
    Ok(())
  }
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
  pub fn get_args(&self) -> &[Ty] {
    if let Ty::Func(args, ..) = &self.ty {
      return args;
    }
    unreachable!()
  }
  pub fn get_ret(&self) -> &Ty {
    if let Ty::Func(_, ret, _) = &self.ty {
      return &ret;
    }
    unreachable!()
  }
  pub fn get_arg(&self, i: usize) -> &Ty {
    &self.get_args()[i]
  }

  pub fn solve_type_vars_for_params_and_ret(&self, params: &[Rc<Node>], ret: &Ty) -> Vec<Option<Ty>> {
    let mut re = self.solve_type_vars_for_params(params);
    self.get_ret().gather(ret, &mut re);
    re
  }

  pub fn solve_type_vars_for_params(&self, params: &[Rc<Node>]) -> Vec<Option<Ty>> {
    let args = self.get_args();
    assert_eq!(params.len(), args.len());
    let tys = params.iter().map(|n| &n.t).collect::<Vec<_>>();
    let mut re: Vec<Option<Ty>> = vec![None; self.gen];
    //println!("Solving for {:?} = {:?}", args, tys);
    Ty::agg_gather2(args, tys, &mut re);
    re
  }

  // fn generic_func[x,y,z](T0[x,y], T1[y,z], T2[z,x]) -> T3[x,y,z]
  // T3[x,y,z] is deducable from any 2 combination of args
  fn deduce_ret_from(&self, params: &[Rc<Node>]) -> (Option<Ty>, Rc<[Ty]>) {
    let g = self.solve_type_vars_for_params(params);
    let mut deps = 0;
    self.get_ret().deps(&mut deps);
    let known = g.iter().enumerate().fold(0, |n, (i, t)| {
      n | t.is_some().then(|| 1 << i).unwrap_or_default()
    });
    //println!("{:b} {:b}", deps, known);
    let g = g
      .into_iter()
      .map(|t| t.unwrap_or(Ty::Var(defo())))
      .collect::<Rc<[_]>>();
    (
      if (deps | known) <= known {
        Some(self.get_ret().subsitute_generics(&g))
      } else {
        None
      },
      g,
    )
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
    ctx.nodes = ctx.lowerv(&x);
    ctx.check(false);
    ctx.check(true);
    ctx
  }

  fn check(&self, a: bool) {
    self.nodes.iter().for_each(|x| x.try_solve(a));
    self.below.iter().for_each(|(_, x)| x.check(a));
    self.assocs
      .iter()
      .for_each(|(_, x)| x.iter().for_each(|x| x.check(a)));
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
            let node = Node::new((Ty::new(ty, self)), Expr::Extern);
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
        ast::Expr::Alias(t, n) => {
          *ptr(self).aliases.get_mut(n).unwrap() = Ty::new(t, self);
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
          let x = Node::new(Ty::Var(defo()), Expr::Index(x.clone(), i));
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

  fn find_alias(&self, s: Sstr) -> Option<Ty> {
    if let Some(t) = self.aliases.get(s) {
      Some(t.clone())
    } else if let Some(ctx) = self.above {
      unsafe { (*ctx).find_alias(s) }
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
      Some(Node::new(
        (ctx.represents.ty.clone()),
        Expr::Ctx(ctx.clone()),
      ))
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
        return Some(Node::new((self.represents.get_arg(i).clone()), Expr::Arg));
      }
    }
    if Some(n) == self.represents.va {
      return Some(Node::new(Ty::Var(defo()), Expr::Va));
    }
    None
  }

  fn find_var(&self, n: Sstr) -> Option<Rc<Node>> {
    self.locals.get(n).or(self.find_arg(n))
  }

  pub fn lower(&mut self, x: &ast::Expr) -> Rc<Node> {
    match x {
      ast::Expr::This => {
        Node::new(self.represents.this.as_ref().unwrap().clone(), Expr::This)
      }

      ast::Expr::Nil => Node::new(Ty::Var(defo()), Expr::Nil),

      ast::Expr::Literal(n) => Node::new(
        match n {
          Literal::Int(_) => Ty::Prim(Prim::Int(true)),
          Literal::Real(_) => Ty::Prim(Prim::Real),
          Literal::Str(_) => Ty::Prim(Prim::Str),
        },
        Expr::Literal(*n),
      ),

      ast::Expr::Var(s) => {
        let node = self.find_var(s).unwrap();
        let re = Node::new(Ty::Var(defo()), Expr::Var(s, node.clone()));
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
          | Binop::And => {
            Node::new((Ty::Prim(Prim::Bool)), Expr::Binary(*op, l.clone(), r))
          }
          _ => {
            //println!("Type of left {:?} {:?}", l.t, l.x);
            Node::new((l.t.clone()), Expr::Binary(*op, l.clone(), r))
          }
        }
      }

      ast::Expr::Unary(op, x) => {
        let l = self.lower(x);
        let x = Node::new(Ty::Var(defo()), Expr::Unary(*op, l.clone()));
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
        Node::new((t.clone()), Expr::Cast(t, l))
      }

      ast::Expr::Accumulator => Node::new(Ty::Var(defo()), Expr::Accumulator),

      ast::Expr::Counter => Node::new((Ty::Prim(Prim::Long(true))), Expr::Counter),

      ast::Expr::AssignOp(op, l, r) => {
        let l = self.lower(l);
        let r = self.lower(r);
        l.unify_ty(&r.t);
        Node::new(Ty::Void, Expr::AssignOp(*op, l, r))
      }

      ast::Expr::Assign(l, r) => {
        let l = self.lower(l);
        let r = self.lower(r);
        l.unify_ty(&r.t);
        Node::new(Ty::Void, Expr::Assign(l, r))
      }

      ast::Expr::Subscript(l, r) => {
        let l = self.lower(l);
        let r = self.lower(r);
        Node::new(Ty::Var(defo()), Expr::Subscript(l, r))
      }

      ast::Expr::TupleIndex(x, i) => {
        let x = self.lower(x);
        Node::new(Ty::Var(defo()), Expr::Index(x, *i))
      }

      ast::Expr::Member(x, i) => {
        let x = self.lower(x);
        let mut t = &x.t;

        match t.autoderef() {
          Some(Ty::Adt(t)) => {
            if let Some(t) = t.get_mem_ty(i) {
              return Node::new(t, Expr::Field(x, *i));
            }
          }
          Some(Ty::Gadt(t, g)) => {
            if let Some(t) = t.get_mem_ty(i) {
              let t = t.subsitute_generics(&g);
              return Node::new(t, Expr::Field(x, *i));
            }
          }
          _ => ()
        }

        if let Some(f) = self.find_assoc(i) {
          for f in f {
            if f.represents.this.as_ref().unwrap().satisfies(&x.t) {
              return Node::new(f.represents.ty.clone(), Expr::Ctx(f.clone()));
            }
          }
        }

        Node::new(Ty::Var(defo()), Expr::Field(x, *i))
      }

      ast::Expr::Range(l, r) => {
        let l = self.lower(l);
        let r = self.lower(r);
        l.unify_ty(&r.t);
        Node::new(Ty::Var(defo()), Expr::Range(l, r))
      }

      ast::Expr::Alias(..) => Node::new(Ty::Void, Expr::Skip),

      ast::Expr::Call(l, g, r) => {
        // let l = self.lower(l);
        // let r = self.lowerv(r);
        // match &l.t {
        //   Ty::Func(args, ret, va) => {
        //     let g = g.as_ref().map(|v| v.as_slice()).unwrap_or(&[]);
        //     let g = Ty::agg(g, self);
        //     let args = Ty::agg_subsitute_generics(args, &g);
        //     let ret = Ty::subsitute_generics(ret, &g);
        //     for (x, t) in r.iter().zip(args.iter()) {
        //       x.unify_ty(t);
        //     }
        //     Node::new(ret, Expr::Call(l, g, r))
        //   }
        //   what => unreachable!(),
        // }
        panic!()
      }

      ast::Expr::FreeCall(l, g, r) => {
        let r = self.lowerv(r);
        let f = self
          .find_symbol(l)
          .expect(&format!("Cannot find symbol {}", l));
        match &f.t {
          Ty::Func(args, ret, va) => {
            let g = g.as_ref().map(|v| v.as_slice()).unwrap_or(&[]);
            let g = match &f.x {
              Expr::Ctx(c) => {
                //All good
                if c.represents.gen == g.len() {
                  Ty::agg(g, self)
                }
                //Needs deducing
                else {
                  let (ret, g) = c.represents.deduce_ret_from(&r);
                  if let Some(ret) = ret {
                    return Node::new(ret, Expr::Call(f, g, r));
                  } else {
                    return Node::new(Ty::Var(defo()), Expr::Call(f, g, r));
                  }
                }
              }
              _ => Ty::agg(g, self),
            };
            let args = Ty::agg_subsitute_generics(args, &g);
            let ret = Ty::subsitute_generics(ret, &g);
            for (x, t) in r.iter().zip(args.iter()) {
              x.unify_ty(t);
            }
            Node::new(ret, Expr::Call(f, g, r))
          }
          _ => unreachable!(),
        }
      }

      ast::Expr::Aggregate(v) => match v {
        ast::Aggregate::Constructor(n, g, v, x) => {
          panic!()
          // let x = self.lowerv(x);
          // Node::new(Ty::Var(defo()), Expr::Aggregate(Aggregate::Constructor(n, Ty::aggvec(&g, self), v, x)))
        }

        ast::Aggregate::Struct(n, g, x) => {
          let (s, v): (Vec<_>, Vec<_>) =
            x.into_iter().map(|(s, x)| (*s, self.lower(x))).unzip();
          let st = self.find_named_type(n).unwrap();

          let (ty, g): (_, Rc<[_]>) = match (st.gen, g.len()) {
            (0, 0) => (Ty::Adt(st.clone()), Rc::new([])),
            (n, 0) => (Ty::Var(defo()), (0..n).map(|_| Ty::Var(defo())).collect()),
            (n, m) if n == m => {
              let g = Ty::agg(g, self);
              (Ty::Gadt(st.clone(), g.clone()), g)
            }
            what => unreachable!("{:?}", what),
          };

          Node::new(
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
          Node::new(Ty::Var(defo()), Expr::Aggregate(Aggregate::Tuple(v)))
        }

        ast::Aggregate::Array(v) => {
          let v = self.lowerv(v);
          Node::new(Ty::Var(defo()), Expr::Aggregate(Aggregate::Array(v)))
        }
      },

      ast::Expr::Lambda(a, x) => {
        let x = self.lower(x);
        Node::new(
          Ty::Var(defo()),
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
        Node::new(Ty::Void, Expr::Block(b))
      }

      ast::Expr::Ret(x) => {
        let x = x.as_ref().map(|x| {
          let re = self.lower(&x);
          re.unify_ty(self.represents.get_ret());
          re
        });
        Node::new(Ty::Void, Expr::Ret(x))
      }

      ast::Expr::Brk(x) => Node::new(Ty::Void, Expr::Brk),

      ast::Expr::IfElse(c, t, f) => {
        let c = self.lower(c);
        c.unify_ty(&Ty::Prim(Prim::Bool));
        let t = self.lower(t);
        let f = self.lower(f);

        Node::new(Ty::Void, Expr::IfElse(c, t, f))
      }

      ast::Expr::If(c, t) => {
        let c = self.lower(c);
        c.unify_ty(&Ty::Prim(Prim::Bool));
        let t = self.lower(t);
        Node::new(Ty::Void, Expr::If(c, t))
      }

      ast::Expr::While(c, t) => {
        let c = self.lower(c);
        c.unify_ty(&Ty::Prim(Prim::Bool));
        let t = self.lower(t);
        Node::new(Ty::Void, Expr::While)
        //Node::new(Ty::Void, Expr::While(c, t))
      }

      ast::Expr::Forever(t) => {
        let t = self.lower(t);
        Node::new(Ty::Void, Expr::Forever)
      }

      ast::Expr::Jmp(..) => unreachable!(),

      ast::Expr::For(v, x, b) => {
        let x = self.lower(x);
        Node::new(Ty::Void, Expr::For)
      }

      ast::Expr::Let(v, t, x) => {
        let x = self.lower(x);
        t.as_ref().map(|t| {
          let t = Ty::new(&t, self);
          x.unify_ty(&t);
        });
        self.insert_var(v, x.clone());
        Node::new(Ty::Void, Expr::Let(x))
      }

      ast::Expr::Label(s) => {
        self.labels.insert(s);
        Node::new(Ty::Void, Expr::Label)
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

      ast::Expr::Extern { .. } => Node::new(Ty::Void, Expr::Extern),

      ast::Expr::Type {
        sum,
        name, //Sstr,
        mems, //Vec<Ty>,
        names, //Vec<Sstr>,
        gen,  //usize,
      } => Node::new(Ty::Void, Expr::Type),
    }
  }
}

#[derive(Clone, Eq, PartialEq, Hash)]
pub struct Adt {
  name: Sstr,
  names: Box<[Sstr]>,
  types: Box<[Ty]>,
  gen: usize,
  sum: u8,
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
    let tys = members.iter().map(|n| &n.t).collect::<Vec<_>>();
    let mut re: Vec<Option<Ty>> = vec![None; self.gen];
    Ty::agg_gather2(&self.types, tys, &mut re);
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
    (Ty::Var(l), r) if r.solved() => {
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
  pub fn new(t: Ty, x: Expr) -> Rc<Node> {
    Rc::new(Node { t, x })
  }

  pub fn unify_ty(&self, t: &Ty) {
    //println!("Unifying {:?} {:?}", self.x, t);
    if !t.solved() {
      return xunify(&self.t, t);
    }
    match (&self.x, t.clone()) {
      (Expr::Unary(Unop::Addrof, n), Ty::Ptr(t)) => n.unify_ty(&t),
      (Expr::Unary(Unop::Deref, n), t) => {
        //println!("HERE");
        n.unify_ty(&Ty::Ptr(Rc::new(t)));
      }
      (Expr::Var(_, n), _) | (Expr::Unary(_, n), _) => n.unify_ty(t),

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

      (Expr::IfElse(c, l, r), _) => {
        l.unify_ty(t);
        r.unify_ty(t);
      }
      (Expr::Field(f, n), t) => {
        match f.t.autoderef() {
          Some(Ty::Adt(st)) => {
            assert_eq!(st.gen, 0);
            assert_eq!(st.get_mem_ty(n), Some(t));
          }
          Some(Ty::Gadt(st, g)) => {
            assert_eq!(st.get_mem_ty(n).map(|t| t.subsitute_generics(g)), Some(t));
          }
          _ => panic!(),
        }
      }
      (Expr::Aggregate(Aggregate::Struct(.., m)), Ty::Gadt(t, g)) => {
        let tys = Ty::agg_subsitute_generics(&t.types, &g);
        for (t, n) in tys.iter().zip(m.iter()) {
          n.unify_ty(t);
        }
      }
      (Expr::Call(f, g, a), t) => {
        let f = match &f.x {
          Expr::Ctx(ctx) => ctx,
          Expr::Extern => return,
          _ => unreachable!(),
        };
        //panic!();
      }
      (Expr::Counter, Ty::Prim(Prim::Int(true))) => (),
      (
        Expr::AssignOp(..)
        | Expr::Assign(..)
        | Expr::Block(..)
        | Expr::Ret(..)
        | Expr::Brk
        | Expr::If(..)
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
        //assert_eq!(self.t, t, "{:?}", self)
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

  pub fn try_solve(&self, a: bool) {
    //println!("Solving {:?} {:?}", self.x.name(), self.t);
    match &self.x {
      Expr::Let(x) => x.try_solve(a),

      Expr::Call(f, g, params) => {
        let f = match &f.x {
          Expr::Ctx(ctx) => ctx,
          Expr::Extern => return,
          _ => unreachable!(),
        };
        assert_eq!(f.represents.gen, g.len());

        let sol = f.represents.solve_type_vars_for_params(params);
        println!("{} {:?}", f.name, sol);
        //println!("{:?} {:?} {:?}", sol, f.name, params.iter().map(|n| &n.t).collect::<Vec<_>>());

        for (l, r) in g.iter().zip(sol.iter()) {
          if let Some(r) = r {
            xunify(l, r);
          }
        }

        let args = Ty::agg_subsitute_generics(f.represents.get_args(), g);
        for (t, n) in args.iter().zip(params.iter()) {
          println!("{:?}", n.x.name());
          n.unify_ty(t);
        }

        if let (Some(ret), g) = f.represents.deduce_ret_from(params) {
          //println!("Ret deduced amk {:?}", ret);
          self.unify_ty(&ret);
        }
        //panic!()
      }

      Expr::Aggregate(x) => {
        match x {
          Aggregate::Struct(t, g, _, m) if g.len() > 0 => {
            // println!("Solving {:?} {:?}", t, g.len());
            // println!("{:#?}", m);
            assert_eq!(t.gen, g.len());

            let sol = t.solve_type_vars_for_members(m);

            for (l, r) in g.iter().zip(sol.iter()) {
              if let Some(r) = r {
                xunify(l, r);
              }
            }

            // let tys = Ty::agg_subsitute_generics(&t.types, g);
            // for (t, n) in tys.iter().zip(m.iter()) {
            //  n.unify_ty(t);
            // }

            //If the solution gave us the previously unknown type variables
            if g.iter().filter(|t| t.solved()).count() == t.gen {
              self.unify_ty(&Ty::Gadt(t.clone(), g.clone()))
            }
          }
          _ => unimplemented!(),
        }
      }
      Expr::Subscript(l, r)
      | Expr::AssignOp(_, l, r)
      | Expr::Assign(l, r)
      | Expr::Binary(_, l, r)
      | Expr::Range(l, r) => {
        l.try_solve(a);
        r.try_solve(a);
      }
      Expr::IfElse(c, t, f) => {
        c.try_solve(a);
        t.try_solve(a);
        f.try_solve(a);
      }
      Expr::If(c, t) => {
        c.try_solve(a);
        t.try_solve(a);
      }
      Expr::Ctx(ctx) => {
        println!("{}", ctx.name);
        panic!()
      }
      Expr::Field(r, s) => {
        let mut t = &r.t;
        while let Ty::Ptr(tt) = t {
          t = tt;
        }

        if let Ty::Adt(t) = t {
          if let Some(t) = t.get_mem_ty(s) {
            xunify(&self.t, &t);
          }
        } else if let Ty::Gadt(t, g) = t {
          if let Some(t) = t.get_mem_ty(s) {
            let t = t.subsitute_generics(&g);
            xunify(&self.t, &t);
          }
        } else {
          panic!()
        }
      }
      Expr::Lambda(.., r)
      | Expr::Unary(.., r)
      | Expr::Index(r, ..)
      | Expr::Var(.., r)
      | Expr::Ret(Some(r))
      | Expr::Cast(.., r) => r.try_solve(a),
      Expr::Block(v) => {
        for x in v {
          x.try_solve(a)
        }
      }
      Expr::Ret(None)
      | Expr::Literal(..)
      | Expr::This
      | Expr::Nil
      | Expr::Arg
      | Expr::Va
      | Expr::Accumulator
      | Expr::Brk
      | Expr::While
      | Expr::Forever
      | Expr::Jmp
      | Expr::For
      | Expr::Type
      | Expr::Extern
      | Expr::Label
      | Expr::Skip
      | Expr::Counter => (),
    }
    if a {
      assert!(self.t.solved(), "{:?} {:?}", self.x, self.t)
    }
  }
}
