# Matrices Especiales

A continuación se detallan algunas matrices con propiedaes especiales que las hacen diferentes a los numeros y se explicaran algunas estructuras utiles para el resto de la materia.

## Matrices Nilpotentes, Involutivas e Idempotentes

> **Definición 1.6**
>
> Una matriz $A$ se llama **nilpotente** de orden $k$ si $\forall n \ge k:A \neq 0 \land A^n = 0.$

Por ejemplo, la siguiente matriz es nilpotente de orden 2:
$$
\array{
A = \left(\array{0&1\\0&0}\right) & A^2 = \left(\array{0&0\\0&0}\right)
}
$$

> **Definición 1.7**
>
> Una matriz cuadrada, de orden $n,$ se denomina **involutiva** si es igal a su inversa.
> $$
> A^2 = \mathbb{I}_n
> $$

Por ejemplo, la siguiente matriz es involutiva de orden 2:
$$
\array{
A = \left(\array{0&-i\\i&0}\right) &
A^2 = \left(\array{1&0\\0&1}\right)
}
$$

> **Definición 1.8**
>
> Una matriz cuadrada se llama **idempotente** cuando su cuadrado es ella misma:
> $$
> A^2 = A
> $$

Por ejemplo, la siguiente matriz es idempotente:
$$
\array{
A = \left(\array{3&-2\\3&-2}\right) &
A^2 = \left(\array{3&-2\\3&-2}\right)
}
$$

## Matrices con Estructura Particular

> **Definición 1.9**
>
> Una matriz cuadrada se llama **diagonal** cuando:
> $$
> \forall i \neq j: a_{ij} = 0
> $$

> **Definición 1.10**
>
> Una matriz cuadrada se denomina **a bandas** si todos los elementos fuera de una tira diagonal son nulos.

Este tipo de matrices también son conocidos como **dispersas**.

> **Definición 1.11**
>
> Una matriz cuadrada se denomina **triangular inferior** si:
> $$
> \forall i < j:a_{ij} = 0
> $$
> y **triangular superior** si:
> $$
> \forall i > j:a_{ij} = 0
> $$

Ademas, se puede probar que si una matriz triangular de orden $n$ tiene ceros en su diagonal, entonces es nilpotente de orden $k \le n.$

> **Definición 1.12**
>
> Una matriz cuadrada se dice **simétrica** si:
> $$
> \forall i,j: a_{ij} = a_{ji}
> $$
> y **asimétrica** si:
> $$
> \forall i,j: a_{ij} = -a_{ji}
> $$

> **Definición 1.13**
>
> Toda matriz cuadrada se puede escribir como la suma de tres matrices:
>
> - Una matriz simétrica de traza nula $(S).$
> - Una matriz asimétrica $(A).$
> - Una matriz diagonal cuya traza es la traza de la original $(D).$
>
> $$
> \array{
> &M = S + A + D&\\
> S = \frac 1 2 (M+M') & A = \frac 1 2 (M - M') &D = \text{diag}(M)
> }
> $$

> **Definición 1.14**
>
> Una matriz $M \in \R^{m\times n}$  se dice **ortogonal** si:
> $$
> M'M = \mathbb{I}_{n\times n}
> $$

Es decir que si una matriz es ortogonal y cuadrada, la transpuesta es su inversa.

> **Definición 1.15**
>
> Se denomina **matriz adjunta** de una matriz $M \in \C^{n\times n}$ a la que se obtiene de transponer y conjugarla:
> $$
> M^{\dagger} = (M')^*
> $$

> **Definición 1.16**
>
> Una matriz $M \in \C^{n\times n}$ se dice que es **unitaria** si verifica que:
> $$
> M^\dagger M = M M^\dagger = \mathbb{I}_{n\times n}
> $$





















