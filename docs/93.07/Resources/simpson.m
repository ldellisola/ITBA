function q = simpson(f,a,b,N)
	
	if mod(N,2)
		N = 2*N;
	end
	
	h = (b-a)/N;
	x = a:h:b;
	y = f(x);
	E = y(1)+y(end);
	I = sum(y(2:end-1));
	P = sum(y(3:2:end-1));
	
	q = h/2 * (E+2*P+4*I);
end