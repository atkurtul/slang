#![allow(warnings)]
use std::{fmt::Pointer, mem::ManuallyDrop};
pub use std::ops::Deref;
pub use std::ops::DerefMut;
pub use std::fmt::Debug;

#[derive(PartialEq, Eq, Hash)]
pub struct ptr<T>(pub *const T);


impl<T: Debug> Debug for ptr<T> {
  fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::result::Result<(), std::fmt::Error> { 
    unsafe { (*self.0).fmt(f) }
  }
}

#[derive(Debug, PartialEq, Eq, Hash)]
pub struct vptr<T>(pub *const [T]);
impl<T> ptr<T> {
  pub fn new(t: T) -> ptr<T> {
    ptr(Box::leak(Box::new(t)))
  }
  pub fn free(self) {
    unsafe { Box::from_raw(self.0 as *mut T) };
  }
  pub fn drop_in_place(self) {
    unsafe { std::ptr::drop_in_place(self.0 as *mut T) }
  }
  pub fn get_mut(&self) -> &mut T {
    unsafe { &mut *(self.0 as *mut T) }
  }
}

impl<T: Clone> vptr<T> {
  pub fn new(t: &[T]) -> vptr<T> {
    vptr(Box::leak(t.into_iter().cloned().collect::<Box<[T]>>()))
  }
  pub fn free(self) {
    unsafe { Box::from_raw(self.0 as *mut T) };
  }
}

impl<T> Clone for vptr<T> {
  fn clone(&self) -> Self {
    *self
  }
}
impl<T> Copy for vptr<T> {}
impl<T> Clone for ptr<T> {
  fn clone(&self) -> Self {
    *self
  }
}
impl<T> Copy for ptr<T> {}
impl<T> Deref for ptr<T> {
  type Target = T;
  fn deref(&self) -> &Self::Target {
    unsafe { &*self.0 }
  }
}
impl<T> DerefMut for ptr<T> {
  fn deref_mut(&mut self) -> &mut Self::Target {
    unsafe { &mut *(self.0 as *mut _) }
  }
}
impl<T> Deref for vptr<T> {
  type Target = [T];
  fn deref(&self) -> &Self::Target {
    unsafe { &*self.0 }
  }
}
impl<T> DerefMut for vptr<T> {
  fn deref_mut(&mut self) -> &mut Self::Target {
    unsafe { &mut *(self.0 as *mut _) }
  }
}
pub trait raw_mem {
  fn leak(self) -> *mut Self;
}
impl<T> raw_mem for T {
  fn leak(self) -> *mut Self {
    unsafe { Box::leak(Box::new(self)) }
  }
}
pub fn zero<T>() -> T {
  unsafe { std::mem::MaybeUninit::zeroed().assume_init() }
}
pub fn defo<T: Default>() -> T {
  T::default()
}
pub fn defo_leak<T: Default>() -> ptr<T> {
  ptr(T::default().leak())
}

pub fn defmovref<T:Default>(t: &T) -> T {
  unsafe { std::ptr::replace(ptr(t).0 as _, defo()) }
}

pub fn movref<T:Default>(t: &T, r: T) -> T {
  unsafe { std::ptr::replace(ptr(t).0 as _, r) }
}

