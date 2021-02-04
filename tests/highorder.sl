

fn main -> int {
  f := >x:>y:x+y;
  x := f(1)(2);
  ret x;
}