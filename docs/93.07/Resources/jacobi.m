# b es el termino independiente
function [x,k,e] = jacobi(A,b,tol)
    e = 2 * tol; 
    n = lenght(b);
    x = zeros(n); 
    y = zeros(n); 
    k = 0;

    while e > tol
        for m =1:n
            y(m) = (b(m) - A(m,1:m-1) * x(1:m-1) - A(m,m+1:n) * x(m:m+1:n))/ A(m,m);
        end
        e = norm(y-x,inf);
    end 
    
    x = y; 
    k = k +1;
end