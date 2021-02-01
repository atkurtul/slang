
pub use crate::Sstr;

#[derive(Copy, Clone, Debug, Default)]
pub struct Loc(pub usize, pub usize);
impl Loc {
  pub fn new(pos: &[usize], loc: usize) -> Loc {
    Loc(pos[0] + 1, loc - pos[1] + 1)
  }
}

#[derive(Copy, Clone, Debug, PartialEq)]
pub enum Tok {
  Int(i32),
  Real(f32),
  Str(Sstr),
  Ident(Sstr),
  Var(Sstr, usize),
  //Fold(Sstr, usize),
  Ops(Binop),
  Assignops(Binop),
  Prim(Prim),
  Punct(char),
  Inc,
  Dec,
  Wildcard,
  Turbo,
  Arrow,
  FatArrow,
  Kwextern,
  Kwalias,
  Kwself,
  Kwnil,
  Kwty,
  Kwenum,
  Kwunion,
  Kwfn,
  Kwlet,
  Kwret,
  Kwelse,
  Kwif,
  Kwjump,
  Kwbrk,
  Kwloop,
  Kwwhile,
  Kwfor,
  Kwin,
  Dotdot,
  Elipsis,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Prim {
  Bool,
  Byte(bool),
  Short(bool),
  Int(bool),
  Long(bool),
  Word,
  Real,
  Double,
  Str,
  Vector(bool, u8, u8),
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Binop {
  Add,
  Sub,
  Mul,
  Div,
  Rem,
  Shl,
  Shr,
  Lt,
  Le,
  Ge,
  Gt,
  Eq,
  Neq,
  And,
  Or,
  Xor,
  Logor,
  Logand,
  Assign,
}

pub fn lex_file(src: &str) -> Result<Vec<(Loc, Tok, Loc)>, (Loc, Loc)> {
  mod token { include!(concat!(env!("OUT_DIR"), "/lexer.rs")); }
  let lexer = token::TokenParser::new();
  let mut pos = [0; 2];
  match lexer.parse(&mut pos, &src) {
    Ok(r) => Ok(r),
    Err(e) => match e {
      lalrpop_util::ParseError::UnrecognizedToken { token, .. } => {
        let (l, _, r) = token;
        Err((Loc::new(&pos, l), Loc::new(&pos, r)))
      }
      _ => panic!(),
    },
  }
}
