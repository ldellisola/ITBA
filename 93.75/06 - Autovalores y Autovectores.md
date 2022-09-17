# Autovalores y Autovectores

> **Definición 6.1**
>
> Dada una matrix $A\in\mathbb{K}^{n\times n}, \vec x \in \mathbb K^n, \lambda \in \mathbb K$ tal que se verifica:
> $$
> \array{A \vec x = \lambda \vec x & \vec x \neq \vec 0}
> $$
> Se llama autovalor al escalar $\lambda$ y a $\vec x$ autovector asociado al autovalor.

Los autovalores se encuentran utilizando al polinomio característico:
$$
P_A(\lambda) = \det(A - \lambda \mathbb I_{n\times n}) = 0
$$
Los autovalores son las raíces de este polinomio. Para los autovectores el proceso es similar, pero hay que resolver el siguiente sistema de ecuaciones para cada autovector $\lambda:$
$$
(A - \lambda \mathbb I) \vec x = 0
$$

### Multiplicidad Algebraica y Geometrica

> **Definición 6.2**
>
> La multiplicidad algebraica ($m_a$) de un autovalor $\lambda$ de una matriz es la cantidad de veces que este es raíz del polinomio característico.

> **Definición 6.3**
>
> La multiplicidad geometrica $m_g$ de un autovalor de una matriz es la dimension del espacio nulo de $A - \lambda \mathbb I,$ es decir:
> $$
> m_g(\lambda) = \dim(Nul(A) - \lambda \mathbb I) = n - \text{rango}(A-\lambda \mathbb I)
> $$

En general se cumple que:
$$
1 \le m_g(\lambda) \le m_a(\lambda) \le n
$$

> **Definición 6.5**
>
> Decimos que una matriz es diagonalizable si existe una matriz $S \in \mathbb K^{n\times n}$ invertible tal que:
> $$
> S^{-1}AS = A
> $$

> **Definición 6.6**
>
> Una matriz $A$ se dice que es diagonalizable cuando la multiplicidad geométrica de cada autovalor es igual a la algebraica.

La generación de la matriz $S$ es simple, hay que tomar los autovectores de la matriz $A$ y ordenarlos de menor a mayor según su autovalor asociado.

> **Proposición 6.1.1**
>
> Si $A\in \mathbb K^{n\times n}$ es simetrica, entonces:
>
> 1. Todos los autovalores de una matriz simétrica son reales.
> 2. Si $\vec v_1,\vec v_2$ son autovectores asociados con autovalores distintos de una matriz simétrica, son ortogonales.

> **Proposición 6.1.2**
>
> Si $A \in \C^{n\times n}$ es una matriz Hermética ($A = (A')^*$):
>
> 1. Cada autovalor de $A$ es real
> 2. Existe una base autonormal de $\C^{n\times n}$ formada por autovectores de $A$ en la cual es diagonal.

> **Definición 6.6**
>
> Si una matriz tiene autovalores $\{\lambda_i\}^n_{i=1}$ a este conjunto se lo llama espectro de $A.$ Al mayor modulo de los autovalores se lo denomina radio espectral de la matriz.

### Propiedades Asociadas a los Autovalores y Autovectores de una Matriz

1. Si $(\lambda,\vec v)$ son un autopar de una matriz $A,$ entonces $(\lambda,\alpha\vec v), \alpha \neq 0$ también lo es.
2. Si $A$ es una matriz cuadrada $\tr(A) = \sum_{i=1}^n\lambda_i$ y $\det(A) = \prod_{i=1}^n\lambda_i.$
3. Si $\lambda$ es autovalor de $A,$ también lo es de su transpuesta.
4. Si $\lambda$ es un autovalor de $A,$ $\lambda^-1$ es el autovalor de su inversa.
5. Si $\lambda$ es el autovalor de $A,$ $-\lambda$ lo es de $A - \alpha \mathbb I.$
6. Si $\lambda$ es el autovalor de $A,$ $\lambda^k$ lo es de $A^k.$
7. Si $A$ es una matriz real, es diagonalizable si tiene $n$ autovalores distintos.
8. Si $A$ tiene todos sus autovalores con multiplicidad algebraica 1 es diagonalizable.
9. Si una matriz es triangular superior (o inferior) su determinante es el producto de los elementos de su diagonal y sus autovalores son los elementos de esta diagonal.

## Calculo de Autovalores

Solo existen métodos matemáticos para obtener los autovalores si el polinomio característico tiene menos de 5 raíces, para el resto de los casos se deben utilizar métodos numéricos.

> **Definición 6.7**
>
> Un autovalor se denomina dominante cuando cumple con:
>
> - Tiene multiplicidad algebraica 1.
> - Es el autovalor de mayor modulo de la matriz.
>
> Su autovector asociado se lo denomina autovector dominante.

### Método de las Potencias para el Calculo de los Autovalores

Este método nos permite calcular de manear iterativa el autovector y el autovalor dominante de una matriz $A.$

Supongamos que los autovectores de $A\in \R^{n\times n}$ son linealmente independientes, entonces forman una base de $\R^n,$ es decir que si $\vec u_0$ es un vector de $\R^n$ se puede escribir como:
$$
\vec u_0 = \sum_{i=1}^n \alpha_i \vec v_i
$$
Sea $\vec u^{(k)}$ el vector que sie obtiene de premultiplicar $k$ veces $\vec u_0$ por $A:$
$$
\vec u^{(k)} = A^k \vec u_0
$$
Teniendo en cuenta las propiedades 1 y 6 llego a:
$$
\array{
\vec u^{(k)} &=&A^k\left(\sum_{i=1}^n\alpha_i\vec v_i\right)\\
&=&\sum_{i=1}^n\alpha_iA^k\vec v_i\\
&=&\sum_{i=1}^n\alpha_i\lambda_i^k\vec v_i\\
}
$$
Dividiendo por $\lambda_1^k$ obtenemos:
$$
\frac{\vec u^{(k)}}{\lambda_1^k} = \alpha_1\vec v_1 +\sum_{i=2}^n\alpha_i\left(\frac {\lambda_i}{\lambda_1}\right)^k\vec v_i
$$
Cuando $k \rarr \inf$ la sumatoria tiende a cero y solo queda el primer termino.

Para obtener el autovalor entonces hay que utilizar el cociente de Rayleigh:
$$
\lambda \sim \frac{\vec u^{(k)'}A\vec u^{(k)}}{||\vec u^{(k)}||^2}
$$
Este método tiene algunos problemas:

1. Falla trabajando en precisión infinita si el vector semilla no tiene una componente en el autovector buscado.

2. El modulo de los $\vec u^{(k)}$ crece continuamente, dando lugar a overflow.

3. Requerimos cierto criterio de parada.

4. Si la convergencia es lenta, tenemos que tener algún proceso que lo acelere y como ultima medida un máximo de iteraciones.

Estos problemas pueden ser mitigados:

El problema $1$ se resuelve al ser implementado en la computadora, mientras que el punto dos puede ser evitado utilizando la siguiente formula:
$$
\vec u^{(k)} \larr \frac{\vec u^{(k)}}{||\vec u^{(k)}||_p}
$$
Donde $p$ puede ser cualquier valor, pero normalmente se usa $p=2.$

El criterio de parada puede implementarse con el error:
$$
\text{err} = ||A \vec u ^{(k)} - \lambda^k\vec u^{(k)}|| < ||A \vec u ^{(k)}|| \text{tol} \le ||A||  \text{tol}
$$
Este procedimiento da valores precisos siempre que se cumpla:
$$
\frac{|\lambda_2|}{|\lambda_1|} < 1
$$
Si no se cumple, la convergencia será lenta.

### Método de las Potencias Desplazado

Cuando $\frac{|\lambda_2|}{|\lambda_1|} \sim 1$ se puede recurrir a la propiedad 5 y obtener:
$$
\frac{|\lambda_2 - s|}{|\lambda_1 - s|} \ll 1
$$
Eligiendo adecuadamente el valor de $s$ podemos obtener los autovalores de la matriz $A- s \mathbb I.$ Ademas, cambiando el valor de $s$ puedo cambiar el autovalor dominante de la matriz $A -s\mathbb I$ y obtener el resto de los autovalores.

## Computo del Autovalor con Menor Modulo: Método de las Potencias Inverso

Supongamos que $A$ es inversible y que $\lambda$ es el autovalor de $A,$ por la propiedad $4$ sabemos que $\lambda^{-1}$ es el autovalor de $A^{-1}.$ Es más, si $\lambda$ es el autovalor de menor modulo, $\lambda^{-1}$ es el autovalor dominante de $A^{-1}:$
$$
\array{
\vec u^{(k)} = A^{-1}\vec u^{(k-1)} \\
A \vec u^{(k)} = \vec u^{(k-1)}
}
$$
Este método es ideal para matrices $A$ con $n > 100.$ 

## Calculo de Autovalores por el Proceso QR

El método QR también nos permite obtener los autovalores.

> **Definición 6.8**
>
> Dos matrices cuadradas $A,B$ se dicen similares si existe una matriz inversible tal que:
> $$
> B = S^{-1}AS
> $$

> **Proposición 6.4.1**
>
> Dos matrices similares tienen los mismos autovalores, pero no los mismos autovectores.
>
> Si $B \vec x = \lambda \vec x,B = S^{-1}AS:$
> $$
> \array{
> B \vec x = \lambda \vec x \\
> S^{-1} A S  = \lambda \vec x \\
> A(S\vec x) = \lambda (S \vec x)
> }
> $$

