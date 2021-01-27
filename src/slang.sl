
fn func -> long {
  ret 0;
}


fn binary_func[T](a T, b T) -> T {
  ret a + b;
}


# fn harmonic(n...int, init real) -> real {
#   ret @(init) + 1.0/<real><(n)>;
# }

# fn reduce(n... int) {
#   ret @(0) + 2 * n;
# }

fn main -> [] {
  let x = func[i32, T]();
  let y = x;
  let z = y;
  let w = x + y + z;
  let x = 123;
}

