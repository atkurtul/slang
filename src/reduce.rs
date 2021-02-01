use crate::{*,lower::*};

pub enum Ty {
  Void,
  Prim(Prim),
  Agg(Rc<[Ty]>),
  Ptr(Rc<Ty>),
}


impl Ty {
  fn agg(t: &Rc<[lower::Ty]>) -> Rc<[Ty]> {
    t.into_iter().map(|t| Ty::new(t)).collect()
  }

  fn newb(t: &Rc<lower::Ty>) -> Rc<Ty> {
    Rc::new(Ty::new(t))
  }

  fn new(t: &lower::Ty) -> Ty {
    match t {
      lower::Ty::Void => Ty::Void,
      lower::Ty::Prim(t) => Ty::Prim(*t),
      lower::Ty::Ptr(t) => Ty::Ptr(Ty::newb(t)),
      lower::Ty::Tuple(t) => Ty::Agg(Ty::agg(t)),
      // lower::Ty::Slice(t) => Ty::Agg(Ty::new(t)),
      _ => unreachable!()
    }
  }
}