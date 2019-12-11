# Demostración

Sea $A$ un alfabeto, $E,F,G,H \in A^*$, sean $EF = GH$ y $long(E) \ge long(G)$, entonces:
$$
\exist H'\in A^*/E=GH'
$$

#### Demo

<u>Por inducción en $long(E)$</u>:

- **Caso Base**: $long(E)=0 \Rightarrow E = \lambda$
  $$
  0 = long(E) \ge long(G)\ge 0 \Rightarrow long(G)=0
  $$
  Entonces defino $H'=\lambda$ por que $E= GH' \Rightarrow \lambda = \lambda \lambda$

- **Hipótesis Inductiva**: Sea $A$ un alfabeto, $E,F,G,H \in A^*$, sean $EF = GH$
  $$
  n=long(E)\ge long(g) \Rightarrow \exist H'\in A^*/ E=GH'
  $$

- **Tesis Inductiva**: Sea $A$ un alfabeto, $E,F,G,H \in A^*$, sean $EF = GH$
  $$
  n+1=long(E)\ge long(G)
  $$

Hay 2 casos:

1. $G\neq \lambda/ G=g_0g_1\dots g_t$

   Defino $\tilde E, \tilde G/ \tilde E=e_1e_2\dots e_n~,~\tilde G=g_1g_2\dots g_t$

   Y como $E$ y $G$ cumplían con  $EF=GH \Rightarrow \tilde EF=\tilde G H,~~~\tilde E, \tilde G \in A^*$

   Entonces:
   $$
   long(\tilde E) = long(E)-1 \ge long(G)-1 = long(\tilde G)
   $$
   Entonces, por hipótesis inductiva:
   $$
   \exist H'\in A^*/\tilde E = \tilde G H' \Rightarrow E=e_0\tilde E=g_0\tilde G H'= GH'
   $$
   

- Caso 2) $G=\lambda$

  Tomo $H'=E \Rightarrow E=GH'$

