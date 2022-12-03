# Espacios Vectoriales con Producto Interno

> **Definición 4.1**
>
> Un producto interno o escalar definido sobre $\mathbb V$ es una aplicación entre el conjunto de todos los pares de vectores $(\vec u,\vec v)$ y $\mathbb {K},$ cuyo resultado es un escalar.
> $$
> \lang \cdot, \cdot\rang : \mathbb{V\times V} \rarr \mathbb K
> $$
> Esta operación, denotada por $\lang u,v\rang$ satisface las siguietnes propiedaes para todo $\vec u,\vec v,\vec w \in \mathbb {V}$ y todo escalar $\alpha\in \mathbb K:$
>
> 1. $\lang \vec u + \vec v,\vec w\rang = \lang \vec u,\vec w\rang + \lang \vec v,\vec w\rang$
> 2. $\lang \alpha\vec u,\vec v\rang = \alpha \lang \vec v,\vec v\rang$
> 3. $\lang \vec u,\vec v\rang = \lang \vec v,\vec u\rang^*$ donde $*$ denota el conjugado de un número complejo.
> 4. $\lang \vec u,\vec u\rang \in \R$ y $\lang \vec u,\vec u\rang \ge 0$

## Espacios Normados

> **Definición 4.2**
>
> Sea $\mathbb V$ un espacio vectorial sobre un cuerpo $\mathbb K,$ se define una norma sobre $\mathbb V$ a una función:
> $$
> ||\cdot||:\mathbb{V \rarr R_0^+}
> $$
> Que cumple con:
>
> 1. $$
>    \vec u \in \mathbb V: ||\vec u|| \ge 0 \implies ||\vec u|| = 0 \iff \vec u = \vec 0
>    $$
>
> 2. $$
>    \alpha \in \mathbb K, \vec u \in \mathbb V : ||\alpha\vec u|| = |\alpha|||\vec u||
>    $$
>
> 3. $$
>    \vec u,\vec v \in \mathbb V: ||\vec u + \vec v || \le ||\vec u|| + ||\vec v||
>    $$

> **Definición 4.3**
>
> Un **espacio normado** es un par $(\mathbb V, ||\cdot ||)$ donde $\mathbb V$ es un espacio vectorial y $||\cdot||$ es una norma sobre $\mathbb V.$ 

Por lo general se va a asumir que todos los espacios son normados, si no se indica lo contrario.

> **Definición 4.4**
>
> Dado un espacio vectorial $\mathbb V$ con el producto interno $\lang\cdot;\cdot\rang,$ este induce la norma en $\mathbb V$ según:
> $$
> ||\vec u||_2 = \sqrt{\lang\vec u;\vec u\rang}
> $$

No todas las normas se inducen del producto interno. Se puede definir la **p-norma** de la siguiente manera:
$$
||\vec u||_p = \left(
\sum_{i=1}^n |u_i|^p
\right)^{\frac 1 p}
$$
Donde $1\le p < \infty.$ En el caso particular de que se calcula la norma infinita, se define de la siguiente forma:
$$
||\vec u||_\infty = \max(u_i)
$$

>  **Definición 4.5**
>
> Dos normas $||\cdot||_\alpha,||\cdot||_\beta$ en el mismo espacio vectorial $\mathbb V$ se dicen equivalentes si existen $C_1,C_2 \in \R$ tal que:
> $$
> C_1 ||\vec u||_\alpha \le  ||\vec u||_\beta \le C_2 ||\vec u||_\alpha
> $$
> _TODO™_ El viejo senil cambio las variables en la mitad de la demo y no se que es lo que esta definiendo.

## Normas en Espacios Matriciales

La norma matricial es la extensión del concepto de norma vectorial a un espacio de matrices. Como las matrices se pueden pensar como transformaciones lineales $A:\mathbb K^n \rarr \mathbb K^m$ las respectivas normas de $\mathbb{K}^n$ y $\mathbb K^m$ inducen una norma en $\mathbb K^{m \times n}.$

> **Definición 4.6**
>
> Sean $||\cdot||_\alpha, ||\cdot||_\beta$ dos normas en $\mathbb K ^m, \mathbb K^m$ respectivamente. Se denomina **norma matricial** $||\cdot||$ de $\mathbb K^{m\times n}$ inducida por dichas normas vectoriales a:
> $$
> ||A|| = \max_{\vec u \neq \vec0} \frac{||A\vec u||_\alpha}{||\vec u||_\beta} = \max_{||\vec u||_\beta =1} ||A\vec u||_\alpha
> $$

> **Definición 4.7**
>
> Si las normas $\beta,\alpha$ son iguales a la norma $1$ de $\mathbb K^n,\mathbb K^m$ respectivamente:
> $$
> ||A||_1 = \max_{||\vec u||_1=1} ||A\vec u||_1 = \max_{1 \le i \le n} \left\{
> \sum_{j=1}^n|a_{ij|}
> \right\}
> $$

La norma 1 es simplemente la maxima suma absoluta de los valores de las columnas de $A.$

> **Definición 4.8**
>
> Si en los espacios vetoriales se utiliza la norma vectorial $\infty$ tendremos:
> $$
> ||A||_\infty = \max_{||\vec u||_\infty =1}||A\vec u||_\infty = \max_{1 \le j \le m}
> \left\{
> \sum_{i=1}^n = |a_{ij}|
> \right\}
> $$

La norma infinito es simplemente la suma absoluta de los valores de las filas de $A.$

> **Definición 4.9**
>
> La **norma de Frobenius** es una norma componente a componente con valor $p = 2:$
> $$
> ||A||_F = \left(
> \sum_{j=1}^m\sum_{i=1}^n |a{{ij}|^2}
> \right)^\frac 1 2
> = \sqrt{\text{tr}(A^\dagger A)}
> $$

> **Definición 4.10**
>
> Dado un vector no nulo de un espacio vectorial, se defune un **versor** como aquel vector que tiene norma unitaria y la misma direccion que el vector original. Se obtiene de la siguiente forma:
> $$
> \hat u = \frac{1}{||\vec u||}\vec u
> $$

## Distancia y Angulo en un Espacio Vectorial Normado

> **Definición 4.11**
>
> La **distancia** entre $\vec u$ y $\vec v \in \mathbb V$  se define como:
> $$
> \text{d}(\vec u,\vec v) = ||\vec u - \vec v||
> $$
> Normalmente se utiliza la $||\cdot||_2$ y tiene que verificar:
>
> 1. $\text{d}(\vec u,\vec v) \ge 0$
> 2. Se verifica la igualdad solo si $\vec u = \vec v$ ???
> 3. $\text{d}(\vec u,\vec v) = \text{d}(\vec v,\vec u)$
> 4. $\text{d}(\vec u,\vec w) \le \text d(\vec u,\vec v) + \text d (\vec v, \vec w)$

>  **Proposición 4.1.1**
>
> Dado dos vectores $\vec u,\vec v$ de un espacio vectorial normado se verifica que:
> $$
> |\lang\vec u;\vec v\rang| \le ||\vec u||||\vec v||
> $$

> **Definición 4.12**
>
> Sea $\mathbb V$ un espacio vectorial real con producto interno $\lang\cdot;\cdot\rang$ y la norma que el indice $||\cdot||$ se define el angulo entre los vectores $\vec u,\vec v$ como:
> $$
> \cos\theta_{\vec u\vec v}=\frac{\lang\vec u;\vec v\rang}{||\vec u||||\vec v||}
> $$

> **Definición 4.13**
>
> Se dice que dos vectores $\vec u,\vec v$ de un espacio vectorial real son **ortogonales** si se cumple con:
> $$
> \lang \vec u;\vec v \rang = 0
> $$
> Y se conta como:
> $$
> \vec u \bot\vec v
> $$

> **Definición 4.14**
>
> Se dice que dos vectores $\vec u,\vec v \in \mathbb V$ son **colineales** si existe un escalar $\alpha \in \mathbb K$ tal que:
> $$
> \vec u = \alpha \vec v
> $$
> Se lo notara con el siguiente simbolo:
> $$
> \vec u || \vec v
> $$

## Matriz Asociada a un Producto Interno

El producto interno en un espacio vectorial de dimensión finita esta asociado a su matriz.

> **Definición 4.15**
>
> Dado un espacio vectorial de dimensión finita, normado y dada una base $B = \{\vec u_1,\dots,\vec u_n\}$ se puede construir una matriz del producto interno en dicha base $A_B$ tal que:
> $$
> (A_B)_{ij} = \lang\vec u_i;\vec u_j\rang
> $$

Dada la matriz asociada con el producto interno y los vectores $\vec u,\vec v,$ este se evalua como:
$$
\lang\vec u;\vec v\rang = \vec u' A \vec v
$$
Y tenemos dos observaciones:

1. Si $A_B$ entonces $(A_B)^\dagger = A,$ con lo cual se tiene que la matriz debe ser cuadrada y se las denomina **autoadjuntas**.
2. Esta condición no alcanza para que sea una matriz de producto interno.

