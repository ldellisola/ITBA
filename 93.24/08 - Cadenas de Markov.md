# Cadenas de Márkov

Las cadenas de Márkov son procesos de Márkov en tiempo discreto. Es decir, la probabilidad de que suceda un estad nuevo depende solo del estado actual. Se puede modelar a la probabilidad de transición como:
$$
P(X_{n+1}=x_{n+1}~|~X_n=x_n, X_{n-1}=x_{n-1},\dots)=P(X_{n+1}=x_{n+1}~|~X_n=x_n)
$$
Se puede modelar la probabilidad de pasar de un estado $(i)$ a otro estado $(j)$ en $t$ pasos de la siguiente forma:
$$
P_{i,j}^{(t)}(n)=P(X_{n+1}=e_j~|~X_n=e_i)
$$
Siendo $e_k$ los estados posibles.

## Representación Matricial

Para facilitar el calculo, se puede representar a las cadenas de Márkov como matrices:
$$
\mathbb{P}=
\left.
	\begin{array}{11}
		e_1 \\
		e_2\\
		\vdots \\
		e_m
	\end{array}
\right.
\begin{pmatrix}
	P_{1,1}^{(1)} & P_{1,2}^{(1)} & \dots & P_{1,m}^{(1)}\\
	P_{2,1}^{(1)} & P_{2,2}^{(1)} & \dots & \vdots \\
	\vdots		  & \ddots	\\
	P_{m,1}^{(1)} & P_{m,2}^{(1)} &\dots & P_{m,m}^{(1)}
	
\end{pmatrix}
\\
\begin{array}{}
~~~~~~~~~~~~~~\ e_1 & ~~~e_2 & ~\dots ~& e_m
\end{array}
$$
Siendo los estados de la columna el estado actual y estado en la fila es estado al que quiero llegar.

Una forma practica de calcular cuantos pasos se requieren para llegar de un estado a otro seria elevando la matriz $t$ veces hasta que la probabilidad de llegar a ese estado sea distinto de cero:
$$
\mathbb{P}^{(t)} = \mathbb P^{~t}
$$
Entonces la nueva matriz $\mathbb P^{~t}$ dice las probabilidades de llegar desde un estado hasta otro en $t$ pasos.

## Cadenas Regulares

### Definición 

Se dice que una cadena de Márkov es regular $\Leftrightarrow$ Existe un $t$ tal que $\mathbb P ^{~t}$ tiene todos sus elementos mayores a 0, es decir, es posible ir de un estado a cualquier otro en alguna cantidad de pasos.

### Teorema

Si una cadena de Márkov de estados finitos es regular (Condición suficiente) $\Rightarrow$
$$
\exists \vec\prod_\infty~ /~ lim_{n\rightarrow\infty}\vec\prod_n = \vec\prod_\infty~
$$
y es independiente de la condición inicial.

Una forma mas sencilla de ponerlo seria que  $\exists~t ~/~\mathbb P^{~t+1} = \mathbb P^{~t}$

$\vec\prod_t$ es la distribución de probabilidades de estados luego de $t$ pasos, y se consigue a partir de la distribución inicial. Se calcula de la siguiente forma:
$$
\vec\prod_t = [a_1,a_2,\dots,a_n]\times \mathbb P^{~t}
$$
Siendo el vector $[a_1,a_2,\dots,a_n]$ las condiciones iniciales del sistema.

### Como verificar si una cadena es regular

#### Método 1 (Calculadora programable)

Simplemente multiplica a la matriz con sigo misma para verifica que eventualmente llega a un valor estacionario. Si alguno de los elementos de esa nueva matriz es igual al 0, entonces la cadena no es regular.

#### Método 2 (Analítico)

==Acá hay algo raro. Tengo que preguntar==

Según el teorema, se puede plantear que:
$$
\vec\prod_\infty = 
\begin{pmatrix}
	a	&	b	&	c
\end{pmatrix}
=
\vec\prod_\infty \times\mathbb P
$$
Por lo que nos quedaría el siguiente sistema de ecuaciones
$$
\left\{

\begin{array}{ll}

    \begin{pmatrix}
        a	&	b &\dots	&	c
    \end{pmatrix}
    =
    \begin{pmatrix}
        a	&	b &\dots	&	c
    \end{pmatrix}
    \times
    \mathbb P \\
    a+b+\dots+c =1

\end{array}
\right.
$$
