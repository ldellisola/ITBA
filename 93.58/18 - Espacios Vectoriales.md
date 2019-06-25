# Espacios Vectoriales

Un espacio vectorial es un conjunto $V$ junto a un cuerpo de escalares $\mathbb K$, para los cuales hay definidas dos operaciones:

- Suma:

$$
u,v\in V \Rightarrow u+v \in V
$$

- Producto Escalar:

$$
v\in V,~\alpha\in \mathbb K \Rightarrow \alpha\ .\ v \in V
$$

Para ser un espacio vectorial, se tiene que cumplir con los 8 axiomas:

1. $u+v = v+u$
2. $u+(v+w)=(u+v)+w$
3. $\exists~0_V \in V/~~v+0_V =v$
4. $\forall v \in V,~~\exist (- v)/~~ v+(-v)=0_V$
5. $\alpha\ . \ (u+v) = \alpha\ .\ u + \alpha\ .\ v$
6. $(\alpha + \beta)\ .\ v = \alpha\ .v + \beta\ .\ v $
7. $\alpha\ .\ (\beta\ .\ v) = \beta\ .\ (\alpha\ .\ v)$
8. $1\ .\ v = v$

De cumplirse todos estos axiomas, se puede decir que $V$ es un espacio vectorial sobre $\mathbb K$ o que es un $\mathbb K$-Espacio Vectorial.

### Operaciones

Se pueden definir a las operaciones de suma y producto escalar en un determinado espacio vectorial.
$$
(V,\mathbb K,+~,\cdot~ )
$$
Siendo $V$ el espacio vectorial, $\mathbb K$ el cuerpo, $(+)$ la operación de la suma y $(\cdot)$ la operación del producto escalar.

#### Suma

La suma debe definirse como: 
$$
+:V\times V\rightarrow V
$$
y debe ser **Conmutativa**, **Asociativa**, debe tener **inversa** y un **elemento neutro**.

#### Producto Escalar

El producto escalar debe definirse como:
$$
\cdot:\mathbb K\times V \rightarrow V
$$
y debe ser **Conmutativa**, **Asociativa** y tener un que $1\cdot v=v$

### Propiedades

1. $0_V$ es único
2. $0_V \times v= 0_V$
3. $\alpha\ .\ v = 0 \Rightarrow \alpha = 0\or v=0_V$
4. $\forall v\in V\Rightarrow (-v)$ es único
5. $(-v) = (-1)\ .\ v$

### Ejemplos

- $\mathbb K^{n} = \{(x_1,x_2,\dots,x_n),~~x_i\in\mathbb K\}$ es un $\mathbb K$-Espacio vectorial con la suma y productos usuales.
- $\mathbb K^{n\times m}$ es un $\mathbb K$-Espacio vectorial con la suma matricial y el producto escalar de matrices.
- $\mathbb K[x]=\{p/~~p$ es un polinomio con coeficientes en $\mathbb K\}$ es un $\mathbb K$-Espacio vectorial con la suma y producto usuales.
- $\mathbb K_n[x] =\{p \in \mathbb K[x] /~~ gr(p)\leq n    \} \cup \{\empty\}$.

## Subespacios Vectoriales

Dado un $\mathbb K$-Espacio vectorial $V$, un subconjunto $S\subset V$ es un **subespacio vectorial** de $V$ si $S$ es un $\mathbb K$-Espacio vectorial con las operaciones definidas en $V$ y cuyo elemento nulo sea el mismo que el definido en $V$.

### Teorema

 Sea $V$ un $\mathbb K$-Espacio Vectorial y $S\sub V \Rightarrow S$ es un subespacio de $V \Leftrightarrow$ cumple con:

1. $0_v \in S $
2. $u,v \in S \Rightarrow u+v \in S$
3. $\alpha \in \mathbb K, v\in S \Rightarrow \alpha\ .\ v \in S$

### Subespacios Triviales

1. $S = \{0_V\}$
2. $S=V$

### Bases de un Subespacio

El conjunto $B=\{v_1,v_2,\dots,v_n\}$ es base de un subespacio $S$ si:

1. $B$ es un conjunto generador de $S$
2. $B$ es $LI$.

#### Bases Canónicas

- Base Canónica de $\mathbb K^n$

$$
E_n=

\left\{
\begin{pmatrix}
	1\\0\\\vdots\\0
\end{pmatrix},
\right.

\begin{pmatrix}
	0\\1\\\vdots\\0
\end{pmatrix},
\dots,
\left.
\begin{pmatrix}
	0\\0\\\vdots\\1
\end{pmatrix}

\right\}

$$

- Base Canónica de $\mathbb K^{n\times m}$

$$
E_{n\times m}=

\left\{
	\begin{pmatrix}
    	1		&	0	&	\dots	&	0	\\
    	0		&	\ddots	&&	0 	\\
    	\vdots	&&	\ddots&		\vdots\\
    	0		&	0	&	\dots	&	0
    	
	\end{pmatrix}
	,
	\begin{pmatrix}
    	0		&	1	&	\dots	&	0	\\
    	0		&	\ddots	&&	0 	\\
    	\vdots	&&	\ddots&		\vdots\\
    	0		&	0	&	\dots	&	0
    	
	\end{pmatrix}
	,\dots,
	\begin{pmatrix}
    	0		&	0	&	\dots	&	0	\\
    	1		&	\ddots	&&	0 	\\
    	\vdots	&&	\ddots&		\vdots\\
    	0		&	0	&	\dots	&	0
    	
	\end{pmatrix}
	,\dots,
	\begin{pmatrix}
    	0		&	0	&	\dots	&	0	\\
    	0		&	\ddots	&&	0 	\\
    	\vdots	&&	\ddots&		\vdots\\
    	0		&	0	&	\dots	&	1
    	
	\end{pmatrix}
	
\right\}
$$



- Base Canónica de $\mathbb K_n[x]$

$$
E_\mathbb {K_n[x]} = \{1,x,\dots,x^n\}
$$

#### Teorema

Si $G=\{v_1,v_2,\dots,v_n\}$ es un conjunto generador del subespacio $S$ y $S\neq\{0_V\}$
$$
\exist B \sub G/~~B~es~base~de~S
$$

### Dimensión de un Subespacio

Si el subespacio $S$ tiene una base $B=\{v_1,v_2,\dots,v_n\}$, entonces
$$
dim(S)=\#B = n
$$
El subespacio $\empty$ no tiene base $\Rightarrow dim(\empty)=0$

#### Ejemplos

- $dim(\mathbb K^n) = n$
- $dim(\mathbb K ^{n\times m}) = n\ .\ m$
- $dim(\mathbb K_n[x]) = n+1$



#### Teorema $(1)$

Si $B_1$ y $B_2$ son bases del subespacio $S$, entonces:
$$
\#B_1=\#B_2
$$

- Demostración: Usando el teorema $(2)$

Sean $B_1=\{v_1,v_2,\dots,v_n\}$, $B_2=\{v'_1,v'_2,\dots,v'_m\}$

Como $B_1$ es base de $S$, $B_2 \sub S$ y $B_2$ es $LI$.
$$
m\leq n~~~~~(I)
$$
Como $B_2 $ es base de $S$, $B_1 \sub S$ y $B_1$ es $LI$.
$$
n\leq m~~~~~(II)
$$
Por $(I)$ y $(II)$ 
$$
n = m
$$

#### Teorema $(2)$

Si $B=\{v_1,v_2,\dots,v_n\}$ es base del subespacio $S$, $\{w_1,w_2,\dots,w_m\} \in S$ y $m\gt n$, entonces:
$$
\{w_1,w_2,\dots,w_m\}~~es~LD
$$

- Demostración

Como cada $w_i \in S$ y $B$ es Base, entonces $\exist \alpha_i^q \in \mathbb K$ tal que:
$$
(I)~~~w_i = \alpha_i^1v_1+\alpha_i^2v_2+\dots+\alpha_i^n v_n = \sum_{j=1}^n \alpha_i^j v_j\\
(II)~~~\beta_1w_1+\beta_2 w_2+ \dots + \beta_m w_m = 0 \Leftrightarrow \sum_{i=1}^n \beta_i w_i
$$
Reemplazo el valor de $w_i$ de $(I)$ en $(II)$ 
$$
\sum_{i=1}^m (\beta_i\cdot \sum_{j=1}^n(\alpha_i^j v_j)) = 0
$$
Paso $\beta_i$ a la $2^{da}$ sumatoria y como son independientes cambio el orden de la suma
$$
\sum_{j=1}^n\sum_{i=1}^m \beta_i \alpha_i^j v_j = 0
$$
Puedo reemplazar los valores constantes $(\beta_i \alpha_i^j)$ por otra constante $(\gamma_j)$
$$
\sum_{j=1}^n \gamma_j v_j = 0
$$
Como los $v_j$ son $LI$ por ser base, $\gamma_1 \gamma_2=\dots= \gamma_n = 0$, por lo que:
$$
\sum_{i=1}^m \beta_i w_i = 0 \Leftrightarrow \sum_{i=1}^m \alpha_i^j \beta_i=0~~~j=1,2,\dots,n
$$
Por lo que puedo formar el sistema de ecuaciones
$$
(S)
\left\{
	\begin{array}{}
    	j=1 \rightarrow \beta_1\alpha_1^1 + \beta_2\alpha_2^1 + \dots + \beta_m\alpha_m^1\\
    	j=2 \rightarrow \beta_1\alpha_1^2 + \beta_2\alpha_2^2 + \dots + \beta_m\alpha_m^2\\
    	~~~~\vdots\\
    	j=n \rightarrow \beta_1\alpha_1^n + \beta_2\alpha_2^n + \dots + \beta_m\alpha_m^n\\
    \end{array}
\right.
$$
Como $(S)$ tiene $n$ ecuaciones y $m$ incógnitas, y $m\gt n$ (Dato). Entonces $(S)$ es indeterminado, es decir, existen soluciones con algún $\alpha_i \neq 0 \Rightarrow \{w_1,w_2,\dots,w_m\}$ es $LD$. 

#### Teorema $(3)$

Sea $S$ un subespacio de dimensión $n\geq 1$, $B=\{v_1,v_2,\dots,v_n\}\sub S$, entonces:
$$
(I)~~~B~es~generador~de~S \Leftrightarrow B~es~LI~~~(II)
$$

- Demostración $(I)\Rightarrow (II)$

Suponemos que $B=\{v_1,v_2,\dots,v_n\}$ es $LD$:

Podemos eliminar $v_i$ hasta obtener una base con una cantidad de elementos menor a $n$, por lo que $dim(S)\lt n$.

Pero para generar $S$ necesito que $dim(S)\geq n$, entonces es **ABSURDO!**

Por lo que podemos decir que es  $LI$.

- Demostración: $(II)\Rightarrow(I)$

Sea $v\in S$, $\{v_1,v_2,\dots,v_n,v\} \sub S$, por el Teorema $(2)$ $\{v_1,v_2,\dots,v_n,v\}$ es $LD$. 

Como $\{v_1,v_2,\dots,v_n,v\} $ es $LD\Rightarrow \exist\alpha_i,\beta \in \mathbb K$ no todos nulos, tal que:
$$
\alpha_1 v_1 + \alpha_2 v_2 + \dots + \alpha_n v_n + \beta v = 0
$$
Si $\beta = 0$
$$
\alpha_1 v_1 + \alpha_2 v_2 + \dots + \alpha_n v_n = 0
$$
Pero $\{v_1,v_2,\dots,v_n\} $ es $LI$, es decir $\alpha_1 = \alpha_2 = \dots = \alpha_n = 0$ y nosotros habíamos pedido que exista algún $\alpha_i \neq 0$ , por lo que se puede decir que $\beta \neq 0$.
$$
v = \frac{-\alpha_1}{\beta} v_1 + \frac{-\alpha_2}{\beta} v_2+ \dots + \frac{-\alpha_n}{\beta}v_n
$$
Entonces queda probado que todo $v\in S$ es combinación lineal de $\{v_1,v_2,\dots,v_n\} $
$$
S = gen(\{v_1,v_2,\dots,v_n\} )
$$


## Espacio Nulo de una Matriz

Sea $A\in \mathbb K^{n\times m}$, el espacio nulo de $A$ es:
$$
Nul(A)=\{X\in \mathbb K^{m} : A\times X = 0 \}
$$

### Teorema

Si $A \in \mathbb K^{n\times m}\Rightarrow Nul(A)$ es un subespacio de $\mathbb K^{m}$

- Demostración

  Verifico que  $Nul(A)$ cumpla con [las condiciones de ser un subespacio](#Subespacios-Vectoriales)

  1. $0_{\mathbb {K^m}} \in Nul(A)$ por que $A\times 0 = 0$
  2. La suma es cerrada en $Nul(A)$:

  Sean $X,X'\in Nul(A) \Rightarrow A\times X = 0,~~A\times X' = 0$
  $$
  A\times(X+X') = A\times X + A\times X' = 0
  $$
  $\therefore X+X' \in Nul(A)$

  3. El producto escalar es cerrado en $Nul(A)$:

  Sea $\alpha \in \mathbb K, X \in Nul(A)$
  $$
  A\times(\alpha\ .\ X) = \alpha\ .\ A\times X=0
  $$
  
  $\therefore \alpha\ .\ X \in Nul(A)$

Como valen $1)$, $2)$  y $3)$, por el teorema de los subespacios, $Nul(A)$ es un subespacio.

### Propiedades

$$
A\sim B\Rightarrow Nul(A) = Nul(B)
$$

Por que $A\times X = 0$ tiene la misma solucion que $B\times X=0$

 

