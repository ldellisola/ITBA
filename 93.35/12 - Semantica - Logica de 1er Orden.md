# Semantica

## Definiciones

- **Interpretación**: Dado un lenguaje de $1^{er}$ orden, se define a al interpretación $I$ del lenguaje de la siguente forma:

  - Tiene un conjunto $U\neq \empty$ llamado <u>Universo</u>
  - $c \in \scr C \Rightarrow$ se asigna un valor del universo a $c$ y se lo llama $c_i$.
  - $f^k \in \scr F \Rightarrow$ se define una funcion $f_I^k:U^k\rightarrow U$
  - $P^k\in \scr P \Rightarrow$ se define una relacion $P^k_I \subset U^k$

- **Valuación**: Dado un lenguaje de $1^{er}$ orden $L$ y una interpretacio $I$ de $L$, se define una función $v:Var \rightarrow U_I$ y se la llama valuación. 

  Para interpretar los terminos se debe definir una funcion $\overline v : TERM \rightarrow U_I/ \overline v \text{ extiende a } v$, y ademas tiene que cumplir con:

  1. $\overline v(c_i)={c_i}_I$
  2. $f^k \in \scr F,~~t_1,\dots,t_k \in$ $TERM/~ \overline v (f_I^k(t_1,\dots,t_k)) = f_I^k(\overline v(t_1),\dots,\overline v(t_k))$

- **Valuación Modificada**: es una valuacion definida a partir de otra, por ejemplo:
  $$
  v_{x_i=a}:Var \rightarrow U_I/ v_{x_i=a}(y)=
  \left\{
  	\array{
  		a && y=x_i\\
  		v(y)&& y \neq x_i
  	}
  \right.
  $$

- **Función Valor de Verdad**: La función valor de verdad se define como $V:F \rightarrow \{0,1\}/$ cumple con:

  1. $V(P^k(t_1,\dots,t_k))=1 \Leftrightarrow (\overline v(t_1),\dots,\overline v(t_k)) \in P^k_I$
  2. $V(\lnot \beta) = 1 - V(\beta)$
  3. $V(\alpha \land \beta) = Min\{V(\alpha),V(\beta)\}$
  4. $V(\alpha \lor \beta) = Max\{V(\alpha),V(\beta)\}$
  5. $V(\alpha \rightarrow \beta) = Max\{1-V(\alpha),V(\beta)\}$
  6. $V_{I,v}(\forall x_i~\alpha) = 1 \Leftrightarrow V_{I,v_{x_i=a}}(\alpha)=1$ para todo elemento $a\in U_I$
  7. $V_{I,v}(\exist x_i~\alpha) = 1 \Leftrightarrow V_{I,v_{x_i=a}}(\alpha)=1$ para algun elemento $a\in U_I$

  Sea $\alpha \in F$, se lo nota como:
  $$
  \array{
  	V_{I,v}(\alpha)=1&&\text{es lo mismo que}&&I \models \alpha [v]\\
  	V_{I,v}(\alpha)=0&&\text{es lo mismo que}&&I \not{\models} \alpha [v]
  }
  $$
  

- **Lenguaje con Igualdad**: Decimos que $L$ es un lenguaje con igualdad si tiene un predicado que se interpreta como la igualdad ($=$).

- **Formula Satisfacible**: Decimos que $\alpha \in F$ es satisfacible si existe una interpretación $I$ y una valuaion $v$ tal que:
  $$
  V_{I,v}(\alpha)=1
  $$

- **Formula Valida**: Dada una interpretacion $I$, decimos que $\alpha \in F$ es valida en $I$ si:
  $$
  \array{V_{I,v}(\alpha)=1&&\forall~v \text{ valuación}}
  $$
  Se lo nota como $V_I(\alpha)=1$

- **Interpretación Modelo**: Si $\alpha$ es una formula valida en $I$, decimos que $I$ es un modelo para $\alpha$.

- **Formula Unversalmente Valida**: $\alpha$ es universamente valida si:
  $$
  \array{V_I(\alpha)=1&&\forall~I\text{ interpretación}}
  $$
  Se lo nota como $\models \alpha$

- **Equivalencia de Formulas**: Sea $\alpha,\beta \in F,$ $\alpha \equiv \beta \Leftrightarrow V_{I,v}(\alpha)=V_{I,v}(\beta) ~~~\forall v,I$

- **Conjunto Expresable**: Sea $L$ un lenguaje de $1^{er}$ orden, $I$ una interpretación de $L$ tal que $A\subseteq U_I$. Decimos que $A$ es expresable si para todo valor de $x \in U_I$ y cualquier formula $\alpha$:
  $$
  \array{
  V_I(\alpha(x))=1 \Leftrightarrow x \in A\\
  V_I(\alpha(x))=0 \Leftrightarrow x \not\in A
  }
  $$

- **Elemento Distinguible**: Sea $L$ un lenguaje de primer orden, $I$ una interpretación de $L$:
  $$
  a \in U_I \text{ es distinguible} \Leftrightarrow \{a\} \text{ es expresable}
  $$
  