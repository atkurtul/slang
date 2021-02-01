

type Node {
  left  *Node
  right *Node
  val int
}


fn alloc[T] -> *T {
  # extern malloc (long) -> *[];
  # fn sizeof[T] -> long { }
  # ret :*T malloc(sizeof[T]());
}

fn insert(node **Node, val int) {
  if (*node == nil) {
    *node = alloc();
    node.val = val;
    ret;
  }
}
