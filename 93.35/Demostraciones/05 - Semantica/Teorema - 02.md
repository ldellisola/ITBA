# Demostración

Sean $\alpha\in F$, $v,w$ valuaciones tal que $\left.v\right|_{VAR} = \left.w\right|_{VAR}$, es decir, $v(p_j)=w(p_j)~~ \forall p_j \in VAR(\alpha)$:
$$
v(\alpha) = w(\alpha)
$$

#### Demo

Se va a demostrar por <u>inducción en $c(\alpha)$</u> 

- **Caso Base**: $c(\alpha)= 0$

  Entonces $\alpha =p_j \in VAR$.

  Sean $v,w$ valuaciones tal que $\left.v\right|_{VAR} = \left.w\right|_{VAR}$, entonces como $\alpha = p_j$:
  $$
  v(\alpha)= w(\alpha)
  $$

- **Hipotesis Inductiva**:

  Sea $\alpha \in F/c(\alpha) \le n$. Sean $v,w$ valuaciones tal que $\left.v\right|_{VAR} = \left.w\right|_{VAR}$:
  $$
  v(\alpha) = w(\alpha)
  $$

- **Tesis Inductiva**:

  Sea $\alpha \in F/c(\alpha) = n+1$. Sean $v,w$ valuaciones tal que $\left.v\right|_{VAR} = \left.w\right|_{VAR}$:
  $$
  v(\alpha) = w(\alpha)
  $$

Hay 2 casos:

1. $\alpha = \neg \beta$,  $\beta \in F$

   $c(\alpha) = 1 + c(\beta) = 1 + n \Rightarrow c(\beta)=n$, por lo que puedo usar la **Hipotesis Inductiva**:
   $$
   v(\beta)=w(\beta)
   $$
   Como $VAR(\alpha)=VAR(\beta)$:
   $$
   \left.v\right|_{VAR(\alpha)} = \left.v\right|_{VAR(\beta)} = \left.w\right|_{VAR(\beta)} = \left.w\right|_{VAR(\alpha)}
   $$
   Entonces:
   $$
   v(\alpha)= 1- v(\beta)=1-w(\beta)= w(\alpha)
   $$

2. $\alpha = (\beta_1 * \beta_2),$  $\beta_1,\beta_2 \in F, *\in \{\land,\lor,\rightarrow\}$

   $c(\alpha)=1 + c(\beta_1) + c(\beta_2) = n+1 \Rightarrow c(\beta_1)\le n \land c(\beta_2) \le n$, por lo que cumple con la **Hipotesis Inductiva**:
   $$
   v(\beta_1)=w(\beta_1)\\
   v(\beta_2)=w(\beta_2)
   $$
   Ademas, $VAR(\alpha)=VAR(\beta_1)\cup VAR(\beta_2)$

   Ahora veo que tengo 3 subcasos:

   1. $\alpha = (\beta_1 \land \beta_2)$
      $$
      v(\alpha) = min\{v(\beta_1),v(\beta_2)\} = min\{w(\beta_1),w(\beta_2)\}=w(\alpha)
      $$

   2. $\alpha = (\beta_1 \lor \beta_2)$
      $$
      v(\alpha) = max\{v(\beta_1),v(\beta_2)\} = max\{w(\beta_1),w(\beta_2)\}=w(\alpha)
      $$

   3. $\alpha = (\beta_1 \rightarrow \beta_2)$
      $$
      v(\alpha) = max\{1-v(\beta_1),v(\beta_2)\} = max\{1-w(\beta_1),w(\beta_2)\}=w(\alpha)
      $$

