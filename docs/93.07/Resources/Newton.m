function x = newton(xo,f,df,tol,maxiter)

	x = xo;

	for k = 1 : maxiter
		
		xviejo = x;
		x = x -f(xviejo)/df(xviejo);
		
		if(abs(x-xviejo) < tol)
			break;
		end
	end
end