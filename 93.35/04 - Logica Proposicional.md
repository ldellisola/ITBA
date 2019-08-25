# Lógica Proposicional

Sea $A$ el alfabeto de la lógica proposicional:
$$
A=Var \cup \{(,)\} \cup C
$$
Siendo $Var=\{P_n/n\in \N\}$ las variables y $C=\{\and,\or,\rightarrow,\neg\}$ los conectivos

Observación: $\#A=\chi_o$

### Formula

$F\in A^*$ es la formula, es decir, el lenguaje de la lógica proposicional. 

-  Propiedades:
  1. $Var \sub F$
  2. $\alpha \in F \Rightarrow \neg \alpha \in F$
  3. $\alpha,\beta \in F \Rightarrow (\alpha \and \beta),(\alpha \or \beta),(\alpha \rightarrow \beta) \in F$
  4. Si $\alpha \in A^*$, entonces $ \alpha \in F \Leftrightarrow$ se obtiene aplicando finitas veces 1),2) o 3)

### Cadena

Una cadena de fórmulas es una sucesión finita de $X_1,\dots,X_n$ de elementos de $A^*$ que verifica la siguiente propiedad:

Dado $1 \le i \le n$, $X_i\in Var$ o $\exist j<i/ 1\le j\le n, X_i=\neg X_j$ y $\exist j,k<i, e \le j,k\le n/X_i=(X_j * x_k)$

Con $* \in C$

Y a cada $X_i$ se lo llama eslabón

### Cadena de Formación

Decimos que $X_1,\dots,X_n$ es una cadena de formación $\alpha \in A^*$ si $X_n = \alpha$

- Teorema: $\alpha \in F \Leftrightarrow \exist X_1,\dots,X_n \text{ candea de formacion de } \alpha$ 

### Complejidad de $\alpha$

Sea $\alpha \in F$, la complejidad de $\alpha$ es la cantidad de conectivos de $\alpha$. Notación: $C(\alpha)$.

Ejemplo:
$$
\alpha=(P_1 \and \neg P_2) \rightarrow C(\alpha)=2
$$

### Subformula

Sea $\alpha \in F$, con $C(\alpha)=n$. $\beta$ es una subformula de $\alpha$ si cumple con:

1. Si $n=0 \Rightarrow \alpha = P_1 \in Var$:
   $$
   \beta \in S(\alpha) \Leftrightarrow \beta = \alpha
   $$

2. Si $n>0$:

   1. Si $\alpha=\neg \gamma, \gamma \in F$:
      $$
      \beta \in S(\alpha) \Leftrightarrow \beta = \alpha \or \beta = S(\gamma)
      $$

   2. Si $\alpha=(\gamma_1 * \gamma_2)$, con $* \in C, \gamma_1,\gamma_2 \in F$:
      $$
      \beta \in S(\alpha) \Leftrightarrow \beta = \alpha \or \beta = S(\gamma_1) \or \beta = S(\gamma_2)
      $$

Notación: $S(\alpha)$ es la subformula de $\alpha$ 