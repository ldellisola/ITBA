# Matrices

Sea $\mathbb K = \C,\R,\Q$, $\mathbb K^{n\times m}=\{A$ es una matriz $n\times m$ con coeficientes en  $\mathbb K\}$

## Matrices Especiales

### Matriz Nula

$$
0^{n\times m} = 
\begin{pmatrix}
	0&&\dots&&0\\
	\vdots&&\ddots&&\vdots\\
	0&&\dots&&0
\end{pmatrix}
$$

### Matriz Diagonal

$$
D^{n\times m} =
\begin{pmatrix}
	a&&\dots&&0\\
	\vdots&&a&&\vdots\\
	0&&\dots&&a
\end{pmatrix}

~~~a\in\mathbb K
$$

### Matriz Triangular Superior

$$
M^{n\times m}=
\begin{pmatrix}
	a_{11}&&\dots&&a_{1n}\\
	\vdots&&a_{ii}&&\vdots\\
	0&&\dots&&a_{mn}
\end{pmatrix}
~~~~~~
a_{ij}=0~~si~~i\gt j
$$

### Matriz Triangular Inferior

$$
M^{n\times m}=
\begin{pmatrix}
	a_{11}&&\dots&&0\\
	\vdots&&a_{ii}&&\vdots\\
	a_{m1}&&\dots&&a_{mn}
\end{pmatrix}
~~~~~~
a_{ij}=0~~si~~i\lt j
$$

## Operaciones

### Transposición

Sea $A \in \mathbb K^{n\times m}$, $A^T \in \mathbb K^{m\times n}$ Entonces:
$$
(A^T)_{ij} = (A)_{ji}
$$

### Inversa

Sea $A\in \mathbb K ^{n\times n} \Rightarrow A^{-1} = B\in \mathbb K^{n\times n}$ es la inversa de $A \Leftrightarrow A\times B = B\times A = I$

- $\exist A^{-1} \Leftrightarrow R(A) = n$

- La inversa de $A$ es unica, si es que existe.
  - Demostración:

  Asumiendo que $B$ y $B'$ son inversas distintas de $A$:

$$
B = B \times I=B\times (A\times B')=(B\times A)\times B'=I\times B'=B'
$$

por lo que obtenemos que $B = B'$, por absurdo, solo existe un único $B$.

- Si $A,B \in \mathbb K^{n\times n }$ y ambas tienen inversa $\Rightarrow A\times B$ tiene inversa y es:
  $$
  (A\times B)^{-1} = B^{-1}\times A^{-1}
  $$

  - Demostración:

  $$
  (A\times B) \times (A\times B)^{-1} = A\times B \times B^{-1}\times A^{-1}=A\times I\times A^{-1} = A\times A^{-1}=I 
  $$

  $$
  (A\times B)^{-1}\times (A\times b) = B^{-1}\times A^{-1}\times A \times B = B^{-1}\times I \times B = B^{-1}\times B = I
  $$

- Si $A,B \in \mathbb K^{n\times n}$ y $\exists (A\times B)^{-1} \Rightarrow \exist A^{-1},B^{-1} $

### Suma

Sean $A \in \mathbb K^{n\times m}$, $B \in \mathbb K^{n\times m}$ y $C \in \mathbb K^{n\times m}$, entonces la suma se define como:
$$
C_{ij} = A_{ij} + B_{ij}
$$

### Producto por Escalar

Sea $\alpha \in \mathbb K$, $A \in \mathbb K^{n\times m}$ y $B \in \mathbb K^{n\times m}$, se define al producto escalar como:
$$
(B)_{ij} = \alpha\ .\ (A)_{ij}
$$

### Producto entre Matrices

Sea $A \in \mathbb K^{n\times m}$, $ B\in \mathbb K^{m\times r}$, $C \in \mathbb K^{n\times r}$, se define al producto matricial como:
$$
(C)_{ij}=\sum_{k=1}^{m}a_{ik}\ .\ b_{kj}
$$

## Propiedades

Sea $A \in \mathbb K^{n\times m},~~\alpha\in\mathbb K$

1. $A+B=B+A$
2. $A+(B+C)=(A+B)+C$
3. $A+0^{n\times m} = A$
4. $\forall A, \exists!(-A) /~~A+(-A)=0$
5. $A\times (B \times C) = (A\times B) \times C$
6. $A\times  I^{m\times m} = I^{n\times n } \times A = A$
7. $A\times 0 = 0 \times A = 0 $
8. $A\times(B+C) = A\times B + A \times C$
9. $\alpha\ .\ (A+B) = \alpha\ .\ A + \alpha\ .\ B$
10. $(\beta+\alpha)\ .\ A = \beta\ .\ A + \alpha\ .\ A$
11. $\alpha\ .\ (\beta\ .\ A) = \beta\ .\ (\alpha\ .\ A)$
12. $(-1)\ .\ A = (-A)$
13. $\alpha\ .\ (A\times B) = (\alpha\ .\ A)\times B = A \times  (\alpha\ .\ B)$
14. $1\ .\ A = A$
15. $0\ .\ A = 0$

## Aplicación en Sistemas de Ecuaciones

Se puede representar a un sistema de ecuaciones lineales como:
$$
A\times X=B
$$
Donde $A=(a_{ij}) \in \mathbb K^{n \times m}$, $B = \begin{pmatrix}b_1\\b_2\\\vdots\\b_n\end{pmatrix}$, $X = \begin{pmatrix} x_1\\ x_2 \\ \vdots \\ x_m \end{pmatrix}$

### Teorema

Considerando el sistema $A\times X = B~~~(S)$,

Sea $A\times X = 0~~~(Sh)$ el sistema homogéneo asociado, entonces:

1. El sistema asociado $(Sh)$ siempre es compatible.
2. Si $X,X'$ son soluciones de  $(Sh)$ entonces $\hat X_h = \alpha X+\beta X'$ es solucion de $(Sh)$.
3. Si $X_p$ es una solucion particular de $(S)$, entonces todas las soluciones de $(S)$ tienen la forma: $X=X_h + X_p$.

#### Demostraciones

1. El sistema asociado $(Sh)$ siempre es compatible.

Como $X = 0 \in \mathbb K^{m}$ es solucion de $(Sh)$, por que $A\times 0 = 0\in \mathbb K^{m}$, el sistema homogeneo es compatible.

2. Si $X,X'$ son soluciones de  $(Sh)$ entonces $\hat X_h = \alpha X+\beta X'$ es solucion de $(Sh)$.

Sea $X,X'$ soluciones de $(Sh)$ y $\alpha,\beta \in \mathbb K$, entonces: 
$$
\hat X = \alpha X +\beta X'
$$
Multiplico por $A$ a ambos lados
$$
A\times \hat X =A\times ( \alpha X +\beta X')
$$
Despejo a las constantes
$$
A\times \hat X = \alpha (A\times X) +\beta(A\times  X')
$$
Como $X$ y $X'$ son soluciones de la homogénea
$$
A\times \hat X = \alpha (0) +\beta(0) = 0
$$
Por lo que podemos ver que $A\times \hat X = 0$, por lo que es solucion de la homogénea.

3. Si $X_p$ es una solucion particular de $(S)$, entonces todas las soluciones de $(S)$ tienen la forma

$$
X=X_h + X_p
$$

Multiplico $A$ a ambos lados
$$
A\times X=A\times (X_h + X_p)
$$
Distribuyo
$$
A\times X=A\times   X_h + A\times X_p
$$
Por hipótesis:
$$
A\times X= 0 + B = B
$$
Así que podemos ver que $X$ es solucion del sistema.

#### Observaciones

Sea:
$$
A\times X = B~~(S)~~~~~~~~~~A\times X=0~~(Sh)
$$

1. Si $(Sh)$ es indeterminado, entonces tiene al menos 2 soluciones distintas $\Rightarrow \exist X'\neq0/~~X$ es solucion de $(Sh)$. Como $X=\alpha X'$ es solucion de $(Sh)~~~\forall \alpha\in\mathbb K$, $(Sh)$ tiene infinitas soluciones.
2. Supongamos que $(S)$ es compatible $\Rightarrow \exist X_p \in \mathbb K^m/~~X_p$  es solucion de $(S)$ y todas las soluciones de $(S)$ pueden escribirse como $X = X_p + X_h$. Por eso, $(S)$ tiene tantas soluciones como $(Sh)$ , por lo que si $(S)$ es determinado $\Leftrightarrow (Sh)$ es determinado.

### Sistemas Lineales Cuadrados

Sea el sistema
$$
A\times X = B~~~(S),~~con~\in\mathbb K^{n\times n},~B\in\mathbb K^n
$$
Entonces, si $\exists A^{-1}$, entonces $(S)$ es SCD y su unica solucion es $X = A^{-1}\times B$

- Demostración

1. $X = A^{-1}\times B$ es solucion de $(S)$

$$
A\times X = A\times (A^{-1}\times B) = I \times B = B
$$

2. La solucion es unica

Asumo que $\exists X'/~~X'$ es solucion del sistema
$$
A\times X' = B
$$
Multiplico a ambos lados por $A^{-1}$
$$
A^{-1}\times A\times X'= I\times X'=X' = A^{-1}\times B
$$

#### Teorema

Sea $A\in\mathbb K^{n\times n}$, con que uno de los siguientes ítems se cumplan, todos los demás se cumplen:

1. $A\sim I^n$
2. $R(A)=n$
3. $A\times X = 0$ es SCD
4. $A\times X = B$ es SCD $\forall B$
5. $\exist A^{-1}$ 

  



