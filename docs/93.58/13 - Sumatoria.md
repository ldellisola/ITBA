# Sumatoria

## Sumas Simples

### Notación

$$
\sum_{k=1}^na_k = \sum_{1\leq k \leq n} a_k = \mathop{a_k}_{[1 \leq k \leq n]} = a_1+a_2 + \dots + a_n
$$

### Propiedades

- Ley Distributiva:

$$
\sum_{k=1}^nc\ .\ a_k = c\ .\ \sum_{k=1}^na_k
$$

- Ley Asociativa:

$$
\sum_{k=1}^{n}a_k+b_k=\sum_{k=i}^{n}a_k + \sum_{k=i}^{n}b_k
$$

- Ley Conmutativa:

$$
\sum_{k=i}^{n}a_k = \sum_{k=i}^{n}a_{P(k)}
$$

Con $P:I\rightarrow I$ biyectiva,  $I={k}, ~~~i\leq k \leq n$

- Ley de Cambio de Índice:

$$
\sum_{k=i}^{n}a_k = \sum_{j=f^{-1}(i)}^{f^{-1}(n)} a_{f(j)}
$$

$k=f(j)$ con $f$ inyectiva.   $f:A\rightarrow B$,   $A=\{1,\dots,n\}$,   $B=\{f^{-1}(1),\dots,f^{-1}(n)\}$

### Sumatorias Famosas

#### Suma de Gauss

$$
\sum_{k=1}^{n} k  =\frac {n(n+1)} 2
$$

#### Suma Geométrica

$$
\sum_{k=1}^{n}x^k = \frac {1-x^{n+1}} {1-x}~~~~~~x\neq1
$$

## Sumatorias Múltiples

### Notación

$$
\sum_{i=1}^{n}\sum_{j=1}^{n}a_{ij} = \sum_{1\leq i,j \leq n}a_{ij}
$$

### Sumas con Índices Independientes

$$
\sum_{i=1}^{n}\sum_{j=1+i}^{m}a_{ij}=\sum_{1\leq i \lt j \leq m}a_{ij}~~~~ n \lt m
$$

































