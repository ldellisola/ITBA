function q = trap(f,a,b,N)
	h = (b-a)/N;
	x = a:h:b;
	y = f(x);
	
	q = h/2 * sum(y(1:1:end-1) + y(2:1:end-1));
end