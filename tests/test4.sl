
fn sizeof[T] -> ulong {
  #compiler builtin
}
extern malloc(ulong) -> *[];

fn box[T] -> *T {
  ret :*T malloc(sizeof[T]());
}

type list[T] {
  pp *T
  len ulong
  cap ulong
}

# fn clone[T](self *list[T]) -> list[T] {
#   re := :*T malloc(self.len * sizeof[T]());
#   for i in 0..self.len {
#     re.[i] = self.pp.[i].clone();
#   }
#   ret list {
#     pp = re,
#     len = self.len,
#     cap = self.len
#   };
# }

# fn push[T](self *list[T], e T) {
#   if self.len >= self.cap {
#     v := self.clone();
#   }
# }