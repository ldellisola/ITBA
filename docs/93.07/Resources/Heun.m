function y = Heun(f,h,n,yo)
	y = yo;
	
	for k = 1:n
		K1 = h * f(k,y);
		K2 = h * f(k+h,y+K1);
		y = y + (K1+K2)/2
	end
end