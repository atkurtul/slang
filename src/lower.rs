use crate::ast;
use crate::ast::{Aggregate, Binding, Binop, Literal, Pattern, Prim, Sstr, Unop};
use crate::memory::*;
use crate::*;
use fxhash::FxHashMap;
use fxhash::FxHashSet;
pub type Map<K,V> = FxHashMap<K,V>;
pub type Set<K> = FxHashSet<K>;
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Ty {
  Void,
  Prim(Prim),
  Tuple(Vec<Ty>),
  Union(Vec<Ty>),
  Slice(Box<Ty>),
  Ptr(Box<Ty>),
  Array(usize, Box<Ty>),
  Adt(Sstr),
  Gen(usize, usize),
  Gadt(Sstr, Vec<Ty>),
  Func(Vec<Ty>, Box<Ty>),
  Var(TypeVariable),
}

impl Ty {
  pub fn agg(v: Vec<ast::Ty>) -> Vec<Ty> {
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
  Literal(Literal),
  Var(Sstr, ptr<Node>),

  Binary(Binop, ptr<Node>, ptr<Node>),
  Unary(Unop, ptr<Node>),
  AssignOp(Binop, ptr<Node>, ptr<Node>),
  Assign(ptr<Node>, ptr<Node>),
  Subscript(ptr<Node>, ptr<Node>),
  Index(ptr<Node>, usize),
  Member(ptr<Node>, Sstr),
  Range(ptr<Node>, ptr<Node>),
  Call(ptr<Context>, Vec<Ty>, Vec<ptr<Node>>),
  Aggregate(Aggregate<ptr<Node>>),

  Lambda(Vec<(Sstr, Option<Ty>)>, ptr<Node>),
  Block(Vec<ptr<Node>>),

  Ctx(ptr<Context>),

  Ret,      //(Option<ptr<Node>>),
  Brk,      //(Option<Sstr>),
  IfElse,   //(ptr<Node>, ptr<Node>, ptr<Node>),
  If,       //(ptr<Node>, ptr<Node>),
  While,    //(ptr<Node>, ptr<Node>),
  Jmp,      //(ptr<Node>, Vec<(Pattern, Node)>),
  For,      //(Binding, ptr<Node>, ptr<Node>),

  Let,
  Type,
  Extern,
  Label,
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
      //   a0.map(|a| a.drop_in_place());
      // }
      // Expr::IfElse(a0, a1, a2) => {
      //   a0.drop_in_place();
      //   a1.drop_in_place();
      //   a2.drop_in_place();
      // }
      // Expr::If(a0, a1) => {
      //   a0.drop_in_place();
      //   a1.drop_in_place();
      // }
      // Expr::While(a0, a1) => {
      //   a0.drop_in_place();
      //   a1.drop_in_place();
      // }
      // Expr::For(_, a0, a1) => {
      //   a0.drop_in_place();
      //   a1.drop_in_place();
      // }
      // Expr::Ctx(_, a0) => {
      //   a0.drop_in_place();
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

use std::hash::{Hash, Hasher};

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

#[derive(Debug, Clone)]
pub struct Context {
  pub bumper: ptr<Bump>,
  pub name: Sstr,
  pub this: Option<Ty>,
  pub gen: usize,
  pub args: Box<[Ty]>,
  pub ret: Ty,
  pub names: Vec<Sstr>,
  pub vars: Map<Sstr, Vec<ptr<Node>>>,
  pub labels: Vec<Sstr>,
  pub children: Map<Sstr, Box<Context>>,
  pub assoc_children: Map<Sstr, Vec<Box<Context>>>,
  pub parent: Option<ptr<Context>>,
  pub nodes: Vec<ptr<Node>>,
  pub records: Map<Sstr, Box<Adt>>,
}

#[derive(Debug, Clone)]
pub struct Adt {
  sum: bool,
  name: Sstr,
  mems: Box<[Ty]>,
  names: Vec<Sstr>,
  gen: usize,
}


impl Context {
  pub fn new(bumper: ptr<Bump>) -> Context {
    Context {
      bumper,
      vars: defo(),
      labels: defo(),
      name: defo(),
      this: defo(),
      gen: defo(),
      args: defo(),
      ret: defo(),
      names: defo(),
      children: defo(),
      assoc_children: defo(),
      parent: defo(),
      nodes: defo(),
      records: defo(),
    }
  }

  pub fn begin(bumper: ptr<Bump>, x: Vec<ast::Expr>) -> Context {
    let mut top = Self::new(bumper);
    top.collect(&x);
    let re = top.lowerv(x);
    top.nodes = re;
    top
  }

  fn find_func(&self, f: Sstr) -> ptr<Context> {
    if let Some(ctx) = self.children.get(f) {
      ptr(ctx.as_ref())
    } else if let Some(pp) = self.parent {
      pp.find_func(f)
    } else {
      panic!("Cant find {}", f)
    }
  }

  fn find_var(&mut self, n: Sstr) -> ptr<Node> {
    if let Some(node) = self.vars.get(n) {
      *node.last().unwrap()
    } else {
      for (i,s) in self.names.iter().enumerate() {
        if *s==n {
          return self.new_node(Some(self.args[i].clone()), Expr::Arg);
        }
      }
      unreachable!()
    }
  }

  pub fn collect(&mut self, x: &Vec<ast::Expr>) {
    for x in x.iter() {
      match x {
        ast::Expr::Func {
          body, //Box<Expr>
          name, //Sstr,
          this, //Option<Ty>,
          gen,  //usize,
          args, //Vec<Ty>,
          ret,  //Ty,
          names, //Vec<Sstr>,
        } => {
          let mut ctx = Box::new(Context {
            bumper: self.bumper,
            name,
            gen: *gen,
            names: names.clone(),
            parent: Some(ptr(self)),
            this : this.clone().map(|t| Ty::from(t)),
            args: args.into_iter().map(|t| Ty::from(t.clone())).collect(),
            ret: Ty::from(ret.clone()),
            vars: defo(),
            labels: defo(),
            children: defo(),
            assoc_children: defo(),
            nodes: defo(),
            records: defo(),
          });
          ctx.collect(&body);

          if this.is_some() {
            self.assoc_children.entry(name).or_default().push(ctx);
          } else {
            self.children.insert(name, ctx);
          }
        },

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
            mems:  mems.into_iter().map(|t| Ty::from(t.clone())).collect(),
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
        self.vars.entry(s).or_default().push(x);
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
        let node = self.find_var(s);
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

      ast::Expr::AssignOp(op, l, r) => {
        let l = self.lowerb(l);
        let r = self.lowerb(r);
        unify(l,r);
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
        unify(l,r);
        self.new_node(None, Expr::Range(l, r))
      }
      
      ast::Expr::Call(l, _, r) => {
        let l = self.lowerb(l);
        match l.ex {
          _ => ()
        }
        let r = self.lowerv(r);
        //self.new_node(None, Expr::Call(l, vec![], r))
        self.new_node(None, Expr::This)
      }

      ast::Expr::FreeCall(l, _, r) => {
        let r = self.lowerv(r);
        let f = self.find_func(l);
        for (x, t) in r.iter().zip(f.args.iter()) {
          unify_t(*x, ptr(t));
        }
        self.new_node(Some(f.ret.clone()), Expr::Call(f, vec![], r))
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
      
      ast::Expr::Jmp(..) => unreachable!(),
      
      ast::Expr::For(..) => unreachable!(),
      
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
        body, //Box<Expr>
        name, //Sstr,
        this, //Option<Ty>,
        gen,  //usize,
        args, //Vec<Ty>,
        ret,  //Ty,
        names, //Vec<Sstr>,
      } => {
        let ctx = self.children.get_mut(name).unwrap();
        ctx.lowerv_as_root(body);
        let expr = Expr::Ctx(ptr(ctx.as_ref()));
        self.new_node(Some(Ty::Void), expr)
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

fn unify_t(mut left: ptr<Node>, right: ptr<Ty>) {
  match left.ty.get_mut() {
    Ty::Var(t) => unify_var(left, t, right),
    t => assert_eq!(t, right.get_mut()),
  }
}

fn unify_var(mut node: ptr<Node>, ty: &mut TypeVariable, right: ptr<Ty>) {
  for var in ty.equalities.iter() {
    var.ty.drop_in_place();
    ptr(var).ty = right;
    println!("[Chained]Unification succesful => {:?} ", var.ty);
  }
  node.ty.drop_in_place();
  node.ty = right;
  println!("Unification succesful => {:?} ", node.ty);
}

fn unify(mut left: ptr<Node>, mut right: ptr<Node>) {
  //println!("Unifying {:?} {:?}", left.ty, right.ty);
  let lhs: &mut Ty = left.ty.get_mut();
  let rhs: &mut Ty = right.ty.get_mut();
  
  match (lhs, rhs) {
    (Ty::Var(l), Ty::Var(r)) => {
      if l != r {
        let new: Set<_> = l.equalities.iter().chain(r.equalities.iter()).cloned().collect();
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
