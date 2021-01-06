# Demostración

$$
\text{Cualquier subconjunto de una seccion inicial es finito}\\
A\subseteq I_k \Rightarrow A \text{ es finito}
$$

#### Demo

Sea $k\in \mathbb{N}, A \subset I_k$, entonces tengo que $I_k=\{1,2,3,\dots,k\}$

Ademas tengo un conjunto $A$ finito, por lo que $A=\{i_1,i_2,\dots i_m\}$ o $A=\emptyset$. Expando en los dos casos:

1. $A = \emptyset$: En este caso el conjunto es finito por ser el vacio.

2. $A \neq \emptyset$:

   Defino $h:A \rightarrow I_k/h(i_j)=j$

   Verifico que sea <u>inyectiva</u>:
   $$
   h(i_j)=h(i_t)\\
   j = t\\
   i_j = i_t
   $$
   Por que todos los elementos son distinos, si comparten el mismo indice, son el mismo elemento.

   Verifico que sea <u>sobreyectiva</u>:

   ​	Sea $r \in I_m$, entonces $1 \leq r \leq m$
   $$
   \exists i_r/ h(i_r) = r
   $$
   $\therefore$ Como $h$ es biyectiva, podemos decir que $A \sim I_m$ y como $I_m$ es un conjunto finito, entonces A es un conjunto finito.

   



