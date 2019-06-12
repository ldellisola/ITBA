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
16. 

