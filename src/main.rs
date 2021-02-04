#![allow(dead_code, unused_variables, unused_macros, warnings)]
#![feature(or_patterns, box_syntax, box_patterns, if_let_guard)]
pub mod ast;
pub mod lexer;
pub mod llvm;
pub mod lower2;


pub mod memory;
use bumpalo::Bump;
use memory::ptr;

pub use memory::defo;

pub type Sstr = &'static str;


fn visit(ctx: &lower2::Context) {
  println!("{:?}", ctx.constraints);
  for (_, v) in ctx.assocs.iter() {
    for ctx in v {
      visit(ctx);
    }
  }
}

fn main() {
  let allocator = Bump::new();
  let (src, file) = ast::parse_file("tests/highorder.sl");
  let top = lower2::Context::new(file);
  //println!("{:#?}", top);

  return;
  for (k, v) in top.inner.below.iter() {
    // println!("{:#?}", v.nodes);
    println!("{}", v.name);
    let v: Vec<_> = v.nodes.iter().flat_map(|x| x.flatten()).collect();
    
    for x in v {
      println!("\t{} = {}",  x.x.name(), x.t.as_ref().unwrap().as_str());
    }
  }
  for (k, v) in top.inner.assocs.iter() {
    // println!("{:#?}", v.nodes);
    println!("{}", k);
    for v in v.iter() {
      let v: Vec<_> = v.nodes.iter().flat_map(|x| x.flatten()).collect();
      for x in v {
        println!("\t{} = {}",  x.x.name(), x.t.as_ref().unwrap().as_str());
      }
    }
  }
}


mod tests {
  fn parse_quick(src: &str) {
    let (src, file) = crate::ast::parse_file(src);
    let top = crate::lower2::Context::new(file);
  }
  #[test]fn vk() {parse_quick("tests/vk.sl");}
  #[test]fn tree() {parse_quick("tests/tree.sl");}
  #[test]fn hello_world() {parse_quick("tests/helloworld.sl");}

  #[test]fn map() {parse_quick("tests/map.sl");}
  #[test]fn highorder() {parse_quick("tests/highorder.sl");}
  #[test]fn test0() {parse_quick("tests/test0.sl");}
  #[test]fn test1() {parse_quick("tests/test1.sl");}
  #[test]fn test2() {parse_quick("tests/test2.sl");}
  #[test]fn test3() {parse_quick("tests/test3.sl");}
  #[test]fn test4() {parse_quick("tests/test4.sl");}
}

