# PVI para EDOs - Métodos de Ruge-Kutta

Sea una EDO tal que:
$$
\left\{
	\array{
		Y'(t)=f(t,Y(t))	&&	t \in[t_0,t_o+T]=I  \\
		Y(t_0) = Y_0
	
	}
\right.
$$
Y se conocen los datos $t_0,T,Y_0, f:I\times\R \rightarrow\R$

La EDO puede ser de primer orden si $f$ no depende de $y$ $\left( \frac {df} {dy} = 0   \right)$ , o autónoma si $f$ no depende de $t$ $\left( \frac {df} {dt} = 0   \right)$

### Métodos de Ruge-Kutta

Son unas familias de métodos que no requieren derivadas de orden mayor a 1. Solo se realizan mediciones en distintos puntos y estos se promedian. Entre estos métodos se encuentran el de **[Euler](#Método-de-Euler)**, **[Heun](#Método-de-Heun)** y **[RK4](#Método-RK4)**. Se puede calcular el [error](#Error) y la [validacion del paso](#Validación-de-$h$)

## Método de Euler

Es el método de Ruge-Kutta de primer orden.

### Algoritmo

1. Planteo la derivada por definición y lo igualo a la ecuación:

$$
\frac {Y(t_{k+1})-Y(t_k)}{h} = f(t_k,T(t_k))
$$

2. Despejo $Y(t_{k+1})$:

$$
Y(t_{k+1}) = Y(t_k)+ h \cdot f(t_k, Y(t_{k+1}))
$$

3. Discretizo la ecuación:

$$
Y_{k+1} = Y_k + h \cdot f(t_k,Y_k) 
$$

4. Itero hasta llegar a la precisión deseada.

$h$ es el valor del paso, y yo lo puedo elegir.

### Código Matlab

```matlab
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
```

Se puede descargar de [aca](Resources/Euler.m)

## Método de Heun

Es el método de Ruge-Kutta de orden 2 y se calcula realizando 2 mediciones distintas.

### Algoritmo

1. Realizo la primer medición:
   $$
   K_1 = h \cdot f(t_k,y_k)
   $$

2. Realizo la segunda medición:
   $$
   K_2=h \cdot f(t_k + h, y_k+K_1)
   $$

3. Creo la ecuación iterativa:
   $$
   y_{k+1}=y_k + \frac {K_1 + K_2} 2
   $$

### Código Matlab

```matlab
function y = Heun(f,h,n,yo)
	y = yo;
	
	for k = 1:n
		K1 = h * f(k,y);
		K2 = h * f(k+h,y+K1);
		y = y + (K1+K2)/2;
	end
end
```

Se puede descargar de [aca](Resources/Heun.m)

## Método RK4

Es el método de orden 4, que necesita 4 puntos de comparación.

### Algoritmo

1. Realizo todas las mediciones:
   $$
   K_1 = h \cdot f(t_k,y_k)\\
   K_2 = h \cdot f(t_k+\tfrac h2,y_k + \tfrac{K_1}2 )\\
   K_3 = h \cdot f(t_k + \tfrac h 2 , y_k + \tfrac {K_2} 2)\\
   K_4 = h \cdot f(t_k + h, y_k + K_3)
   $$

2. Creo la ecuación iterativa:
   $$
   y_{k+1}=y_k + \frac {K_1 +2\cdot K_2+ 2 \cdot K_3 + K_4}{6}
   $$

### Código Matlab

```matlab
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
```

Se puede descargar de [aca](#Resources/RK4.m)

## Error

El error se puede calcular de dos formas distintas:

- Si conozco la función:
  $$
  E_h(t)=Y(t) - Y_n^h \sim C \cdot h^i
  $$

- Si no conozco la función:

  Como no conozco la función, tengo que plantear el error con paso $h$ y con paso $\frac h 2$, y luego restarlos:
  $$
  E_h(t)=Y(t)-Y_n^h \sim C \cdot h^i\\
  E_{\frac h 2}(t)= Y(t) - Y_{2\cdot n}^{\frac h 2} \sim C \cdot \left(\frac h 2 \right)^i
  $$
  Al restar las ecuaciones, obtenemos que:
  $$
  E_\frac h2 (t) = Y_n^h-Y_{2 \cdot n}^{\frac h2} \sim C \cdot \left( h^i - \left(\frac h2 \right)^i \right)
  $$
  Entonces obtenemos que :
  $$
  C \sim (Y_n^h - Y_{2 \cdot n}^{\frac h 2}) \cdot \frac 1 {\left( h^i - \left(\frac h2 \right)^i \right)}
  $$
  Siendo $n$ el ultimo elemento del dominio (Aproximo con las dos $h$ al ultimo valor).

## Validación de $h$

Sabemos que $C \cdot h \sim E \le error$ entonces puedo reescribir $h = \frac {error } C$



## Método de Taylor

Sea la ecuación:
$$
y^r(t)=f_r(t,y(t))
$$
Si $r \gt 1$:
$$
y_{k+1}=y_k+h \cdot f(t_k,y_k) + \frac{h^2}{2!} \cdot f'(t_k,y_k) + \dots + \frac {h^r}{r!} \cdot f^{(r)}(t_k,y_k)
$$

### Error

El error se calcula de la misma forma que el error de [Ruge-Kutta](#Error) de orden 2













