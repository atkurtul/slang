type st[x, y] { 
	a x
	b y
}

fn test[x,y](s st[y,x], a x, b y) -> st[st[x,y], st[y,x]] {
}

fn mk[T] -> T { 

}

fn main {
	x := 0;
	y := 0.0;
	q := test(mk(), x, y);	 		# mk  = st[real, int]
	q := test(q, mk(), mk());  
	q := test(q, mk(), mk());
	q := test(q, mk(), mk());
	q := test(q, mk(), mk());
	q := test(q, mk(), mk());
	q := test(q, mk(), mk());
	q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
	# q := test(q, mk(), mk());
}
