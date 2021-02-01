#![allow(dead_code, unused_variables, unused_macros, warnings)]
#![feature(or_patterns, box_syntax, box_patterns, if_let_guard)]
pub mod ast;
pub mod lexer;
pub mod llvm;
pub mod lower;
pub mod reduce;

pub mod memory;
use bumpalo::Bump;
use memory::ptr;

pub use memory::defo;

pub type Sstr = &'static str;



fn main() {
  let allocator = Bump::new();
  let (src, file) = ast::parse_file("tests/test1.sl");

  
  let top = lower::Context::new(file);
  //println!("{:#?}", top);

  for (k, v) in top.assocs {
    for f in v {
      //println!("{:#?}", f.nodes);
    }
  }
}
