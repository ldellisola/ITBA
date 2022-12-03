# Operaciones Elementales de Filas de una Matriz

> **Definición 1.17**
>
> Se define que una matriz tiene **forma escalonada reducida** si es escalonada y los elementos de su diagonal son 1.

Las operaciones de intercambio de filas o las operaciones de eliminación gaussiana se pueden hacer mediante la premultiplicación de una matriz por 3 tipos de matrices elementales:

1. Multiplicar a la fila $i$ de la matriz $A$ por un escalar $\alpha \neq 0:$ La matriz se designa $E^i(\alpha)$ y se obtiene de la identidad multiplicando la fila $i$ por $\alpha.$
2. Sumar a la fila $i$ de la matriz $A,$ la fila $j$ de la matriz $A$ multiplicada por un escalar $(-\alpha).$ La matriz $E^{ij}(\alpha)$ se obtiene de la identidad reemplazando el valor cero del elemento $ij$ por $-\alpha.$
3. La matriz de permutación $P^{ij}/i\neq j$ se obtiene de la identidad intercambiando a fila $i$ por la fila $j.$

Todas estas matrices son regulares y su inversa es inmediata:
$$
\array{
(E^{ij})^{-1} = E^{ij} &
(E^i(\alpha))^{-1} = E^i(\alpha^{-1}) &
(E^{ij}(\alpha))^{-1} = E^{ij}(\alpha^{-1}) &
}
$$

Este metodo sirve especialmente bien para resolver el método de eliminación gaussiana simple, pero falla en los casos donde se deben permutar las filas la matriz. Para solucionar estos problemas se utiliza el método de pivoteo (que el viejo senil no explico en el apunte).