# Funciones Periódicas

En un principio consideraremos un subconjunto de $\mathbb V$ que contiene a las funciones periódicas:
$$
\mathbb{V} = \left\{ 
f : \R \rarr \C : \int_{-\infty}^{\infty} |f(t)|^2 dt < \infty
\right\}
$$

> **Definición 8.1**
>
> Las **funciones periódicas** son aquellas para las cuales se cumple:
> $$
> \exists T \gt 0 /\forall t: f(t+T) = f(t)
> $$



Donde $T$ se denomina el **periodo** de la función, donde ademas se define el **periodo fundamental** como el menor $T_0$ que comple con:
$$
f(t+T_0) = f(t)
$$
Las funciones periódicas pueden serlo por:

- Naturaleza: Si la función cumple con la definición.
- Extensión: Si puedo acotar a la función en un rango `[a,b]` y extender periódicamente con el periodo `|b-a|`.

> **Definición 8.2**
>
> La suma de funciones periódicas es periódica si y solo si se verifica que la razón de sus periodos es un numero racional:
>
> Sean $f,g$ funciones periódicas con sus periodos $T_f,T_g,$ decimos que $f+g$ es una función periodica si:
> $$
> \frac{T_f}{T_g} \in \Q
> $$

En general, si los periodos de sus múltiplos racionales de $\pi,$ entonces $T_j = \frac{p_j}{q_j}$ con $p_j\in Z,q_j \in \N$ se calcularia como:
$$
T = \frac{\text{mcm}(p_1,p_2)}{\text{mcd}(q_1,q_2)} \pi
$$

## Propiedades

Sea $f$ una función periodica con periodo $T$:

1. Para todo $t$ en su dominio y todo natural $n$ se cumple:
   $$
   f(t+ nT) = f(t)
   $$

2. Para todo escalar $c,$ $c\times f(t)$ es periódica con periodo $T.$

3. Para todo real $c\neq 0,$ $f(t+c)$ es periódica con periodo $T.$ 

4. Para todo real $c \neq 0,$ $f(c\times t)$ es periódica con periodo $\frac{T}{|c|}.$

5. Para todo real $d,c\neq 0,k\neq 0,$ $k\times f(c\times t + d)$ es periódica con periodo $\frac T {|c|}.$

Ademas, podemos utilizar las siguientes propiedades de la integral:

1. $\int_{-\frac T 2}^{\frac T 2} f(t) dt = \int_0^T f(t) dt$
2. $\forall b\in \R: \int_0^T f(t) dt = \int_b^{T+b} f(t) dt$
3. $\forall n \in \N: \int_0^{nT} f(t) dt = n \times \int_0^T f(t) dt$

## Espacio Vectorial de Funciones de Periodo $T$

Aunque sabemos que la suma de funciones periódicas no siempre es periódica, si limitamos nuestro dominio a funciones de periodo $T$ entonces obtenemos un espacio vectorial. Dentro de este espacio la suma es cerrada, por lo que la suma de funciones periódicas es periódica.

Podemos definir a la base de este espacio como:
$$
B = \left\{
1;
\cos(\frac{2n\pi}{T}t);
\sin(\frac{2n\pi}{T}t)
\right\}
$$
Y vamos a utilizar el producto interno:
$$
<f,g>= \int_0^T f(t) \times g(t)^* dt
$$
Donde $ ^*$ indica la operación conjugado.