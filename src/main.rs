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
  ast::parse_file("tests/test0.sl");
  let (src, file) = ast::parse_file("tests/test3.sl");

  
  let top = lower::Context::new(file);
  //println!("{:#?}", top);
  for (k, v) in top.below {
    if k == "main" {
      println!("{:#?}", v.nodes);
    }
  }
  // for (k, v) in top.assocs {
  //   for f in v {
  //     println!("{:#?}", f.nodes);
  //   }
  // }
}



mod tests {
  fn parse_quick(src: &str) {
    let (src, file) = crate::ast::parse_file(src);
    let top = crate::lower::Context::new(file);
  }
  #[test]fn hello_world() {parse_quick("tests/helloworld.sl");}
  #[test]fn test0() {parse_quick("tests/test0.sl");}
  #[test]fn test1() {parse_quick("tests/test1.sl");}
  #[test]fn test3() {parse_quick("tests/test3.sl");}
  #[cfg(not(debug_assertions))]
  #[test]fn test2() {parse_quick("tests/test2.sl");}
}

