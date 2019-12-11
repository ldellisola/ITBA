# Demostración

Sea $\alpha \in F \Rightarrow$
$$
P(\alpha)=0
$$

#### Demo

La demostracion se hace por <u>Inducción en la $c(\alpha)$</u> 

- **Caso Base**: $Cc(\alpha)=0$

  Si la $c(\alpha)= 0 \Rightarrow \alpha =p_i \in VAR$

  Entonces:
  $$
  P(\alpha) = P(p_i)=0
  $$

- **Hipotesis Inductiva**:

  Si $c(\alpha) \le n$:
  $$
  P(\alpha)=0
  $$

- **Tesis Inductiva**:

  Si $c(\alpha)=n+1$:
  $$
  P(\alpha)=0
  $$

Hay 2 casos:

1. $\alpha = p_i$:
   $$
   P(\alpha)=P(p_i) = 0
   $$

2. $\alpha = \neg \beta$,  $\beta \in F$ :
   
   Como:
   $$
C(\alpha) = n+1 = 1 + c(\beta)
   $$
   Y ademas sabemos que $c(\beta) \ge 0$, entonces podemos decir que:
   $$
   c(\beta)\le n
   $$
   Entonces, por **hipotesis inductiva**:
   $$
   P(\beta)=0
   $$
   Ahora voy a calcular el peso de $\alpha$:
   $$
   P(\alpha) = 0 + P(\beta) = 0
   $$
   
3. $\alpha = \beta_1 * \beta_2$, $\beta_1,\beta_2 \in F, *\in \{\land,\lor,\rightarrow\}$:

   Como:
   $$
   c(\alpha) = n+1 = c(\beta_1) + 1 + c(\beta_2)
   $$
   Y ademas sabemos que $c(\beta_1) \ge 0$ y $c(\beta_2)\ge 0$, entonces podemos decir:
   $$
   c(\beta_1) \le n\\
   c(\beta_2) \le n
   $$
   Entonces, por **hipotesis inductiva**:
   $$
   P(\beta_1)= P(\beta_2)=0
   $$
   Ahora voy a calcular el peso de $\alpha$:
   $$
   P(\alpha)= 1 + P(\beta_1) + 0 + P(\beta_2) + (-1) = 0
   $$


