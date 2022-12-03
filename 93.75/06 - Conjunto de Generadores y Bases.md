# Conjunto de Generadores y Bases

Los espacios vectoriales se pueden definir como una combinación lineal de cierto número de vectores. El conjunto de vectores que se utiliza se denominara **conjunto generador** del espacio y aquel que tenga el número minimo de vectores para generarlo se llama **base**.

## Combinación Lineal de Vectores

Dado un espacio vectorial $\mathbb V$ se puede pensar que cualquier vector de ese espacio se puede representar como una suma finita de otros elementos del espacio.

> **Definición 2.3**
>
> Dado un conjunto de vectores $\{\vec u_j\}_1^n$ se llamara **combinación lineal** de ellos a cualquier vector con la forma:
> $$
> \vec v = \sum_{j=1}^n \alpha_j \vec u_j
> $$
> Donde los escalares se llaman **coeficientes** de la combinación lineal.

> **Definición 2.4**
>
> Decimos que un conjunto es **linealmente dependiente** si al menos uno de sus elementos es el resultado de una combinación lineal del resto. Es decir, se cumple con la siguiente condicion:
> $$
> \vec 0 = \sum_{j=1}^n \alpha_j\vec u _j
> $$
> Donde $\alpha_j \neq 0.$
>
> Si no se cumple dicha condición y la única forma de que se cumpla es cuando $\forall j:\alpha_j = 0$ entonces podemos decir que el sistema es **linealmente independiente**.

## Conjunto Generador

> **Definición 2.5**
>
> Dado un conjunto de vectores $B = \{\vec u_j\}_1^n \subset \mathbb V$ definimos al **subespacio generado** por $B: \text{gen(B)}$ como el conjunto de todas las combinaciones lineales de los vectores de $B:$
> $$
> \text{gen}(B) = \left\{
> \vec v \in \mathbb V: \vec v = \sum_{j=1}^n\alpha_j\vec u_j/u_j\in B,\alpha_j\in \mathbb K
> \right\}
> $$

## Dimensión de un Espacio Vectorial

> **Definición 2.6**
>
> Se define como **rango de un conjunto** $B \subseteq\mathbb V$ al número de vectores linealmente independientes que contiene $B.$ Este número se denomina **dimensión del subespacio** generado por $B.$

La dimensión de un subespacio es la cantidad de vectores linealmente independientes que tiene un conjunto que lo genera. Es decir, es la cantidad minima que se requiere para que cualquier otro vector del mismo se pueda escribir como una combinación lineal.

