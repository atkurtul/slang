
fn sizeof[T] -> ulong {
  #compiler builtin
}

extern malloc(ulong) -> *[];

fn box[T] -> *T {
  ret :*T malloc(sizeof[T]());
}

fn alloc[T](len ulong) -> *T {
  ret :*T malloc(sizeof[T]() * len);
}

type list[T] {
  pp *T
  len ulong
  cap ulong
}

fn clone[T](self *list[T]) -> list[T] {
  re := :*T malloc(self.len * sizeof[T]());
  for i in 0..self.len {
    re.[i] = self.pp.[i].clone();
  }
  ret list {
    pp = re,
    len = self.len,
    cap = self.len
  };
}

fn swap[T](self *list[T], r *list[T]) {
  tmp := *r;
  *r = *self;
  *self *= tmp;
}

fn push[T](self *list[T], e T) {
  if self.len ge self.cap {
    ++self.cap *= 2;
    tmp := alloc[T](self.cap);

    for i in 0..self.len {
      tmp.[i] = self.pp.[i].clone();
      self.pp.[i].drop();
    }
  }
}