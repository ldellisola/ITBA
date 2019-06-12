# Sistemas de Ecuaciones Lineales

$$
\left\{
	\begin{array}{}
		a_{11}x_1 + a_{12}x_2+\dots+a_{1m}x_m=b_1\\
		~~~~~~~~~~~~~~~~~~~~~~~~~~\vdots\\
		a_{n1}x_1 + a_{n2}x_2+\dots+a_{nm}x_m=b_n\

		
	\end{array}
\right.
$$

Siendo $a_{ij},b_i \in \mathbb K$, $\mathbb K = \Q,\R~o~\C $ .

$x_m$ son las incógnitas, $a_{ij}$ son los coeficientes del sistema y $b_i$ los términos independientes.

### Matrices asociadas al sistema:

$$
A = 
\begin{pmatrix}
	a_{11}	&	a_{12}	&	\dots	& a_{1m}	\\
	a_{21}	&	a_{22}	&	\dots	& a_{2m}	\\
	&\ddots\\
	a_{n1}	&	a_{n2}	&	\dots	& a_{nm}	\\
\end{pmatrix}
~~~~~~~~~~
B = 
\begin{pmatrix}
	b_1\\b_2\\\vdots\\b_n
\end{pmatrix}
$$

Y la **matriz ampliada** es:
$$
[A|B]
$$

### Teorema

Considerando que el sistema de ecuaciones lineales con $n$ ecuaciones y $m$ incógnitas, por lo que la matriz ampliada $[A|B], A\in \mathbb K^{n\times m}$, entonces:

1. El sistema es compatible $\Leftrightarrow R(A) = R([A|B])$.
2. Suponiendo que el sistema es compatible, Numero de Variables libres $=$ Numero de Variables $-R(A)$.
3. El sistema es determinado $\Leftrightarrow m = R(A)$.

#### Corolarios

1. Si $R(A) = n$ entonces:

   ​	Como $R([A|B]) \leq min(n,m+1) \leq n$ y $R(A) \leq R([A|B])$:
   $$
   n = R(A)\leq R([A|B])\leq n
   $$
   ​	Por lo que obtenemos:
   $$
   R(A)=R([A|B])~~~~y~~~~ el~sistema~es~compatible
   $$

2. Si $R(A)=m$ y el sistema es compatible, entonces el sistema es determinado.

3. Si $m=n$ y $R(A)=n$, entonces el sistema siempre es compatible determinado, independiente de $B$.

## Método de Eliminación de Gauss

Se efectúan operaciones sobre las ecuaciones, que cambian a las mismas, pero no modifican a la solucion.

Operaciones permitidas:

- Intercambio de ecuaciones.
- Multiplicar por escalares distintos de 0;
- Reemplazar a una ecuación por la suma de esta con un múltiplo de otra ecuación.

Se aplican estas operaciones con el objetivo de obtener un sistema equivalente cuya solucion es sencilla, es decir, para que sea mas simple operar sobre las matriz ampliada.

El sistema es **compatible** si tiene solucion. Luego, puede ser **determinado** si tiene solo una solucion o **indeterminado** si tiene infinitas.

## Equivalencia de Matrices

Sea $A \in \mathbb K^{n\times m}$, es equivalente a la matriz $B \in \mathbb K^{n\times m}$ si aplicando las operaciones elementales detalladas en el método de eliminación de Gauss sobre $A$ se obtiene $B$. Se nota:
$$
A\sim B
$$
Esta relación es de equivalencia, por lo que:

- $A\sim A$
- $A\sim B \Rightarrow B\sim A$
- $A\sim B \and B\sim C \rightarrow A\sim C $

### Aplicación a Sist. de Ecuaciones

Si $[A|B]$ y $[A'|B']$ son las matrices aplicadas de dos sistemas de $n$ ecuaciones y $m$ incógnitas, y e cumple que $[A|B]\sim[A'|B']$, entonces los sistemas de ecuaciones tienen la misma solucion.

## Matrices Escalonadas y Reducidas

La matriz $A\in\mathbb K^{n\times m}$ esta de forma escalonada si cumple con:

- El primer coeficiente no nulo de la izquierda de una fila no nula es 1 (Se lo denomina 1 principal).
- El uno principal de la fila superior siempre esta a la izquierda del de la fila inferior.
- Las filas nulas, si las hubiera, están en la parte inferior de la matriz.

Si además de cumplir con esas condiciones, cumple con la siguiente, entonces se puede decir que la matriz es **escalonada reducida**:

- En la columna del 1 principal, el resto de los coeficientes es 0.

### Teorema

Sea $A\in\mathbb K^{n\times m} \Rightarrow \exist!B\in\mathbb K^{n\times m}$ de forma escalonada reducida tal que:
$$
A\sim B
$$

## Rango de una Matriz

Sea $A \in \mathbb K^{n\times m}$, el rango de A $R(A)$ es el numero de 1s principales  que tiene la forma escalonada reducida de $A$.

Por lo general:

1. Si $A,B\in \mathbb K^{n\times m}/~~A=[A_1A_2]~~,~~B=[B_1B_2] $, con $A_1,B_1 \in \mathbb K^{n\times m_1}$, $A_2,B_2\in \mathbb K^{n\times (m-m_1)}$, si $A\sim B$, entonces:

$$
A_1\sim B_1~~~~~~A_2 \sim B_2 
$$

2. Si $E = [E_1E_2]$, con $E_1\in \mathbb K^{n\times m_1}$ y $E_2\in \mathbb K^{n\times (m-m_1)}$, $E$ es de forma escalonada reducida, por lo que $E_1$ es de forma escalonada reducida, y $[A_1A_2]\sim[E_1E_2]$, entonces:

$E_1$ es la forma escalonada reducida equivalente a $A_1$.

