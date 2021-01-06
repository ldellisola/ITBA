# Interpolación Polinómica



## Forma de Potencias

$$
P_n(x)=a_0 + a_1x+ \dots+a_n x^n
$$

## Forma de Lagrange

$$
P_n(x)=\sum_{i=0}^n y_i \cdot \prod_{k=0}^i \frac {x-x_k}{x_i-x_k}~~~~~k \neq i
$$

## Forma de Newton

$$
P_n(x) = c_0 + \sum_{i=1}^n c_i \cdot \prod_{k=0}^{n-1} (x-x_k)
$$



## Tabla de Diferencias Divididas

La tabla de diferencias divididas se forma a partir de una tabla donde se tienen algunos valores de $x$ y de $f(x)$.

Si se tiene la tabla

|  $x$  | $f(x)$ |        $c_1$         | $c_2$ | $c_3$ |
| :---: | :----: | :------------------: | :---: | :---: |
| $x_1$ | $y_1$  | $\frac{y_1 - y_2}{}$ |       |       |
| $x_2$ | $y_2$  |                      |       |       |
| $x_3$ | $y_3$  |                      |       |       |
| $x_4$ | $y_4$  |                      |       |       |
| $x_5$ |        |                      |       |       |



## Matriz de Vandermonde $\mathbb V$

Para calcular la Matriz de Vandermonde se necesita una lista con distintos valores de $x$ y $f(x)$, y luego evaluamos un polinomio genérico en esos valores, y a partir de eso formamos un sistema de ecuaciones lineales.

La matriz $\mathbb V$ esta compuesta por los elementos $\mathbb {V}_{i,j} = x_{i-1}^{n-j+1}$, $i,j \in[1,2,\dots,n+1]$

A partir de esto podemos obtener las siguientes conclusiones:

1. $\begin{pmatrix} a_n\\a_{n-1} \\ \vdots \\ a_0 \end{pmatrix} = \mathbb V^{-1} \times Y$
2. $\mathbb V$ esta completa
3. El sistema lineal esta mal condicionado, por lo que peque;os cambios en los datos traen grandes cambios en la solucion, entonces no vale la pena utilizar este método si hay muchos puntos a evaluar.

#### Ejemplo

Sea $f(x)$ :

| $x$  |  $f(x)$  |
| :--: | :------: |
|  -1  | $y_{-1}$ |
|  0   |  $y_0$   |
|  1   |  $y_1$   |

Evaluamos cada valor de $x$ en un polinomio genérico:
$$
a_0 + a_1 \cdot(-1) + a_2 \cdot (-1)^2 = y_{-1}\\
a_0 + a_1 \cdot (0) + a_2 \cdot (0)^2  = y_0 \\
a_0 + a_1 \cdot (1) + a_2 \cdot (1)^2  = y_1
$$
Entonces si planteamos al sistema de ecuaciones lineales como un producto de matrices:
$$
\begin{pmatrix}
	1	&	-1	&	1	\\
	0	&	0	&	1	\\
	1	&	1	&	1	\\
\end{pmatrix}
\times
\begin{pmatrix}
	a_2	\\
	a_1	\\
	a_0
\end{pmatrix}
=
\begin{pmatrix}
	y_{-1}	\\
	y_0		\\
	y_1
\end{pmatrix}
$$
Donde
$$
\mathbb V =
\begin{pmatrix}
	1	&	-1	&	1	\\
	0	&	0	&	1	\\
	1	&	1	&	1	\\
\end{pmatrix}
$$
Y si resolvemos el sistema podemos encontrar el valor de cada valor de $a_i$ .

## Aplicaciones

### Derivadas

$$
f^{(r)}(x) \sim P_n^{(r)}(x)
$$

### Integrales

$$
\int^a_b f(x) dx \sim \int^a_b P_n(x) dx
$$

