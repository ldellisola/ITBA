function [t,y,h] = Euler(f,yo,ti,tf,N)
  
  T = tf-ti;
  h = T/N;
  t = ti:h:tf; 
  y = zeros(size(t)); 
  y(1) = yo;
  
  for k = 1:N
    y(k+1) = y(k) + h * f(t(k),y(k));
  end
endfunction