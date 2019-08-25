# Lenguajes

### Alfabeto

Un conjunto $A \neq \empty$ se denomina alfabeto. Por ejemplo, $A=\N$ es un alfabeto, $A=\{a,b,c,d,\dots,z\}$ es un alfabeto.

### Expresión

Una expresión en A es una sucesión finita de elemento de $A$ o una cadena vaciá (notada como $\lambda$). Por ejemplo si $A=\N$,  $e_1=123$, $e_2=\lambda$ son expresiones en $A$.

### Longitud

Sea $E$ una expresión sobre $A$, si $E = \lambda$, se define a $long(E)=0$. Si $E \neq \lambda$, entonces $E=e_0e_1e_2\dots e_{n-1}~~,~e_j\in A$ y se define $long(E)=n$

### $A^*$ 

$A^*$ es el conjunto de todas las expresiones sobre $A$:
$$
A^*= \bigcup_{n \in \N} A^n, \text{ con } A^n=\{E \text{ sobre }A/long(E)=n\}
$$

#### Observación

$\# A^*=\chi_o$ si $A$ es finito y $\#A^* \ge \chi_o$

### Lenguaje

Sea $A$ un alfabeto, se llama lenguaje ($\mathscr L$) a cualquier subconjunto $L \neq \empty$ de $A^*$

### Igualdad de Expresiones

Sean $E,F \in A^*$:

1. Si $E = \lambda \Rightarrow E=F \Leftrightarrow F = \lambda$
2. Si $E\neq \lambda/ E=e_0e_1e_2\dots e_{n-1}~~~e_i \in A$, $F \neq \lambda/ F=f_0f_1f_2\dots f_{t}~~ f_j\in A$ $\Rightarrow F=E \Leftrightarrow f_i=e_i~~0\le i\le t~~ t = n-1$

### Concatenar

Sean $E,F$ expresiones:

1. $E = \lambda, F = \lambda \Rightarrow EF=\lambda$
2. $E = \lambda, F \neq \lambda \Rightarrow EF = F$
3. $E \neq \lambda, F\neq \lambda \Rightarrow EF = e_0e_1\dots e_{n-1}f_0f_1\dots f_t,~~~long(EF)= long(E)+ long(F)$

- Proposición:

  Sea $A$ un alfabeto, $E,F,G,H \in A^*$, sean $EF = GH$ y $long(E) \ge long(G)$, entonces:
  $$
  \exist H'\in A^*/E=GH'
  $$

  - Demostración por inducción en $long(E)$:

    - Caso Base) $long(E)=0 \Rightarrow E = \lambda$
      $$
      0 = long(E) \ge long(G)\ge 0 \Rightarrow long(G)=0
      $$
      Entonces defino $H'=\lambda$ por que $E= GH' \Rightarrow \lambda = \lambda \lambda$

    - Hipótesis Inductiva) Sea $A$ un alfabeto, $E,F,G,H \in A^*$, sean $EF = GH$
      $$
      n=long(E)\ge long(g) \Rightarrow \exist H'\in A^*/ E=GH'
      $$

    - Tesis Inductiva) Sea $A$ un alfabeto, $E,F,G,H \in A^*$, sean $EF = GH$
      $$
      n+1=long(E)\ge long(G)
      $$

    - Demostración:

      - Caso 1) $G\neq \lambda/ G=g_0g_1\dots g_t$

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

- Corolario

  Sea $A$ un alfabeto, $E,F,G,H \in A^*$, sean $EF = GH$ y $long(E) = long(G)$, entonces:
  $$
  E=G \and F=H
  $$

  - Demostración:

    Sea $EF=GH$ y $long(E)=long(G)$

    Entonces:
    $$
    long(E)\ge long(G)
    $$
    por la propiedad anterior, $\exist H'\in A^*/E=GH'$, entonces:
    $$
    long(E)=long(G)+long(H')
    $$
    Como $long(E)=long(G)$:
    $$
    long(H')=0 \Rightarrow H'=\lambda
    $$

    $$
    \therefore E=G \and \text{ como } EF=GH \Rightarrow F=H
    $$

    

    