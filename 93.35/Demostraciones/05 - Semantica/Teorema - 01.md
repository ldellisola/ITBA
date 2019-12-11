# Demostración

Sea $f:Var \rightarrow \{0,1\}/ f$ es una función:
$$
\text{$ \exist !v$ valuación que extiende a $f$.}
$$
Es decir, sean $v,w$ valuaciones tales que:
$$
\left.v\right|_{VAR} = \left.w\right|_{VAR} \Rightarrow v = w
$$

#### Demo

Vamos a probarlo por <u>inducción en $m$</u>. El truco es definir una unión infinitra de conjuntos de formular, y luego definir la valuación en funcióna  las anteriores.

Defino $F_n=\{\alpha \in F/c(\alpha)\le n\}$

Donde, por ejemplo, $F_0=VAR, F_1=VAR\cup \{\alpha \in F/c(\alpha)\le 1\}\dots$

Vemos tambien que $F_0 \subseteq F_1 \subseteq \dots \subseteq F_n$ y que $F = \bigcup_{i=0}^{\infty}F_i$

Definimos el predicado $P(n)$:
$$
P(n)=\text{ Existe una unica función } v_n:F_n\rightarrow\{0,1\}/v_n \text{ extienda a $F_n$ y que $v_n$ cumpla con la definicion de valiación}
$$

- **Caso Base**: $n=0$

  $v_0 : F_0\rightarrow \{0,1\}$, es decir puedo definir a $v_0$ como: $v_0:VAR\rightarrow \{0,1\}$, por lo que defino $v_0=f$.

  Entonces puedo decir que $v_0$ exitende a $f$ de forma unica y cumple con la definición de valuación, por que no hay conectivos.

- **Hipotesis Inductiva**: $P(k),~~k\le n$

- **Tesis Inductiva**: $P(n+1)$

Defino $v_{n+1}:F_{n+1}\rightarrow\{0,1\}$. Tengo 2 casos:

1. $c(\alpha) \le n, \alpha \in F_{n+1}$

   Defino $v_{n+1}(\alpha)=v_n(\alpha)$

2. $c(\alpha)=n+1, \alpha \in F_{n+1}$

   Tengo 3 subcasos:

   1. $\alpha = \neg \beta$

      $c(\alpha)= 1 + c(\beta) = 1 + n \Rightarrow c(\beta)=n$, por lo que puedo usar la **Hipotesis Inductiva**.

      Entonces, existe una unica $v_n(\beta)$ valuación que extienda a $f$.

      Defino $v_{n+1}(\alpha)=1-v_{n+1}(\beta) = 1-v_n(\beta)$

   2. $\alpha = (\beta_1 * \beta_2),$   $\beta_1,\beta_2 \in F, *\in \{\land,\lor,\rightarrow\} $ 

      $c(\alpha)=1+c(\beta_1) + c(\beta_2) = 1 + n \Rightarrow c(\beta_1)\le n \land c(\beta_2)\le n$, por lo que puedo usar la **Hipotesis Inductiva**.

      Entonces se que:
      $$
      \exist \text{ una univa valuación $v_n(\beta_1)$ que extiende a $f$}\\
      \exist \text{ una univa valuación $v_n(\beta_2)$ que extiende a $f$}
      $$
      Ahora tenemos 3 subcasos:

      1. $\alpha = (\beta_1 \land \beta_2),$  $\beta_1,\beta_2 \in F$

         Defino $v_{n+1}(\alpha) = min\{v_{n+1}(\beta_1),v_{n+1}(\beta_2)\}=min\{v_n(\beta_1),v_n(\beta_2)\}$

      2. $\alpha = (\beta_1 \lor \beta_2),$  $\beta_1,\beta_2 \in F$

         Defino $v_{n+1}(\alpha) = max\{v_{n+1}(\beta_1),v_{n+1}(\beta_2)\}=max\{v_n(\beta_1),v_n(\beta_2)\}$

      3. $\alpha = (\beta_1 \rightarrow \beta_2),$  $\beta_1,\beta_2 \in F$

         Defino $v_{n+1}(\alpha) = max\{1-v_{n+1}(\beta_1),v_{n+1}(\beta_2)\}=max\{1-v_n(\beta_1),v_n(\beta_2)\}$

$\therefore$ defino $v:F\rightarrow\{0,1\}/v(\alpha)=v_n(\alpha)$, siendo $c(\alpha)=n$

