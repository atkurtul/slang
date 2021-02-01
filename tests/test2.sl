type st[x, y] { 
	a x
	b y
}

fn test[x,y](s st[y,x], a x, b y) -> st[st[x,y], st[y,x]] {
}

fn mk[T] -> T { 

}

fn main {
	let x = 0;
	let y = 0;
	let q = test(mk(), x, y);
	let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
	# let q = test(q, mk(), mk());
}
