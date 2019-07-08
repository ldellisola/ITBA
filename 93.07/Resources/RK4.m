function y = RK4(f,h,n,yo)
	y = yo;
	
	for k = 0:n
		K1 = h * f(k,y);
		K2 = h * f(k + h/2, y + K1/2);
		K3 = h * f(k + h/2, y + K2/2);
		K4 = h * f(k + h, y+ K3);
		
		y = y + (K1 + K2 * 2 + K3 * 2 + K4)/6;
	end
end