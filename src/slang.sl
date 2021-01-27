
fn func -> long {
  ret 0;
}


fn binary_func[T](a T, b T) -> T {

  ret :T a;
}


fn harmonic(init real, ...n) -> real {

  for i in n {
    init += 1.0/:real i;
  }
}

fn reduce(...n) {
  ret  (1 ... @ + n * $) ... @ + n * $;
}

fn dot(l [real]) { 
  let i = 0..l.len;
  0 ... @ + l.[i] * l.[i * $$];
}

fn main -> [] {
  let x = func[i32, T]();
  let y = x;
  let z = y;
  let w = x + y + z;
  let x = &:*real 123;
}

