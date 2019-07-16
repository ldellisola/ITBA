# Sistemas de Ec. Lineales por Métodos Iterativos

Solo vamos a analizar casos donde el numero de ecuaciones sea igual al numero de incógnitas (Matrices cuadradas).
$$
a_{11}x_1 +a_{12}x_2+\dots+a_{1n}x_n=y_1\\
a_{21}x_1 +a_{12}x_2+\dots+a_{2n}x_n=y_2\\
\dots\\
a_{n1}x_1 +a_{1n}x_2+\dots+a_{nn}x_n=y_n\\
$$
Puede ser escrito en matrices de la siguiente forma:
$$
A\ .\ X=Y~~~(1)
$$
Siendo $A\in R^{~n\times n}, ~ Y\in R^n$

Esta ecuación de matrices tiene solución unica si $A$ es **regular**, es decir, tiene inversa.

La ecuación puede ser resuelta de distintas formas  de similar complejidad, siendo estas **resolviendo el sistema de ecuaciones**, **encontrando la inversa** o **Utilizando determinantes**.

## Métodos de solucion de $(1)$

### Métodos Directos

Son los vistos en Algebra de informáticos y se llama **método de eliminación de Gauss**. Este método implica $n-1$ pasos de eliminación.

Cada paso implica elegir una incógnita en particular y mediante combinaciones lineales eliminar a esa incógnita en particular del resto de las ecuaciones. Esto nos da como resultado una **matriz triangular superior**, a la cual solo deberíamos sustituir los valores y llegaríamos al resultado. **Este método no es una aproximación**, sino que resulta en un sistema de ecuaciones equivalente mediante sumas o productos.
$$
[A~Y]\longrightarrow n-1~pasos~de~eliminacion\longrightarrow [\mathbb U~\mathbb B]\longrightarrow Sustitucion~hacia~atras \longrightarrow \mathbb X
$$

#### Ejemplo

$$
\begin{pmatrix}
0&1&2&3&|&-0.2\\
0&1&4&12&|&0.8\\
1&1&1&1& |&1.5\\
1&2&4&8&|&1.2
\end{pmatrix}
\sim
\begin{pmatrix}
1&0&0&0\\
0&1&0&0\\
0&0&1&0\\
0&0&0&1
\end{pmatrix}
$$

Reacomodo las fila: $f_1\leftrightarrow f_3$
$$
\begin{pmatrix}
1&1&1&1& |&1.5\\
0&1&4&12&|&0.8\\
0&1&2&3&|&-0.2\\
1&2&4&8&|&1.2
\end{pmatrix}
\sim
\begin{pmatrix}
0&0&1&0\\
0&1&0&0\\
1&0&0&0\\
0&0&0&1
\end{pmatrix}
$$
Realizo una combinación lineal:

- $f_1=f_1-\frac{0}{1}\ .\ f_1$
- $f_2=f_2-\frac{0}{1}\ .\ f_1$
- $f_3=f_3-\frac{0}{1}\ .\ f_1$
- $f_4=f_4-\frac{1}{1}\ .\ f_1$

$$
\begin{pmatrix}
1&1&1&1& |&1.5\\
0&1&4&12&|&0.8\\
0&1&2&3&|&-0.2\\
0&1&3&7&|&-0.3
\end{pmatrix}
\sim
\begin{pmatrix}
0&0&1&0\\
0&1&0&0\\
1&0&0&0\\
0&0&-1&1
\end{pmatrix}
$$

Combinación Lineal:

- $f_1=f_1-\frac{0}{1}\ .\ f_2$
- $f_2=f_2-\frac{0}{1}\ .\ f_2$
- $f_3=f_3-\frac{1}{1}\ .\ f_2$
- $f_4=f_4-\frac{1}{1}\ .\ f_2$

$$
\begin{pmatrix}
1&1&1&1& |&1.5\\
0&1&4&12&|&0.8\\
0&0&-2&-9&|&-1\\
0&0&-1&-5&|&-1.1
\end{pmatrix}
\sim
\begin{pmatrix}
0&0&1&0\\
0&1&0&0\\
1&-1&0&0\\
0&-1&-1&1
\end{pmatrix}
$$

Combinación Lineal:

- $f_1 =f_1-\frac{0}{2}\ .\ f_3$
- $f_2 =f_2-\frac{0}{2}\ .\ f_3$
- $f_3 =f_3-\frac{0}{2}\ .\ f_3$
- $f_4 =f_4-\frac{1}{2}\ .\ f_3$

$$
\mathbb U=
\begin{pmatrix}
1&1&1&1& |&1.5\\
0&1&4&12&|&0.8\\
0&0&-2&-9&|&-1\\
0&0&0&-0.5&|&-0.6
\end{pmatrix}\sim
\begin{pmatrix}
0&0&1&0\\
0&1&0&0\\
1&-1&0&0\\
-0.5&-0.5&-1&1
\end{pmatrix}
$$

Entonces el sistema se resuelve con:
$$
\mathbb P\times \mathbb A = \mathbb L \times \mathbb U
$$
Siendo la matriz $\mathbb L$:
$$
\mathbb L = 
\begin{pmatrix}
	1	&	0	&	0	&	0	\\
	0	&	1	&	0	&	0	\\
	0	&	1	&	1	&	0	\\
	1	&	1	&	0.5	&	1	\\
\end{pmatrix}
$$
Para calcular la matriz $\mathbb L$ hay que hacer una **matriz triangular inferior** y luego rellenar los valores internos con los números utilizados para multiplicar en las combinaciones lineales.

### Métodos Iterativos

Estos métodos son de **aproximación**, por lo cual tiene errores de redondeo. Tambien al ser un proceso iterativo, se aplica la misma función $m$ veces hasta que la aproximación sea lo suficientemente buena.
$$
\mathbb X_0 \rightarrow \mathbb X_1 \rightarrow\mathbb X_m \rightarrow (m\rightarrow \infty)\rightarrow \mathbb X
$$
El error de aproximación es:
$$
E<|| \mathbb X_m - \mathbb X ||
$$

#### Formas Generalizadas

1. Se explicita la incógnita de la ecuación (para la primer ecuación de explicita la primera ecuación)

$$
x_i=(y_i-\sum_{j=1}^{i-1}{a_{ij}x_j}-\sum_{j=i+1}^{n}{a_{ij}x_j})/ a_{ii}~~~i=1,2,\dots,n
$$

2. Aquí se separan los métodos y se especifica la iteración:

   - **Jacobi**:

   $$
   x_i^{k+1}=(~y_i-\sum_{j=1}^{n}{a_{ij}x_j^k}~)/ a_{ii}~~~i=1,2,\dots,n
   $$

   - **Gauss-Seidel**:

   $$
   x_i^{k+1}=(y_i-\sum_{j=1}^{i-1}{a_{ij}x_j^{k+1}}-\sum_{j=i+1}^{n}{a_{ij}x_j^k})/ a_{ii}~~~i=1,2,\dots,n
   $$

#### Condición de Convergencia

Si $\mathbb A \in \R^{n\times n}$ es diagonal estrictamente dominante, entonces:
$$
|a_{ij}|\gt \sum_{j=1}^n|a_{ij}| ~~~ \forall i=1,2,\dots,n
$$
Entonces para ambos métodos se cumple:
$$
\{x_i^{(k)}\}_{k=0}^{\infty}~~es~convergente~~ \forall i=1,2,\dots,n
$$
Este teorema dice que si el coeficiente que multiplica a la incógnita de la ecuación que estoy analizando es mayor a la suma de los módulos de los demás coeficientes de la ecuación, entonces la serie converge. Tambien es necesario que la matriz del problema sea diagonal dominante, es decir, que los coeficientes de las diagonales sean mayores a los demás coeficientes de la fila.

#### Condición de Parada

Establece hasta que valor de $m$ conviene seguir iterando, ya que después de ese valor, cualquier iteración no va a ser menor a una cota. Utiliza la norma infinito, un caso especial de la [Norma $p$](#Norma-P)
$$
Sea~E\gt0~~\rightarrow  ||\mathbb X_m - \mathbb X_{m-1}||_\infty \lt E
$$

#### Error de Aproximación

El error de aproximación del método de **Jacobi** siempre va a ser mayor al del método de **Gauss-Seidel** para la misma cantidad de pasos.

#### Código Matlab Jacobi

```matlab
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
```

Se puede descargar de [aca](Resources/jacobi.m)

#### Código Matlab Gauss-Seidel

```matlab
# b es el termino independiente
function [x,k,e] = GaussSeidel(A,b,tol)
    e = 2 * tol; 
    n = lenght(b);
    x = zeros(n); 
    y = zeros(n); 
    k = 0;

    while e > tol

        for m =1:n
            y(m) = (b(m) - A(m,1:m-1) * y(1:m-1) - A(m,m+1:n) * x(m:m+1:n))/ A(m,m);
        end
        e = norm(y-x,inf);
    end 
    x = y; 
    k = k +1;
end
```

Se puede descargar de [aca](Resources/gaussseidel.m)

#### Ejemplo

$$
\left\{
	\begin{array}{}
		2x_1+x_2=8\\
		x_1-2x_2=-1
	\end{array}
\right.
$$

Reordenamos el sistema para despejar a las incógnitas.
$$
\left\{
	\begin{array}{}
		x_1 = \frac{8-x_2}{2}\\
		x_2 = \frac{-1-x_1}{-2}
	\end{array}
\right.
$$
Hay dos formas de continuar:

- Sustitución Simultanea (**Jacobi**):

En este método siempre utilizo los valores de la iteración previa.
$$
\left\{
	\begin{array}{}
		x_1^{k+1} = \frac{8-x_2^k}{2}\\
		x_2^{k+1} = \frac{-1-x_1^k}{-2}
	\end{array}
\right.
$$

- Sustitución Sucesiva (**Gauss-Seidel**):

En este método utilizo para una variable el valor de la iteración previa pero para la otra utilizo el valor obtenido en esta iteración.
$$
\left\{
	\begin{array}{}
		x_1^{k+1} = \frac{8-x_2^k}{2}\\
		x_2^{k+1} = \frac{-1-x_1^{k+1}}{-2}
	\end{array}
\right.
$$

# Anexo

## Norma P

Trabajando en $\R^n$ , $v=\sum_{i=1}^nv_i\ .\ e_i$, siendo $e_i$ la base canónica.
$$
|| V||_p=(\sum_{i=1}^n|v_i|^p)^\frac{1}{p}~~~p\in\N
$$

## Propiedades

- $\lim_{p\rightarrow\infty}||V||_p = max_{1\leq p \leq \infty} |V_i|$
- $||V||_{p+1}\lt ||V||_p~~~~\forall p$









