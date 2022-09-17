# Factorización de Matrices

Muchas veces para resolver un sistema de ecuaciones necesitamos utilizar sus propiedades, pero por calculo directo es muy ineficiente. Por esto podemos descomponer a las matrices en un producto de 2 o más matrices que son más fáciles de utilizar.

Por ejemplo, si la matriz $A$ se puede factorizar como:
$$
A = LU
$$
Entonces el determinante se puede calcular el determinate de $A$ como:
$$
\det(A) = \det(L)\det(U)
$$
Si $L,U$ tienen propiedades que nos permiten calcular el determinante de forma fácil, nuestro tiempo de computación puede verse reducido de forma considerable.

## Factorización $PLU$ de una Matriz

Supongamos que tenemos una matriz $A \in \mathbb {K}^{m\times n},$ entonces:

> **Proposición 5.1.1**
>
> Si $A$ puede llevarse a una forma escalonada $U$ entonces existe una matriz triangular inferior $L$ con sus elementos en la diagonal iguales a $1,$ y matrices de intercambio de filas $P_l$ y de columnas $P_r$ tal que:
> $$
> P_l A P_r = LU
> $$

Ademas, si $A$ es invertible, la factorización $PLU$ es única.

La factorización $PLU$ esta relacionada con la eliminación Gaussiana (eso de los sistemas lineales). 

Para obtener la matriz $U$ tenemos que usar eliminación gaussiana hasta tener una matriz triangular inferior. Hay dos operaciones posibles:

- Permutación: Intercambia las posiciones de las filas de la matriz. Se representa con una matriz $P^{ij}$ que indica que la fila $i$ fue intercambiada con la fila $j.$ La matriz $P$ incialmente es la matriz identidad a la que se le intercambian las filas.

- Ejecución: Indica que se realizo alguna operación lineal entre dos filas. Se lo nota como $E^{ij}(b),$ que representa la matriz identidad que en la fila $i$ y columna $j$ tiene el valor $-b$ asignado. Otra forma de verlo es:
  $$
  E^{ij}(b) \implies F_i = F_i - b \times F_j
  $$
  Una característica de esta matriz es que su inversa es exactamente la misma matriz, con la excepción de que el valor $E^{-1}_{ij} = -E_{ij}.$

La matriz $P$ se calcula como:
$$
P = \prod P^{ij}
$$
Con $P^{ij}$ en el orden que se aplicaron.

Y la matriz $L$ se calcula como:
$$
L = \prod {(E^{ij}(b))}^{-1}
$$
Con $E^{ij}$ en el orden inverso al aplicado.

```octave
function [L U P s] = PLUD (A)2639
	[m n]=size(A);
	s=1;
	L=eye(n);P=L;
	for i = 1:n-1
		[~,r] = max(abs(A(i:n,i)));
		pivotindex = i + r -1;
		if (pivotindex ~= i)
			s=-s;
			A([i pivotindex],i:n) =A([pivotindex i],i:n);
			% Swap whole rows in P.
			P([i pivotindex],1:n) = P([pivotindex i],1:n);
			L([i pivotindex],1:i-1) = L([pivotindex i],1:i-1);
		endif
		% Compute the multipliers.
		multipliers = A(i+1:n,i)/A(i,i);
		% Use submatrix calculations instead of a loop to perform
		% the row operations on the submatrix A(i+1:n, i+1:n)
		A(i+1:n,i+1:n) = A(i+1:n,i+1:n) - multipliers*A(i,i+1:n);
		% Set entries in column i, rows i+1:n to 0.
		A (i+1:n,i) = zeros(n-i,1);
		L(i+1:n,i) = multipliers;
	endfor
	U = A;
endfunction
```

### Factorización $LU$ para Resolver Sistemas de Ecuaciones Lineales

Dado que la estructuras de las matrices $L,U$ es escalonada, la resolución del sistema se puede hacer con el **método de sustitución regresiva y progresiva**.

Si queremos resolver el sistema:
$$
A \vec x = \vec b
$$
Hacemos la factorización $LU$ de la matriz. Si no hace falta intercambiar las filas, podemos asumir que $P = I$ y simplificamos el proceso. Ahora tenemos que multiplicar por izquierda a $P,$ y reemplazar a $A$ por su factorización:
$$
\array{
PA\vec x = P\vec b\\
LU\vec x = P\vec b \\
L\vec v = P \vec b \\
U \vec x = \vec v
}
$$
Entonces, logramos partir a nuestro sistema de ecuaciones en dos sistemas:
$$
\array{
L\vec v = P \vec b &
U \vec x = \vec v
}
$$

### Calculo de Determinantes

Otra utilidad que tiene la descomposición $PLU$ es para obtener el calculo del determinante:
$$
\array{ 
A = P'LU \\
\det(A)= \det(P') \det(L)\det(U)
}
$$
Por la estructura de las matrices $L,U$ su determinante simplemente el producto de los elementos de la diagonal. En el caso de $L$ ademas podemos asegurar que va a ser 1.

El determinante de $P,$ por ser matriz de permutación es $\le 1.$ 

==Hay alguna magia?==

### Resolution de Multiples Sistemas Simultaneamente: Matriz Inversa

Otra aplicación es la resolución simultanea de un sistema de ecuaciones en el cual la matriz del sistema es la misma, pero el vector de los términos independientes cambia:
$$
\array{A \vec x_i = \vec b_i & 1 < i \le M}
$$
Utilizar la descomposición $PLU$ nos permite realizar el calculo solo una vez. Lo que se trate de evitar es la inversa de la matriz por métodos directos.

El siguiente código trata de resolver este problema:

```octave
function X = LUSOLVE (A, B)
	[L,U,P] = PLUD(A);
	k = size(B,2);
	pb = P*B;
	X = zeros(size(B));
	for i = 1:k
		yi = FSUB (L, pb (:, i));
		xi = BSUB (U, yi);
		X (:, i) = xi;
	endfor
endfunction
```

## Factorización $QR$ por el Método de Gram-Schmidt

La factorización $QR$ consiste en escribir a $A$ como el producto de una matriz ortogonal $Q$ junto a una matriz $R$ escalonada:
$$
A = QR
$$

> **Definición 5.1**
>
> Una Matriz de Rango Completo es una matriz de $m\times n$ que su rango $r$ es igual al minimo entre $m,n:$
> $$
> r = \min(m,n)
> $$
> Si $A \in \R^{m\times n}$ y $m >n$ entonces para que $A$ tenga rango completo las $n$ columnas de $A$ deben ser linealmente independientes. Si $m < n$ entonces las $m$ filas deberían serlo.

> **Definición 5.2**
>
> La factorización de $A$ puede realizarse de dos maneras:
>
> - Completa: $A^{m\times n} = Q^{m \times m}R^{m\times n}$
> - Reducida: $A^{m\times n} = Q^{m\times n}R^{r\times n}$

> **Proposición 5.2.1**
>
> Si $A^{m\times n}$ es una matriz de rango completo con $m > n$ entonces existe una matriz $Q^{m\times n}$ ortonormal y una matriz $R^{n\times n}$ triangular superior con elementos positivos en la diagonal tal que:
> $$
> A = QR
> $$
> Si sacamos el requerimiento de que $A$ sea de rango completo, entonces no se puede asegurar la unicidad.

Para obtener la matriz $Q$ puedo usar el método de Gram-Schmidt en su version modificada. Esto nos garantiza que esta sea ortogonal.

Puedo obtener $R$ de la siguiente forma: :
$$
\array{
A = QR \\
Q'A = Q'QR\\
Q'A = R\\
}
$$
Y puedo hace esto ya que $Q$ es ortogonal y su inversa es igual que su transpuesta.

Este proceso esta implementado en la siguiente función:

```octave
function [Q,R]=QRMOGRSCH(A)
  [m n]=size(A);
  Q=zeros(size(A));
  for i = 1:n
    Q(:, i) = A(:, i);
    for j = 1:i-1
      R(j, i) = Q(:,j)’*Q (:,i);
      Q(:, i) = Q(:,i) -R(j,i)*Q(:,j);
    endfor
    R (i, i) = sqrt(Q(:, i)’*Q(:, i));
    Q (:, i) = Q(:,i)/R(i,i);
    endfor
endfunction
```

> **Definición 5.3**
>
> La matriz de Hilbert es una matriz cuadrada cuyos elementos surgen de la expresión:
> $$
> H_{i,j} = \frac{1}{i+j-1}
> $$
> En Octave esta implementada con el método `hilb(n)`

## Factorización $QR$ por el Método de las Reflexiones de Householder

Este método comienza construyendo una matriz escalonada a partir de $A,$ por lo que generara la version completa de la factorización $QR.$ 

### Reflexiones de Householder

Este método esta basado en proyecciones ortogonales, específicamente la proyección sobre un subespacio ortogonal a una dirección $\vec u$ viene dada por:
$$
\vec v_\bot = \vec v - P_{\vec u}(\vec v)
$$
Si en lugar de restar la proyección de $\vec v$ restamos dos veces ese vector, obtenemos una reflexión de $\vec v$ en el espacio ortogonal a la recta generada por $\vec u:$

<img src="Resources/05 - Factorizacion de Matrices/Screen Shot 2022-09-12 at 19.48.14.jpg" alt="Screen Shot 2022-09-12 at 19.48.14" style="zoom:50%;" />

$\vec v_\bot$ esta contenido en el subespacio ortogonal $\vec u^\bot,$ llamado **proyección ortogonal**. Para obtener la reflexión $\vec v_R$ debemos hacer:
$$
\vec v_R = \vec v - 2 \mathbb{P}_\vec u(\vec v)
$$
Y la matriz que corresponde a este operador de reflexión sera:
$$
\mathbb{H} = \mathbb {I} - 2 \mathbb{P}_\vec u = \mathbb I - 2 \hat u\hat u'
$$
Si usamos el versor en la dirección de $\vec u$ se puede compactar la operación:
$$
\mathbb{H}_\vec u \vec v = \vec v - 2<\vec v; \hat u>\hat u
$$
Las matrices de reflexión tienen propiedades interesantes:

1. $\mathbb H_\vec u$ es simetrica
2. $\mathbb H_\vec u$ es ortonormal
3. $\mathbb H_\vec u^2=\mathbb I$
4. $\mathbb H_\vec u\vec v = \vec v \implies <\vec v;\vec u> = 0$ 

### Reduction a Cero de Elementos de una Columna de Vector Mediante Reflexiones de HouseHolder

> **Proposición 5.3.1**
>
> Dado un vector $\vec x \in \mathbb K^n$ se puede encontrar un vector $\vec u_k$ tal que:
> $$
> \mathbb H_\vec {u_k} = x_k\delta_{ik}\hat e_i
> $$

Este proceso nos permite encontrar una matriz de reflexión de HouseHolder que anula todas las coordenadas de $\vec x$ salvo las que corresponden a la dirección $k.$ Tiene los siguientes pasos:

1. Se toma $s = \text{sig}(x_k)||\vec x||$
2. Se hace $\vec u = \vec x$
3. Se reemplaza $u_k = x_k + s$
4. $\mathbb H_\vec u = \mathbb I - 2 \frac{\vec u\vec u'}{||\vec u||^2}$

### Reduction a Cero de Elementos de una Columna de una Matriz Mediante Reflexiones de HouseHolder

El procedimiento anterior se puede aplicar a cada columna de una matriz, de manera tal que el producto sucesivo por las matrices de Householder llevaran a la matriz original a una forma escalonada.

### Aplicaciones de la Factorización QR

#### Sistemas de Ecuaciones

Una de las aplicaciones más importantes de la descomposición QR es la resolución de sistemas de ecuaciones:
$$
\array{
A \vec x = \vec b \\
QR\vec x = \vec b \\
Q'QR \vec x = Q'\vec b \\
R\vec x = Q' \vec b
}
$$
Como $R$ es escalonada, el sistema de ecuaciones se puede resolver rápidamente por sustitución regresiva.

#### Calculo de Modulo del determinante de una matriz

Como $A=QR$ es el determinante de $A$ se puede obtener el determinante de $A$ como:
$$
\det(A)= \det(Q)\det(R)
$$
Como $Q$ es ortonormal, su determinante es $\pm1$ y como $R$ es escalonada, su determinante es el producto de los elementos de la diagonal:
$$
\det(A) = \det(Q)\det(R) = (-1^k) \prod_{i=1}^nr_{ii}
$$
Donde $k$ por lo general es $n-1.$

### Base Ortonormal del Espacio Columnas de una Matriz

> **Proposición 5.3.2**
>
> Si $A \in\mathbb {K}^{m\times n}$ es una matriz de rango completo con $m \ge n$ y $A = QR$ es una factorización reducida de $A$ con $r_{ii}\neq 0$ entonces las columnas de $Q$ son una base ortonormal del espacio de columnas de $A.$

