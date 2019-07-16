# Ecuaciones No Lineales

## Método de la Bisección

Este método sirve para encontrar **raíces reales** y se basa en el teorema de Bolzano. El problema de este método es que requiere muchos pasos para poder aproximar a un decimal nuevo.

### Teorema

Sea $f:[a,b] \rightarrow\R$ una función continua en $[a,b]/ ~~f(a)\cdot f(b)\ \lt 0$, entonces:
$$
\exist c \in [a,b]/~~f(c)=0
$$

### Algoritmo

1. Busco un intervalo que verifique Bolzano.
2. Divido el intervalo en 2 partes.
3. Me quedo con el intervalo que cumpla con Bolzano.
4. Repetir paso 2.

### Error

Se puede calcular el error de aproximación de la siguiente forma:
$$
\mid c - c_n \mid \lt \frac {(b_n-a_n)}{2}=\frac {(b-a)}{2^{n+1}} \lt E
$$

### Longitud del Intervalo

Se puede calcular la longitud del $n$-simo intervalo de la siguiente forma:
$$
\frac{\mid b-a \mid}{2^n}
$$

### Código Matlab

```matlab
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
```

Tambien se puede descargar de [aca](Resources/Biseccion.m)

## Método de Newton

El método de Newton es una mejor alternativa al método de la bisección, ya que converge a un resultado mucho mas rápido. El único problema es que es necesario **calcular la primer derivada** de la función. Este método tambien solo funciona para **raíces reales**.

Se puede utilizar este método para buscar raíces imaginarias, pero no se puede asegurar que la sucesión converja. Para buscarlas solo se debe poner un valor complejo como valor inicial y que  este mas o menos cerca del valor buscado.

### Hipótesis

1. $f$ es $C^2$ en $[a,b]$
2. $f(a) \cdot f(b) \lt 0$
3. $Signo(f') = Signo(f'')$ es constante en $(a,b)$

Si elijo $x_0$ como uno de los extremos del intervalo $(a,b)$, donde $Signo(f') = Signo(f'')$, entonces la sucesión converge de forma monótona.

### Algoritmo

1. Calculo el polinomio de Taylor de la función y tomo solo la parte lineal (Los primeros 2 términos).

$$
f(r)=f(x_0+h) \sim f(x_0) + h \cdot f'(x_0)
$$

2. Planteo:

$$
t(x) = f(x_0)+ h \cdot f'(x_0) \cdot (x-x_0)
$$

3. Pido que $t(x_1)=0$ y reordeno:

$$
x_n=x_{n-1} - \frac {f(x_{n-1})}{f'(x_{n-1})}
$$

### Error

Si la función es un cero constante $(f(x) = 0,~~f'(x)\neq0)$, entonces el error es constante y la función es de convergencia cuadrática.
$$
\frac {e_{n+1}}{e_{n}^2}\sim Constante
$$
Si no es un cero constante, entonces el error es:
$$
\frac {e_{n+1}}{e_n} \sim \frac{M-1}M
$$
y $M$ es el menor $k$/ $f^{(k)}(x \neq 0)$

### Código Matlab 

```matlab
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
```

Tambien se puede descargar de [aca](Resources/Newton.m)

## Método de Punto Fijo

Si $f'(x) > 0$, entonces tiene una construcción llamada **Atractor** (Similar a una escalera). Si $f'(x)\lt 0$, entonces tiene una construcción de **tela araña** (Similar a Fibonacci, pero cuadrada).

### Hipótesis

Sea:

1. $x_0 \in [a,b]$ y $dom(g)=[a,b]$ y $im(g) \in [a,b]~~~\forall x \in [a,b]$, entonces:

$$
a \lt g(a) \leq g(x) \leq g(b) \lt b
$$

2. $Signo(f')$ es constante en $\forall x\in [a,b]$
3. $\mid g'(x) \mid \leq k \leq 1~~~\forall x\in [a,b]$

### Algoritmo

1. Plantear $f(x)=0$ y despejar $x$ tal que $x = g(x)$.
2. Elijo un valor inicial de $x_0$.
3. Genero la sucesión tal que $x_{n+1} = g(x_n)$

### Error

El error se puede calcular como:
$$
E_n = \mid x_{n+1} - x_n \mid \\
\frac{E_{n+1}}{E_n}\leq k
$$






















