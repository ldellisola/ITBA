## Metodo de la Biseccion

## f tiene que cumplir con bolzano y a < b.
## it es el numero maximo de iteraciones y prec es la precision

function c = Biseccion (f, a,b,it,prec)
  
  err= 99999;
  k = 0;
  
  if( f(a)*f(b) > 0 || b<a)
    return;
  endif
    c = 0;
  
  while((err > prec) && (k <it))
    c = (a+b)/2;

    if( f(a)*f(c) < 0)
      b = c;
    else
      a = c;
    end
    
    k = k+1;
  endwhile
endfunction