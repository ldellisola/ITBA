# Función de Variable Aleatoria

Una función de variables aleatorias es una nueva variable aleatoria compuesta por una o mas variables aleatorias. Básicamente funciona como una función compuesta.

### Ejemplo

Buscar $F_Y(y)$ dado que $Y = X^2$, dado que $X$ es:

- $X\sim Binomial(3,0.5)$:

Obtenemos que los recorridos son:
$$
R_X=\{0,1,2,3\}\ \ ,\ \ R_Y=\{0,1,4,9\}
$$
Si queremos calcular el valor medio:
$$
\mu =E[Y] = E[X^2]=E[x^2]=\sum_{x=0}^{3}x^2\ .\ {0.5^x}\ .\ 0.5^{(3-x)}\ .\ 
\begin{pmatrix}
	3\\x
\end{pmatrix} = 3
$$

- $X\sim N(0,1)$

$$
E[Y]=E[x^2]= E[x^2]-E[x]^2 = \sigma^2=1
$$

$$
f_Y(y)=
\left\{
	\begin{array}{ll}
	0\ \ ,\ \ y < 0\\
	P(x^2\leq y) = P(\sqrt y \leq x \leq \sqrt y) = 1\ .\ \Phi(\sqrt y) -1\ \ ,\ \ y\geq 0
	\end{array}
	\right.
$$

