#![allow(dead_code, unused_variables, unused_macros, warnings)]
#![feature(or_patterns, box_syntax, box_patterns, if_let_guard)]
pub mod ast;
pub mod lexer;
pub mod llvm;
pub mod lower;
pub mod lower2;
pub mod reduce;

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

fn print_rec(top: &lower::Context) {
  for (id, var) in top.vars.vars.iter() {
    for (i, var) in var.into_iter().enumerate() {
      println!("{}{} {:?}", id, i, var.ty);
    }
  }

  for (id, record) in top.records.iter() {
    println!("{}", id);
    for mem in record.names.iter() {
      println!("   {}", mem);
    }
  }

  for prog in top.nodes.iter() {
    match &prog.ex {
      lower::Expr::Ctx(c) => {
        print_rec(c);
      }
      _ => (),
    };
  }
}

fn main() {
  let allocator = Bump::new();
  let (src, file) = ast::parse_file("src/slang.sl");
  let top = lower2::Context::new(file);
  //println!("{:#?}", top);

  for (k, v) in top.below {
    println!("{:#?}", v.nodes);
  }
}
