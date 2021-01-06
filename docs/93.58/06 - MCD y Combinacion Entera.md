# Máximo Común Divisor

Dado $a,b \in \mathbb{Z}-\{0\}$, el máximo común divisor (MCD) de $a$ y $b$ es un numero $d\in \mathbb{Z}$ que cumple:

1.  $d\gt 0$
2. Si $c|a$ y $c|b \Rightarrow c|d$
3. $d|a$ y $d|b$

Y la notación es:
$$
d = (a:b)
$$

# Combinación Entera

$c \in \mathbb{Z}$ una combinación entera de $a$ y $b$ si $\exists r,s \in \mathbb{Z} /~ a = r \cdot a + s \cdot b$

## Teorema

Son $a$ y $b \in \mathbb{Z}-\{0\} \Rightarrow$ Existe un máximo común divisor de $a$ y $b$. Además si $d$ es el MCD, entonces:
$$
\exists r,s \in \mathbb{Z} /~ a = r \cdot a + s \cdot b 
$$
Mas aun, $d$ es la menor combinación entera positiva de $a$ y $b$

## Algoritmo de Euclides

Sean $a,b \in \mathbb{Z}-\{0\}$

- Tomo $a_0=|a|$, $b_0 = |b|$

- Mientras $b_i \neq 0$

$$
\array{a_{i+1}=b_i&&&b_{i+1}=r_b(a_i)}
$$

- Elijo $d= a_i$

## Propiedades

- $(a+n:a) \leq n,~~~n\in \mathbb{N}$

