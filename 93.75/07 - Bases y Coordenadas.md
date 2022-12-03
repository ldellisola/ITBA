# Bases y Coordenadas

Todo espacio de dimensión finita $\mathbb V$ tiene una base. La base más utilizada es la denominada **canónica** $E$ en la cual los vectores que la componen $\hat e_j$ tienen una la siguiente estructura: todas sus componentes son nulas excepto por la componente en la posición $j$ que es 1.

Todos los vectores pueden ser representados mediante distintas bases. Por ejemplo, cualquier vector en $\R^3$ se puede escribir como:
$$
\vec u = \alpha_1 \hat e_1 + \alpha_2\hat e_2 +\alpha_3 \hat e_3
$$
También se puede representar de la siguiente forma:
$$
\vec u = (\alpha_1,\alpha_2,\alpha_3)'_E
$$
Donde el subindice indica en que base se representa la base en la que se va a representar. Es importante tener en cuenta que las coordenadas $(\alpha_i)$ dependen de la base que las exprese.

> **Definición 2.8**
>
> Llamamos **coordenadas** de un vector , respecto de una base $B$ a los escalares que son coeficientes de la combinación lineal que lo representa. El vector $\vec u$ se escribe como una combinación lineal de los elementos de la base y se los representa mediatne sus coordenadas en la base $B:$
> $$
> \vec u \equiv (\alpha_1;\alpha_2;\dots;\alpha_n)'_B
> $$

Para saber si un vector $\vec u$ pertenece o no a un subespacio $\mathbb V$ podemos partir desde una base de $\mathbb V$ llamada $B = \{\vec v_1,\dots,\vec v_n\}:$
$$
\vec u \in \mathbb V \iff \exists\alpha_j: \vec u = \sum_{j=1}^n \alpha_j \vec v_j
$$

 ## Base Canónica

Dado un espacio de dimensión finita $\mathbb V$ hay una base de uso generalizado llamada canónica que se simboliza con la letra $E:$
$$
E = \{\hat e_1,\dots,\hat e_n\}
$$
Los vectores $\hat e_j$ tienen sus componentes nulas salvo por la componente en la posición $j$ que es 1.