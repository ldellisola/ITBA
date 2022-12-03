# Espacios Vectoriales

Con un cuerpo $\mathbb K$ se pueden generar otras estructuras denominadas **espacios vectoriales**.

> **Definición 2.1**
>
> Decimos que el conjunto $(\mathbb V ;\oplus;\otimes)$ es un espacio vectorial sobre el cuerpo $\mathbb K$ si cumpe con las siguientes propiedaes:
>
> 1. **El cuerpo esta cerrado por la suma**
>    $$
>    \vec u,\vec v \in \mathbb V \implies \vec u \oplus \vec v \in \mathbb V
>    $$
>
> 2. **Conmutatividad de la suma vectorial**
>    $$
>    \vec u,\vec v \in \mathbb V \implies \vec u \oplus \vec v = \vec v \oplus \vec u
>    $$
>
> 3. **Asociatividad de la suma vectorial**
>    $$
>    \vec u,\vec v, \vec w \in \mathbb V \implies \vec u \oplus(\vec v \oplus \vec w) = (\vec u \oplus \vec v) \oplus \vec w
>    $$
>
> 4. **Existe un elemento neutro en la suma vectorial**
>    $$
>    \vec u\in \mathbb V \implies \exists!\vec 0 \in \mathbb V/\vec u \oplus \vec 0 = \vec u
>    $$
>
> 5. **Existe un elemento inverso en la suma vectorial**
>    $$
>    \vec u\in \mathbb V \implies \exists!-\vec {u} \in \mathbb V/\vec u \oplus -\vec u = \vec 0
>    $$
>
> 6. **Distributividad del producto vectorial con la suma vectorial**
>    $$
>    \array{
>    \vec u,\vec v \in \mathbb V\ \ \alpha,\beta \in \mathbb K \implies
>    & \alpha \otimes (\vec u \oplus \vec v) = (\alpha \otimes \vec u) \oplus (\alpha \otimes \vec v)\\
>    &(\alpha + \beta) \oplus \vec u =(\alpha \otimes \vec u) \oplus (\beta \otimes \vec u) \\
>    &(\alpha \otimes \beta) \otimes \vec u = \alpha \otimes (\beta \otimes \vec u)
>    }
>    $$

## Espacios Funcionales

_TODO™_

## Subespacios Vectoriales

Algunos espacios vectoriales tienen dentro de su mismo un conjunto de vectores que complen las propiedades de los espacios vectoriales. Por esto se llaman subespacios.

> **Definición 2.2**
>
> Se dice que un conjunto de vectores $\mathbb W$ es un subespacio vectorial $\mathbb W \subseteq \mathbb V$ si cumple con:
>
> - El conjunto no es vacío.
> - El conjunto es cerrado bajo la suma con el mismo operador vectorial que $\mathbb V.$
> - El conjunto es cerrado bajo el producto escalar.

Podemos verificar de forma practica el primer ítem pidiendo que $\vec 0_{\mathbb V} \in \mathbb W.$



