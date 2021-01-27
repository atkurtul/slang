#![allow(dead_code, unused_variables, unused_macros)]
#![feature(allocator_api)]
pub mod ast;
pub mod lexer;
pub mod llvm;
pub mod lower;
pub mod memory;
use bumpalo::Bump;
use memory::ptr;

pub use memory::defo;


pub type Sstr = &'static str;

macro_rules! mkstr {
  ($str: expr) => {
    format!("{}\0", $str).as_ptr() as _
  };
}

fn main() {
  let allocator = Bump::new();
  let (src, file) = ast::parse_file("src/slang.sl");
  let top = lower::Context::begin(ptr(&allocator), file);
  use lower::Expr::*;
  for prog in top.nodes {
    match &prog.ex {
      lower::Expr::Ctx(c) => {
        for (id, var) in c.vars.vars.iter() {
          for (i, var) in var.into_iter().enumerate() {
            println!("{}{} {:?}", id, i, var.ty);
          }
        }
        // println!("{:#?}", p);
      }
      _ => ()
    };
  }
}


