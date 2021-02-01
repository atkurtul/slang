use crate::ast;
use crate::ast::{Aggregate, Binding, Binop, Literal, Pattern, Prim, Sstr, Unop};
use crate::memory::*;
use crate::*;
use fxhash::FxHashMap;
use fxhash::FxHashSet;

pub type Map<K, V> = FxHashMap<K, V>;
pub type Set<K> = FxHashSet<K>;

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Ty {
  Void,
  Prim(Prim),
  Tuple(Box<[Ty]>),
  Union(Box<[Ty]>),
  Slice(Box<Ty>),
  Ptr(Box<Ty>),
  Array(usize, Box<Ty>),
  Adt(Sstr),
  Gen(usize, usize),
  Gadt(Sstr, Box<[Ty]>),
  Func(Box<[Ty]>, Box<Ty>),
  Var(TypeVariable),
}

impl Ty {
  pub fn agg(v: Vec<ast::Ty>) -> Box<[Ty]> {
    v.into_iter().map(|t| Ty::from(t)).collect()
  }
  pub fn fromb(ty: Box<ast::Ty>) -> Box<Ty> {
    Box::new(Ty::from(*ty))
  }

  pub fn from(ty: ast::Ty) -> Ty {
    match ty {
      ast::Ty::Void => Ty::Void,
      ast::Ty::Prim(p) => Ty::Prim(p),
      ast::Ty::Tuple(t) => Ty::Tuple(Ty::agg(t)),
      ast::Ty::Union(t) => Ty::Union(Ty::agg(t)),
      ast::Ty::Slice(t) => Ty::Slice(Ty::fromb(t)),
      ast::Ty::Ptr(t) => Ty::Ptr(Ty::fromb(t)),
      ast::Ty::Array(i, t) => Ty::Array(i, Ty::fromb(t)),
      ast::Ty::Adt(s) => Ty::Adt(s),
      ast::Ty::Gen(x, y) => Ty::Gen(x, y),
      ast::Ty::Gadt(s, g) => Ty::Gadt(s, Ty::agg(g)),
      ast::Ty::Func(a, r) => Ty::Func(Ty::agg(a), Ty::fromb(r)),
    }
  }
}

#[derive(Debug, Clone)]
pub enum Expr {
  //LEAF
  This,
  Nil,
  Arg,
  Va,
  Literal(Literal),
  Var(Sstr, ptr<Node>),

  Cast(Ty, ptr<Node>),
  Accumulator,
  Counter,

  Binary(Binop, ptr<Node>, ptr<Node>),
  Unary(Unop, ptr<Node>),

  AssignOp(Binop, ptr<Node>, ptr<Node>),
  Assign(ptr<Node>, ptr<Node>),
  Subscript(ptr<Node>, ptr<Node>),
  Index(ptr<Node>, usize),
  Member(ptr<Node>, Sstr),
  Range(ptr<Node>, ptr<Node>),
  Call(ptr<Node>, Vec<Ty>, Vec<ptr<Node>>),
  Aggregate(Aggregate<ptr<Node>>),

  Lambda(Vec<(Sstr, Option<Ty>)>, ptr<Node>),
  Block(Vec<ptr<Node>>),

  Ctx(ptr<Context>),

  Ret,   //(Option<ptr<Node>>),
  Brk,   //(Option<Sstr>),
  IfElse, //(ptr<Node>, ptr<Node>, ptr<Node>),
  If,   //(ptr<Node>, ptr<Node>),
  While,  //(ptr<Node>, ptr<Node>),
  Forever, //(ptr<Node>),
  Jmp,   //(ptr<Node>, Vec<(Pattern, Node)>),
  For,   //(Binding, ptr<Node>, ptr<Node>),

  Let,
  Type,
  Extern,
  Label,
}

impl Expr {
  pub fn unwrap_ctx(&self) -> ptr<Context> {
    match self {
      Expr::Ctx(ctx) => *ctx,
      _ => unreachable!()
    }
  }
}

impl Drop for Expr {
  fn drop(&mut self) {
    match self {
      Expr::Var(_, a0) => {
        a0.drop_in_place();
      }
      Expr::Binary(_, a0, a1) => {
        a0.drop_in_place();
        a1.drop_in_place();
      }
      Expr::Unary(_, a0) => {
        a0.drop_in_place();
      }
      Expr::AssignOp(_, a0, a1) => {
        a0.drop_in_place();
        a1.drop_in_place();
      }
      Expr::Assign(a0, a1) => {
        a0.drop_in_place();
        a1.drop_in_place();
      }
      Expr::Subscript(a0, a1) => {
        a0.drop_in_place();
        a1.drop_in_place();
      }
      Expr::Index(a0, _) => {
        a0.drop_in_place();
      }
      Expr::Member(a0, _) => {
        a0.drop_in_place();
      }
      Expr::Range(a0, a1) => {
        a0.drop_in_place();
        a1.drop_in_place();
      }
      Expr::Call(_, _, a0) => {
        for x in a0 {
          x.drop_in_place();
        }
      }
      // Expr::Ret(a0) => {
      //  a0.map(|a| a.drop_in_place());
      // }
      // Expr::IfElse(a0, a1, a2) => {
      //  a0.drop_in_place();
      //  a1.drop_in_place();
      //  a2.drop_in_place();
      // }
      // Expr::If(a0, a1) => {
      //  a0.drop_in_place();
      //  a1.drop_in_place();
      // }
      // Expr::While(a0, a1) => {
      //  a0.drop_in_place();
      //  a1.drop_in_place();
      // }
      // Expr::For(_, a0, a1) => {
      //  a0.drop_in_place();
      //  a1.drop_in_place();
      // }
      // Expr::Ctx(_, a0) => {
      //  a0.drop_in_place();
      // }
      _ => (),
    }
  }
}

#[derive(Debug, Clone)]
pub struct Node {
  pub ty: ptr<Ty>,
  pub ex: Expr,
}

impl Default for Ty {
  fn default() -> Self {
    Ty::Void
  }
}

#[derive(Default, Clone)]
pub struct TypeVariable {
  equalities: Set<ptr<Node>>,
}

impl Debug for TypeVariable {
  fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::result::Result<(), std::fmt::Error> {
    Ok(())
  }
}

use std::{
  hash::{Hash, Hasher},
  unreachable,
};

impl Hash for Node {
  fn hash<H>(&self, h: &mut H)
  where
    H: Hasher,
  {
    ptr(self).0.hash(h);
  }
}

impl Eq for Node {}

impl PartialEq<Self> for Node {
  fn eq(&self, r: &Self) -> bool {
    ptr(self).0 == ptr(r).0
  }
}

impl Hash for TypeVariable {
  fn hash<H>(&self, h: &mut H)
  where
    H: Hasher,
  {
    ptr(self).0.hash(h);
  }
}

impl Eq for TypeVariable {}

impl PartialEq<Self> for TypeVariable {
  fn eq(&self, r: &Self) -> bool {
    ptr(self).0 == ptr(r).0
  }
}

impl Default for ptr<Bump> {
  fn default() -> Self {
    ptr(0 as _)
  }
}

#[derive(Debug, Clone, Default)]
pub struct VarStack {
  pub up: Option<ptr<VarStack>>,
  pub down: Vec<Box<VarStack>>,
  pub vars: Map<Sstr, Vec<ptr<Node>>>,
}

impl VarStack {
  pub fn root() -> Self {
    defo()
  }

  pub fn get(&self, n: Sstr) -> Option<ptr<Node>> {
    if let Some(v) = self.vars.get(n) {
      Some(*v.last().unwrap())
    } else {
      self.up.map(|s| s.get(n)).unwrap_or(None)
    }
  }

  pub fn insert(&mut self, n: Sstr, x: ptr<Node>) {
    self.vars.entry(n).or_default().push(x);
  }
}

#[derive(Debug, Clone, Default)]
pub struct Context {
  pub bumper: ptr<Bump>,
  pub name: Sstr,
  pub this: Option<Ty>,
  pub gen: usize,
  pub va: Option<Sstr>,
  pub args: Box<[Ty]>,
  pub ret: Ty,
  pub names: Vec<Sstr>,
  pub vars: VarStack,
  pub labels: Vec<Sstr>,
  pub children: Map<Sstr, ptr<Node>>,
  pub assoc_children: Map<Sstr, Vec<ptr<Node>>>,
  pub extern_symbols: Map<Sstr, ptr<Node>>,
  pub parent: usize,
  pub nodes: Vec<ptr<Node>>,
  pub records: Map<Sstr, Box<Adt>>,
  pub is_extern: bool,
}

#[derive(Debug, Clone)]
pub struct Adt {
  pub sum: bool,
  pub name: Sstr,
  pub mems: Box<[Ty]>,
  pub names: Vec<Sstr>,
  pub gen: usize,
}

impl Context {
  pub fn new(bumper: ptr<Bump>) -> Context {
    Context { bumper, ..defo() }
  }

  pub fn begin(bumper: ptr<Bump>, x: Vec<ast::Expr>) -> Context {
    let mut top = Self::new(bumper);
    top.collect(&x);
    let re = top.lowerv(x);
    top.nodes = re;
    top
  }

  fn find_func(&self, f: Sstr) -> Option<ptr<Node>> {
    if let Some(ctx) = self.children.get(f) {
      Some(*ctx)
    } else if self.parent != 0 {
      let pp = ptr(self.parent as *const Context);
      pp.find_func(f)
    } else {
      None
    }
  }

  fn find_extern(&self, f: Sstr) -> Option<ptr<Node>> {

    if let Some(ctx) = self.extern_symbols.get(f) {
      Some(*ctx)
    } else if self.parent != 0 {
      let pp = ptr(self.parent as *const Context);
      pp.find_extern(f)
    } else {
      None
    }
  }
  
  fn find_symbol(&self, n: Sstr)  -> Option<ptr<Node>> {
    self.find_arg(n).or(self.find_func(n)).or(self.find_extern(n))
  }

  //TODO: Stop creating nodes
  fn find_arg(&self, n: Sstr) -> Option<ptr<Node>>  {
    for (i, s) in self.names.iter().enumerate() {
      if *s == n {
        return Some(ptr(self).new_node(Some(self.args[i].clone()), Expr::Arg));
      }
    }
    if Some(n) == self.va {
      return Some(ptr(self).new_node(None, Expr::Va));
    }
    None
  }

  fn find_var(&self, n: Sstr) -> Option<ptr<Node>> {
    self.vars.get(n).or(ptr(self).find_arg(n))
  }

  pub fn collect(&mut self, x: &Vec<ast::Expr>) {
    for x in x.iter() {
      match x {
        ast::Expr::Extern(f) => {
          for (s, ty) in f.into_iter() {
            let node = self.new_node(Some(Ty::from(ty.clone())), Expr::Extern);
            self.extern_symbols.insert(s, node);
            //println!("Inserted extern {}", s);
          }
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
          let mut ctx = ptr::new(Context {
            bumper: self.bumper,
            name,
            va: *va,
            gen: *gen,
            names: names.clone(),
            parent: self as *const Context as usize,
            this: this.clone().map(|t| Ty::from(t)),
            args: args.into_iter().map(|t| Ty::from(t.clone())).collect(),
            ret: Ty::from(ret.clone()),
            .. defo()
          });
          ctx.collect(&body);
          let ty = Ty::Func(ctx.args.clone(), Box::new(ctx.ret.clone()));
          let ctx = self.new_node(Some(ty), Expr::Ctx(ctx));
          if this.is_some() {
            self.assoc_children.entry(name).or_default().push(ctx);
          } else {
            self.children.insert(name, ctx);
          }
        }

        ast::Expr::Type {
          sum,
          name, //Sstr,
          mems, //Vec<Ty>,
          names, //Vec<Sstr>,
          gen,  //usize,
        } => {
          let st = Box::new(Adt {
            name,
            names: defmovref(names),
            mems: mems.into_iter().map(|t| Ty::from(t.clone())).collect(),
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
  }

  pub fn intern<T>(&mut self, x: T) -> ptr<T> {
    ptr(self.bumper.alloc(x))
  }

  pub fn new_node(&mut self, ty: Option<Ty>, x: Expr) -> ptr<Node> {
    let ty = ty.unwrap_or_else(|| Ty::Var(defo()));
    let ty = self.intern(ty);
    let x = Node { ty, ex: x };
    self.intern(x)
  }

  pub fn lowerv(&mut self, x: Vec<ast::Expr>) -> Vec<ptr<Node>> {
    x.into_iter().map(|x| self.lower(x)).collect()
  }

  pub fn lowerv_as_root(&mut self, x: Vec<ast::Expr>) {
    let x = x.into_iter().map(|x| self.lower(x)).collect();
    self.nodes = x;
  }

  pub fn insert_var(&mut self, var: Binding, x: ptr<Node>) {
    match var {
      Binding::Ignore => (),
      Binding::Ident(s) => {
        self.vars.insert(s, x);
      }
      Binding::Tuple(v) => {
        for (i, var) in v.into_iter().enumerate() {
          let x = self.new_node(None, Expr::Index(x, i));
          self.insert_var(var, x);
        }
      }
    }
  }

  pub fn lowerb(&mut self, x: Box<ast::Expr>) -> ptr<Node> {
    self.lower(*x)
  }

  pub fn lower(&mut self, x: ast::Expr) -> ptr<Node> {
    match x {
      ast::Expr::This => self.new_node(Some(self.this.as_ref().unwrap().clone()), Expr::This),

      ast::Expr::Nil => self.new_node(None, Expr::Nil),

      ast::Expr::Literal(n) => self.new_node(
        Some(match n {
          Literal::Int(_) => Ty::Prim(Prim::Int),
          Literal::Real(_) => Ty::Prim(Prim::Real),
          Literal::Str(_) => Ty::Prim(Prim::Str),
        }),
        Expr::Literal(n),
      ),

      ast::Expr::Var(s) => {
        let node = self.find_var(s).unwrap();
        let re = self.new_node(None, Expr::Var(s, node));
        unify(node, re);
        re
      }

      ast::Expr::Binary(op, l, r) => {
        let l = self.lowerb(l);
        let r = self.lowerb(r);
        let x = self.new_node(None, Expr::Binary(op, l, r));
        unify(l, r);
        unify(x, l);
        x
      }

      ast::Expr::Unary(op, x) => {
        let l = self.lowerb(x);
        let x = self.new_node(None, Expr::Unary(op, l));
        unify(x, l);
        x
      }

      ast::Expr::Cast(t, x) => {
        let t = Ty::from(t);
        let l = self.lowerb(x);
        let x = self.new_node(Some(t.clone()), Expr::Cast(t, l));
        x
      }

      ast::Expr::Fold => self.new_node(None, Expr::Accumulator),

      ast::Expr::Accumulator => {
        // let l = self.lowerb(x);
        // let x = self.new_node(None, Expr::Accumulator(l));
        // unify(x, l);
        // x
        self.new_node(None, Expr::Accumulator)
      }

      ast::Expr::Counter => self.new_node(Some(Ty::Prim(Prim::Long)), Expr::Counter),

      ast::Expr::AssignOp(op, l, r) => {
        let l = self.lowerb(l);
        let r = self.lowerb(r);
        unify(l, r);
        self.new_node(None, Expr::AssignOp(op, l, r))
      }

      ast::Expr::Assign(l, r) => {
        let l = self.lowerb(l);
        let r = self.lowerb(r);
        unify(l, r);
        self.new_node(None, Expr::Assign(l, r))
      }

      ast::Expr::Subscript(l, r) => {
        let l = self.lowerb(l);
        let r = self.lowerb(r);
        self.new_node(None, Expr::Subscript(l, r))
      }

      ast::Expr::TupleIndex(x, i) => {
        let x = self.lowerb(x);
        self.new_node(None, Expr::Index(x, i))
      }

      ast::Expr::Member(x, i) => {
        let x = self.lowerb(x);
        self.new_node(None, Expr::Member(x, i))
      }

      ast::Expr::Range(l, r) => {
        let l = self.lowerb(l);
        let r = self.lowerb(r);
        unify(l, r);
        self.new_node(None, Expr::Range(l, r))
      }

      ast::Expr::Call(l, _, r) => {
        let l = self.lowerb(l);
        match l.ex {
          _ => (),
        }
        let r = self.lowerv(r);
        unreachable!()
      }

      ast::Expr::FreeCall(l, _, r) => {
        let r = self.lowerv(r);
        let f = self.find_symbol(l).expect(&format!("Cannot find symbol {}", l));
        match &*f.ty {
          Ty::Func(args, ret) => {
            for (x, t) in r.iter().zip(args.iter()) {
              unify_t(*x, ptr(t));
            }
            self.new_node(Some(*ret.clone()), Expr::Call(f, vec![], r))
          }
          _ => unreachable!()
        }

      }

      ast::Expr::Aggregate(v) => match v {
        Aggregate::Constructor(n, v, x) => {
          let x = self.lowerv(x);
          self.new_node(None, Expr::Aggregate(Aggregate::Constructor(n, v, x)))
        }

        Aggregate::Struct(n, x) => {
          let v: Vec<_> = x.into_iter().map(|(s, x)| (s, self.lower(x))).collect();
          self.new_node(None, Expr::Aggregate(Aggregate::Struct(n, v)))
        }

        Aggregate::Tuple(v) => {
          let v = self.lowerv(v);
          self.new_node(None, Expr::Aggregate(Aggregate::Tuple(v)))
        }

        Aggregate::Array(v) => {
          let v = self.lowerv(v);
          self.new_node(None, Expr::Aggregate(Aggregate::Array(v)))
        }
      },

      ast::Expr::Lambda(a, x) => {
        let x = self.lowerb(x);
        self.new_node(
          None,
          Expr::Lambda(
            a.into_iter()
              .map(|(s, t)| (s, t.map(|t| Ty::from(t))))
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
        let x = x.map(|x| self.lowerb(x));
        self.new_node(Some(Ty::Void), Expr::Ret)
        //self.new_node(Some(Ty::Void), Expr::Ret(x))
      }

      ast::Expr::Brk(x) => self.new_node(None, Expr::Brk),

      ast::Expr::IfElse(c, t, f) => {
        let c = self.lowerb(c);
        let t = self.lowerb(t);
        let f = self.lowerb(f);
        self.new_node(Some(Ty::Void), Expr::IfElse)
        //self.new_node(Some(Ty::Void), Expr::IfElse(c, t, f))
      }

      ast::Expr::If(c, t) => {
        let c = self.lowerb(c);
        let t = self.lowerb(t);
        self.new_node(Some(Ty::Void), Expr::If)
        //self.new_node(Some(Ty::Void), Expr::If(c, t))
      }

      ast::Expr::While(c, t) => {
        let c = self.lowerb(c);
        let t = self.lowerb(t);
        self.new_node(Some(Ty::Void), Expr::While)
        //self.new_node(Some(Ty::Void), Expr::While(c, t))
      }

      ast::Expr::Forever(t) => {
        let t = self.lowerb(t);
        self.new_node(Some(Ty::Void), Expr::Forever)
      }

      ast::Expr::Jmp(..) => unreachable!(),

      ast::Expr::For(v, x, b) => {
        let x = self.lowerb(x);

        self.new_node(Some(Ty::Void), Expr::For)
      }

      ast::Expr::Let(v, t, x) => {
        let x = self.lowerb(x);
        let t = t.map(|t| Ty::from(t));
        // let re = self.new_node_heap(t, Expr::Let(v, x));
        //t.map(|t| unify(&x.ty));
        self.insert_var(v, x);
        self.new_node(Some(Ty::Void), Expr::Let)
      }

      ast::Expr::Label(s) => {
        self.labels.push(s);
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
        let ctx = if let Some(ctx) = self.children.get_mut(name) {
          ctx
        } else {
          let this = this.map(|t| Ty::from(t));
          self.assoc_children
            .get_mut(name)
            .unwrap()
            .iter_mut()
            .find(|ctx| ctx.ex.unwrap_ctx().this == this )
            .unwrap()
        };
        ctx.ex.unwrap_ctx().lowerv_as_root(body);
        *ctx
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

fn unify_t(left: ptr<Node>, right: ptr<Ty>) {
  match left.ty.get_mut() {
    Ty::Var(t) => unify_var(left, t, right),
    t => assert_eq!(t, right.get_mut()),
  }
}

fn unify_var(mut node: ptr<Node>, ty: &mut TypeVariable, right: ptr<Ty>) {
  //unify the whole blob
  for var in ty.equalities.iter() {
    var.ty.drop_in_place();
    ptr(var).ty = right;
    println!("[Chained]Unification succesful => {:?} ", var.ty);
  }
  node.ty.drop_in_place();
  node.ty = right;
  println!("Unification succesful => {:?} ", node.ty);
}

fn unify(left: ptr<Node>, mut right: ptr<Node>) {
  //println!("Unifying {:?} {:?}", left.ty, right.ty);
  let lhs: &mut Ty = left.ty.get_mut();
  let rhs: &mut Ty = right.ty.get_mut();

  match (lhs, rhs) {
    (Ty::Var(l), Ty::Var(r)) => {
      if l != r {
        let new: Set<_> = l
          .equalities
          .iter()
          .chain(r.equalities.iter())
          .cloned()
          .collect();
        l.equalities = new;
        right.ty.drop_in_place();
        right.ty = left.ty;
      }
    }
    (Ty::Var(l), r) => unify_var(left, l, right.ty),
    (l, Ty::Var(r)) => unify_var(right, r, left.ty),
    (l, r) => assert_eq!(l, r),
  };
}
