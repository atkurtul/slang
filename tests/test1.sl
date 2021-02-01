
type vec[T] {
  x T
  y T
  z T
}


fn add[T](self vec[T], r vec[T]) -> vec[T] {
  let re = vec {
    x = self.x + r.x,
    y = self.y + r.y,
    z = self.z + r.z,
  };
  ret re;
}

fn main {

}