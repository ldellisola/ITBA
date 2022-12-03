# Sistemas de Ecuaciones Lineales

En una ecuación lineal, las incógnitas no aparecen multiplicandose ni elevadas a una potencia distinta de 1. Una ecuación lineal con $n$ incognitas se puede escribir como:
$$
b = \sum_{i=1}^n a_ix_i
$$
Por lo que un sistema lineal de $n$ ecuaciones con $n$ incognitas se representa como:
$$
\array{
b_j = \sum_{i=1}^n a_{ji}x_i & j = 1,\dots,n
}
$$
Este sistema se puede describir en forma matricial como:
$$
M \vec x = \vec b
$$
Y su solución es inmediata si $M$ es inversible:
$$
\vec x =  M^{-1}\vec b
$$
Si el vector $\vec b$ es nulo, se dice que el sistema es **homogeneo**.

> **Definición 1.18**
>
> Se dice que un **sistema es compatible** cuando admite soluciones. Se denominara **compatible determinado** cuando hay una única solución y **compatible indeterminado** si hay infinitas soluciones. De no adminit ninguna solución, entonces se dice que es **incompatible**.

> **Definición 1.19**
>
> Llamaremos **matriz ampliada** de un sistema lineal de ecuaciones a la que resulta de poner el vector independiente del sistema como la ultima columna de la matriz del sistema. Si el sistema es de $n\times n$ entonces la matriz ampliada es de $n\times (n+1).$

> **Definición 1.20**
>
> Una matriz es **escalonada** si cumple con:
>
> 1. Todas las filas cero están en la parte inferior de la matriz.
> 2. El primer elemento distinto de cero en una fila esta a la derecha del elemento diferente de cero de la fila anterior.
> 3. El primer elemento diferente de $0,1$ de cada fila esta a la derecha del primer elemento diferente de $0.$

Para llevar a una matriz a su forma escalonada, debemos utilizar eliminación gaussiana.

> **Definición 1.21**
>
> Si una matriz tiene $m$ filas y $n$ columnas, y su version escalonada tiene $l$ filas nulas, se define el **rango** de la matriz al número que resulta de restar el número de filas nulas el número total de filas de la matriz:
> $$
> \text{rango}(A) = m - l
> $$

> **Definición 1.22**
>
> Se dice que una matriz tiene **rango máximo** cuando si rango es igual al minimo entre el número de filas y columnas.

> **Proposición 1.4.1**
>
> Toda matriz se puede llevar a su forma escalonada por un número finito de operaciones elementales por fila.

Hay 3 tipos de operaciones elementales fila que se pueden realizar sobre matrices:

1. Intercambio de filas: 
   $$
   F_i \lrarr F_j
   $$

2. Multiplicar una fila por un escalar no nulo:
   $$
   F_i \rarr \alpha F_i
   $$

3. Sumar a una fila un multiplo de otra:
   $$
   F_i \rarr F_i + \alpha F_j
   $$

> **Definición 1.24**
>
> Una matriz $A$ es **equivalente por filas** a una matriz $B$ si $B$ es obtenida de $A$ por una secuencia de operaciones elementales por fila.

Esto quiere decir que las matrices equivalentes por filas tienen el mismo rango y si son cuadradas tienen el mismo determinante.

> **Proposición 1.4.2**
>
> Sea $A\vec x = \vec b$ la representación matricial de un sistema de ecuaciones lineales con $n$ incognitas, entonces:
>
> - El sistema es incompatible si el rango de la matriz $A$ es mayor del rango de la matriz ampliada.
> - El sistema es compatible determinado si los rangos coinciden.
> - El sistema es compatible indeterminado si el rango de la matriz $A$ es menor que el rango de la matriz ampliada.

> **Proposición 1.4.3**
>
> Si dos matrices son equivalentes por filas, entonces el sistema de ecuaciones que representan tiene las mismas soluciones.

## Soluciones de Sistemas Homogeneos

> **Definición 1.25**
>
> Diremos que un sistema de ecuaciones lineales es homogéneo cuando escrito en forma matricial:
> $$
> M\vec x = \vec 0
> $$

Estos sistemas siempre admiten como minimo una solución, la trivial:
$$
\vec x = \vec 0
$$
Aunque también se pueden encontrar otras soluciones, más especificamente $s = \text{cols}(M)-\text{rango(M)}$ tal que cualquier solución del mismo se puede expresar como:
$$
\vec x = \sum_{i=1}^s \alpha_i\vec u_i
$$
Donde $\vec u$ representa al vector de soluciones.

## Solución Numérica de un Sistema Lineal de Ecuaciones

Para resolver un sistema lineal de ecuaciones no homogéneo existen varios métodos según sea la estructura de la matriz del sistema y su rango.

El primer método que vamos a ver se llama la **regla de Cramer**:

Dado el siguiente sistema de ecuaciones:
$$
M\vec x = \vec b
$$
Donde $M\in \R^{n\times n}$ se arman $n$ matrices $M_i$ donde se reemplaza la columna en la posición $i$ de la matriz del sistema por el vector independiente $\vec b.$ Cada una de las incognitas se obtienen como:
$$
x_i = \frac{\det(M_i)}{\det(M)}
$$
Si el sistema es de $2\times 2$ o $3 \times 3$ es facil de implementarlo, pero cuando el número de incognitas crece es poco eficiente.

En un caso general debemos comenzar por determinar que tipo de sistema tenemos. Para realizar el analisis del sistema seguiremos los siguientes pasos:

1. Calculamos el rango de la matriz, y el de la ampliada. Si estos coinciden, entonces el sistema es compatible determinado.
2. Si la matriz es cuadrada, la solución sera única y puede obtenerse por eliminación gaussiana.
3. Si no es cuadrada, tendremos que vuscar una solución particular y una del sistema homogéneo. La suma sera la solución del sistema.

## Sistemas Cuya Matriz es Triangular

Muchos problemas tiene un sistema que se representa con una matriz triangular o que se puede reducir a una matriz triangular. Para esta estructura existen algoritmos eficientes que no requieren pasar por ningún paso previo.

Definamos el sistema a resolver:
$$
M \vec x = \vec b
$$
donde $M$ es una matriz triangular inferior de tamaño $n\times n$. En ests caso vamos a aplicar el método de **sustitución progresiva**. 

Si el sistema es determinado, ninguno de los elementos de la diagonal principal de $M$ es 0, por lo que podemos utilizar el siguiente procedimiento:
$$
\array{
x_1 = \frac {b_1}{a_{11}} & \dots & x_n = \frac{b_n - \sum_{i=1}^{n-1}a_{ni}x_i}{a_{nn}}
}
$$
Por otro lado, si el la matriz $M$ es triangular superior de tamaño $n\times n$ y el sistema es determinado, podemos resolver el sistema de la siguiente forma:
$$
\array{
x_n = \frac{b_n}{a_{nn}} & \dots & x_1 = \frac{b_1 - \sum_{i=2}^n a_{1i}x_i}{a_{11}}
}
$$
Este método se lo conoce como **sustitución regresiva**.

## Matrices Tridiagonales

Una de las estructuras más utilizadas so las matrices **tridiagonales**. Estas son aquellas matrices que tienen 3 tiras diagonales centradas en la diagonal principal.

> **Definición 1.26**
>
> Una matriz $A \in \R^{n\times n}$ se llama **diagonal dominante** si se verifica que:
> $$
> |a_{ii}| > \sum_{j=1,j\neq i}^n|a_{ij}|
> $$

De esta forma se puede afirmar que los elementos de la diagonal principal no son nulos.

El **algoritmo de Thomas** sirve para resolver sistemas de ecuaciones con matrices tridiagonales. Este tiene los siguientes pasos:

1. Eliminar la subdiagonal mediante eliminación gaussiana.
2. Aplicar el método de sustitución regresiva.

Si la matriz es diagonal dominante, entonces se puede garantizar que este algorimo va a poder resolver el sistema. En el caso contrario no se puede garantizar ningún resultado.

## Costo Computacional

Al momento de querer resolver un sistema de ecuaciones de manera numérica tenemos que tener en cuenta dos factores:

- La cantidad de memoria requerida para resolver el trabajo.
- La cantidad de operaciones de punto flotante necesarias.

Aunque parezca que solo con estos datos se puede estimar el tiempo de ejecución de un programa, la realidad es que depende de la implementacion del hardware, ya que diferentes operaciones pueden requerir más o menos FLOPs para ser realizadas.

