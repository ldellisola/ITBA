# Sintaxis

Sea $A$ el alfabeto de la lógica proposicional:
$$
A=Var \cup \{(,)\} \cup C
$$
Siendo $Var=\{P_n/n\in \N\}$ las variables y $C=\{\and,\or,\rightarrow,\neg\}$ los conectivos

Observación: $\#A=\chi_o$

## Formula

$F\in A^*$ es la formula, es decir, el lenguaje de la lógica proposicional. 

-  Propiedades:
  1. $Var \sub F$
  2. $\alpha \in F \Rightarrow \neg \alpha \in F$
  3. $\alpha,\beta \in F \Rightarrow (\alpha \and \beta),(\alpha \or \beta),(\alpha \rightarrow \beta) \in F$
  4. Si $\alpha \in A^*$, entonces $ \alpha \in F \Leftrightarrow$ se obtiene aplicando finitas veces 1),2) o 3)

## Cadena

Una cadena de fórmulas es una sucesión finita de $X_1,\dots,X_n$ de elementos de $A^*$ que verifica la siguiente propiedad:

Dado $1 \le i \le n$, $X_i\in Var$ o $\exist j<i/ 1\le j\le n, X_i=\neg X_j$ y $\exist j,k<i, e \le j,k\le n/X_i=(X_j * x_k)$

Con $* \in C$

Y a cada $X_i$ se lo llama eslabón

### Cadena de Formación

Decimos que $X_1,\dots,X_n$ es una cadena de formación $\alpha \in A^*$ si $X_n = \alpha$

- **Teorema**: $\alpha \in F \Leftrightarrow \exist X_1,\dots,X_n \text{ candea de formacion de } \alpha$ 

   [Demostración](Demostraciones\04 - Sintaxis\Teorema - 01.html)

### Cadena de Formación Minimal

Una cadena de formación es minimal si no tiene mas eslabones de los necesarios para completar a la cadena.

### Subcadena de Formación

Dada $X_1,\dots,X_n$ una cadena de formación, se define a $X_{i_1},\dots,X_{i_k}$ como una subcadena de formación de la cadena anterior si cumple con:

- $X_{i_k} = X_n$
- $1\leq i_1 \le \dots \le i_k=n$
- Es una cadena de formación.

## Operaciones

### Complejidad 

Sea $\alpha \in F$, la complejidad de $\alpha$ es la cantidad de conectivos de $\alpha$. Notación: $C(\alpha)$.

Ejemplo:
$$
\alpha=(P_1 \and \neg P_2) \rightarrow C(\alpha)=3
$$

### Complejidad Binaria

Sea $\alpha \in F$, la complejidad binaria de $\alpha$ es la cantidad de conectivos binarios ($\rightarrow,\or,\and$) de $\alpha$. Notación $Cb(\alpha)$.

### Peso

El peso de una expresión es la suma de los paréntesis, siendo el inicio de un paréntesis equivalente a $+1$ y el cierre de un paréntesis a $-1$. Notación $P(\alpha)$

Ejemplo:
$$
\alpha=(p_1 \or p_2 \Rightarrow P(\alpha)=1
$$

- **Teorema**: Si $\alpha$ es una formula, entonces el peso es $0$

   [Demostración](Demostraciones\04 - Sintaxis\Teorema - 02.html) 

- **Teorema**: Si $\alpha$ es una formula y si  tiene un conectivo binario, llamo $E$ a la expresión a la izquierda del conectivo y el peso de $E$ es positivo ($P(E)>0$).

   [Demostración](Demostraciones\04 - Sintaxis\Teorema - 03.html) 

- **Corolario: <u>Unicidad de Escritura</u>**: Si $\alpha \in F \Rightarrow $
   $$
   \exist !\beta \in F/\alpha =\neg\beta \or \exist !\beta_1,\beta_2\in F, \exist ! * \in \{\rightarrow,\or,\and\}/ \alpha=(\beta_1 * \beta_2)
   $$
    [Demostración](Demostraciones\04 - Sintaxis\Corolario - 01.html) 

## Subformula

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