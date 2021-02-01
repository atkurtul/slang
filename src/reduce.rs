use crate::{*,lower2::*};

pub enum Ty {
  Void,
  Prim(Prim),
  Agg(Rc<[Ty]>),
  Ptr(Rc<Ty>),
}


impl Ty {
  fn agg(t: &Rc<[lower2::Ty]>) -> Rc<[Ty]> {
    t.into_iter().map(|t| Ty::new(t)).collect()
  }

  fn newb(t: &Rc<lower2::Ty>) -> Rc<Ty> {
    Rc::new(Ty::new(t))
  }

  fn new(t: &lower2::Ty) -> Ty {
    match t {
      lower2::Ty::Void => Ty::Void,
      lower2::Ty::Prim(t) => Ty::Prim(*t),
      lower2::Ty::Ptr(t) => Ty::Ptr(Ty::newb(t)),
      lower2::Ty::Tuple(t) => Ty::Agg(Ty::agg(t)),
      // lower2::Ty::Slice(t) => Ty::Agg(Ty::new(t)),
      _ => unreachable!()
    }
  }
}