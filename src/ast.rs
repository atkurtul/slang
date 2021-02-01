pub use crate::Sstr;

pub use crate::lexer::{Binop, Loc, Prim, Tok};
pub use crate::memory::*;
use fxhash::*;

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Aggregate {
    Constructor(Sstr, Vec<Ty>, Sstr, Vec<Expr>),
    Struct(Sstr, Vec<Ty>, Vec<(Sstr, Expr)>),
    Tuple(Vec<Expr>),
    Array(Vec<Expr>),
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Unop {
    Addrof,
    Deref,
    Neg,
    Not,
    Inc,
    Dec,
    PostInc,
    PostDec,
}

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
    Gen(usize),
    Gadt(Sstr, Vec<Ty>),
    Func(Vec<Ty>, Box<Ty>, bool),
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Binding {
    Ignore,
    Ident(Sstr),
    Tuple(Vec<Binding>),
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum Literal {
    Int(i32),
    Str(Sstr),
    Real(f32),
}

impl Eq for Literal {}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Pattern {
    Binding(Binding),
    Struct(Sstr, Vec<(Sstr, Pattern)>),
    Union(Vec<Pattern>),
    Tuple(Vec<Pattern>),
    Literal(Literal),
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Expr {
    //LEAF
    This,
    Nil,
    Literal(Literal),
    Var(Sstr),

    Accumulator,
    Counter,

    Cast(Ty, Box<Expr>),

    Binary(Binop, Box<Expr>, Box<Expr>),
    Unary(Unop, Box<Expr>),

    AssignOp(Binop, Box<Expr>, Box<Expr>),
    Assign(Box<Expr>, Box<Expr>),
    Subscript(Box<Expr>, Box<Expr>),
    TupleIndex(Box<Expr>, usize),
    Member(Box<Expr>, Sstr),
    Range(Box<Expr>, Box<Expr>),
    Call(Box<Expr>, Option<Vec<Ty>>, Vec<Expr>),
    FreeCall(Sstr, Option<Vec<Ty>>, Vec<Expr>),
    Aggregate(Aggregate),

    Lambda(Vec<(Sstr, Option<Ty>)>, Box<Expr>),
    Block(Vec<Expr>),

    Ret(Option<Box<Expr>>),
    Brk(Option<Sstr>),

    IfElse(Box<Expr>, Box<Expr>, Box<Expr>),
    If(Box<Expr>, Box<Expr>),
    While(Box<Expr>, Box<Expr>),
    Forever(Box<Expr>),
    Jmp(Box<Expr>, Vec<(Pattern, Expr)>),

    For(Binding, Box<Expr>, Box<Expr>),
    Let(Binding, Option<Ty>, Box<Expr>),

    Label(Sstr),

    Extern(Vec<(Sstr, Ty)>),

    Func {
        va: Option<Sstr>,
        name: Sstr,
        args: Vec<Ty>,
        ret: Ty,
        names: Vec<Sstr>,
        this: Option<Ty>,
        gen: usize,
        body: Vec<Expr>,
    },

    Type {
        sum: bool,
        name: Sstr,
        mems: Vec<Ty>,
        names: Vec<Sstr>,
        gen: usize,
    },
}

pub fn parse_file(file: &str) -> (Box<String>, Vec<Expr>) {
    let src = Box::<String>::new(std::fs::read_to_string(file).unwrap());
    let tokens = crate::lexer::lex_file(&src).unwrap();

    mod lang {
        include!(concat!(env!("OUT_DIR"), "/lang.rs"));
    }
    let parser = lang::xLangParser::new();
    // let mut table: ptr<symbol_table> = defo_leak();
    // let prox = proxy::new(table, &tokens);
    let mut sym = defo();
    let tokens = TokenProxy::new(&sym, &tokens);
    let re = parser.parse(&mut sym, tokens);
    match re {
        Err(err) => match err {
            lalrpop_util::ParseError::UnrecognizedToken { token, expected } => {
                let (l, _, r) = token;
                panic!(
                    "{}:{}:{} {}:{}:{}\nExpected: {:?}",
                    file, l.0, l.1, file, r.0, r.1, expected
                );
            }
            _ => panic!("{:?}", err),
        },
        Ok(ast) => {
            // table.free();
            return (src, ast);
        }
    }
}

#[derive(Debug)]
pub struct SymbolTable {
    vars: Vec<FxHashSet<Sstr>>,
    type_vars: Vec<Vec<Sstr>>,
}

pub struct TokenProxy {
    table: ptr<SymbolTable>,
    tokens: ptr<Vec<(Loc, Tok, Loc)>>,
    idx: usize,
}

impl TokenProxy {
    pub fn new(table: &SymbolTable, tokens: &Vec<(Loc, Tok, Loc)>) -> TokenProxy {
        TokenProxy {
            table: ptr(table),
            tokens: ptr(tokens),
            idx: 0,
        }
    }
}

impl Iterator for TokenProxy {
    type Item = (Loc, Tok, Loc);
    fn next(&mut self) -> Option<(Loc, Tok, Loc)> {
        if self.idx < self.tokens.len() {
            let re = self.tokens[self.idx];
            self.idx += 1;
            match re.1 {
                Tok::Ident(s) => {
                    //print!("{} is ", s);
                    let scope = self.table.query(s);
                    if scope != 0 {
                        //println!("var");
                        return Some((re.0, Tok::Var(s, scope), re.2));
                    }
                    //println!("not var {}", scope);
                }
                _ => (),
            }
            return Some(re);
        }
        return None;
    }
}

impl Default for SymbolTable {
    fn default() -> Self {
        SymbolTable {
            vars: vec![defo()],
            type_vars: defo(),
        }
    }
}

impl SymbolTable {
    pub fn query(&self, n: Sstr) -> usize {
        //println!("Querying sym {}", n);
        for (i, var) in self.vars.iter().rev().enumerate() {
            if var.get(n).is_some() {
                //println!("Found var {} scope {}", n, i);
                return i + 1;
            }
        }
        return 0;
    }

    pub fn get_adt(&self, s: Sstr) -> Ty {
        //println!("Querying sym {}", n);
        for (x, var) in self.type_vars.last().unwrap().iter().enumerate() {
            if *var == s {
                return Ty::Gen(x);
            }
        }
        return Ty::Adt(s);
    }

    pub fn scope_generics(&mut self, g: Vec<Sstr>) -> usize {
        let len = g.len();
        let g: FxHashSet<_> = g.into_iter().collect();
        assert_eq!(len, g.len());
        self.type_vars.push(g.into_iter().collect());
        return len;
    }

    pub fn descope_generics(&mut self) {
        self.type_vars.pop();
    }

    pub fn clear_type_vars(&mut self) {
        self.type_vars.clear();
    }

    pub fn add_sym(&mut self, sym: Sstr) {
        //println!("Adding sym {:?}", sym);
        self.vars.last_mut().unwrap().insert(sym);
    }

    pub fn add_var(&mut self, var: &Binding) {
        //println!("Adding var {:?}", var);
        match var {
            Binding::Ident(i) => self.add_sym(i),
            Binding::Tuple(rec) => {
                for var in rec {
                    self.add_var(var);
                }
            }
            _ => (),
        }
    }

    pub fn scope(&mut self) {
        //println!("Scoping");
        self.vars.push(defo());
    }

    pub fn descope(&mut self) {
        //println!("Descoping");
        self.vars.pop();
    }
}

pub fn unroll_production(mut t: Vec<Vec<Ty>>) -> Ty {
    match t.len() {
        1 => {
            let mut t = t.pop().unwrap();
            match t.len() {
                0 => Ty::Void,
                1 => Ty::Slice(Box::new(t.pop().unwrap())),
                _ => Ty::Tuple(t),
            }
        }
        _ => Ty::Union(
            t.into_iter()
                .map(|mut t| match t.len() {
                    1 => t.pop().unwrap(),
                    _ => Ty::Tuple(t),
                })
                .collect(),
        ),
    }
}
