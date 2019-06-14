# Generadores

### Teorema

Sean $v_1,v_2,\dots,v_n,v_{n+1}\in V$, entonces:
$$
gen(v_1,v_2,\dots,v_n,v_{n+1}) = gen(v_1,v_2,\dots,v_n) \Leftrightarrow v_{n+1}~es~combinacion~lineal~de~v_1,v_2,\dots,v_n
$$
Es decir, el conjunto generador $G$ se puede achicar eliminando vectores que sean combinacion lineal de otros vectores del conjunto $G$.

## Espacios Generados Por Conjuntos de Vectores

Dados $v_1,v_2,\dots,v_n \in V$, el espacio generado por esos vectores (todas las [combinaciones lineales](17 - Combinacion Lineal.html)) es:
$$
gen(v_1,v_2,\dots,v_n) = \{ v\in V/~~v = \sum_{i=1}^n\alpha_iv_i,~~\alpha_i \in \mathbb K \}
$$

### Teorema

Dados $v_1,v_2,\dots,v_n \in V$, el conjunto $S = gen(v_1,v_2,\dots,v_n)$ es un subespacio de $V$.

- Demostración

  1. $0_V$ es Combinacion Lineal de $v_1,v_2,\dots,v_n \Rightarrow 0_V\in gen(v_1,v_2,\dots,v_n)$

  2. Sean $v,v' \in S \Rightarrow v+v' \in S$

     Como $v,v'$ son combinacion Lineal de $v_1,v_2,\dots,v_n$:
     $$
     v+v' =\sum_{i=1}^n \alpha_iv_i + \sum_{i=1}^n\beta_i v_i' = \sum_{i=1}^nv_i(\alpha_i+\beta_i) \Rightarrow v+v' \in S
     $$

  3. Sea $v\in S. \beta \in \mathbb K \Rightarrow \beta\ .\ v \in S$

  $$
  \beta\ .\ v = \beta \sum_{i=1}^n\alpha_iv_i = \sum_{i=1}^n\beta\alpha_iv_i \Rightarrow\beta\ .\ v \in S
  $$

## Conjunto Generado por un Subespacio

Se dice que el conjunto $G = \{v_1,v_2,\dots,v_n\} \sub V$ es un conjunto generado del subespacio $S$ si:
$$
S = gen(v_1,v_2,\dots,v_n)
$$
