# Números Enteros

$$
\Z = \N \cup\{0\} \cup (-\N)
$$

## Propiedades

- $a+b = b+a$
- $a+(b+c) = (a+b)+c$
- $\exist 0$ elemento neutro/ $a+0=a$
- $\forall a \in \Z$ tiene un elemento opuesto/ $a+(-a) = 0$
- $a\cdot b = b\cdot a$
- $a\cdot (b\cdot c) = (a \cdot b )\cdot c$
- $\exist 1$ elemento neutro/ $a\cdot 1 = a$
- $a\cdot (b+c) = a \cdot b + a \cdot c$
- Se define una relación global $\leq/$ $\left\{ \array{a \leq b~y~c\in \Z \Rightarrow a+c \leq b+c \\a \leq b~y~b\leq 0 \Rightarrow a \cdot c \leq b \cdot c} \right.$

Se dice que si un conjunto $A$ donde están definidas las operaciones $+$ y $\cdot$ , y cumple con las 8 propiedades, entonces $A$ es un **anillo**. Ejemplos de anillos son $\Z,\Q,\R,\C$. 



## Divisibilidad

Sea $a \in \Z$ es divisor de $b\in\Z$ si $\exist c \in \Z/~b = a \cdot c$

Notación: $a|b \rightarrow$ $a$ es divisor de $b$

### Propiedades

- $\pm1 |a ~~ \forall a\in \Z$
- $0|a \Leftrightarrow a = 0$
- $a|b \Leftrightarrow abs(a)~|~abs(b)$
- $a|b$ y $b\neq 0 \Rightarrow abs(b) \geq abs(a)$
- $a|b$ y $b|a$ $\Leftrightarrow abs(a)=abs(b)$
- $a|b$ y $a|(b+c)$ $\Rightarrow a|c$
- $a|b$ y $c\in \Z \Rightarrow a| (b\cdot c)$ 
- $a|b \Rightarrow a^n|b^n~~~n\in\N$

### Algoritmo de División en $\Z$

Si $a\in \Z$ y $d\in \Z-\{0\} \Rightarrow \exists q \in\Z, r\in \N_0$ tal que:
$$
a = q\cdot d + r
$$
Además $r$ y $q$ son únicos en esas condiciones. $q$ es el cociente y $r$ es el resto de la división de $a$ por $d$.

Notación:	
$$
q=q_d(a)~~~~~~~~~~~~~~~~~~~~~~~r = r_d(a)
$$

#### Observaciones

- Si $0\leq a\leq abs(d) \Rightarrow a = 0\cdot d + a \Rightarrow r =a$
- $d\neq 0$ y $d|a \Leftrightarrow r_d(a)=0$

## Congruencia

Dado $n \in \N$, decimos que $a$ y $b \in \Z$ son congruentes al modulo $d$ y lo notamos como:
$$
a\equiv b~~~Mod~d
$$

### Teorema

Sea $d \in \N \Rightarrow R \sub \Z \times \Z$ es definida por : $aRb \Leftrightarrow  a \equiv b~~Mod~d$ es de equivalencia.

####  Consecuencias

1. $a \equiv a$ $Mod(d)$
2. $a \equiv b~~Mod(d)\Rightarrow b\equiv a~~Mod(d)$
3. $a \equiv b~~Mod(d)$ y  $b \equiv c~~Mod(d) \Rightarrow a\equiv c~~Mod(d)$ 

#### Corolario

La relación de congruencia en modulo $d$ tiene tantas clases de equivalencia como restos posibles de dividir por $d$, por lo tanto, hay $d$ clases de equivalencia:
$$
[0],[1],\dots,[d-1]
$$

### Teorema

Sea $d \in \N$ y sean $a_1 \equiv b_1~~Mod(d)$ y $a_2 \equiv b_2~~Mod(d)$, entonces:

1. $a_1 + a_2 \equiv b_1 + b_2~~Mod(d)$
2. $a_1 \cdot a_2 \equiv b_1\cdot b_2~~Mod(d)$





























