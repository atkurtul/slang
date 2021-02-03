
type Vec[T] {
  pp *T
  len long
  cap long
}

fn vec_new[T] -> Vec[T] {
  ret Vec {
    pp  =  nil,
    len = :long 0,
    cap = :long 0,
  };
}

fn push[T](v *Vec[T], ele T) {

}

fn main {
  v := vec_new();
  push(&v, 0);
}