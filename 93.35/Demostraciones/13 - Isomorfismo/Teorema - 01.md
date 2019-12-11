# Demostración

Sea $L$ un lenguaje de $1^{er}$ orden, $I_1 \simeq_h I_2, v:Var \rightarrow U_I$ y $\alpha \in F$:
$$
I_1 \models\alpha[v] \Leftrightarrow I_2 \models \alpha [h_ov]
$$

#### Demo

La demostración es por <u>inducción</u> en el tamaño de las formulas.

Usamos que el conjunto $\{\neg,\land,\exist\}$ es adecuado.

- **Caso Base**: $tam(\alpha)=0$

  Entonces:
  $$
  \alpha=p^k(t_1,\dots,t_k)~~~~ t_i \in TERM,~~~ p^k \in \scr P
  $$
  Entonces al calcular el valor de verdad:
  $$
  V_{I_1,v}(\alpha)=1 \Leftrightarrow (\overline v(t_1),\dots,\overline v(t_k))\in \mathscr {P}^k_{I_1}
  $$
  Como $h$ es un isomorfismo:
  $$
  (\overline v(t_1),\dots,\overline v(t_k))\in \mathscr {P}^k_{I_1} \Leftrightarrow (h_o\overline v(t_1),\dots,h_o\overline v(t_k)) \in \mathscr P_{I_2}^k
  $$
  Por el [lema anterior](Lema - 01.html):
  $$
  \Leftrightarrow (\overline{h_ov}(t_1),\dots,\overline{h_ov}(t_k)) \in \mathscr P^k_{I_2}\\
  \Leftrightarrow V_{I_2,h_ov}(p^k(t_1,\dots,t_k))=1
  $$

- **Hipótesis Inductiva**:

  Sea $\alpha \in F/tam(\alpha)\le n$:
  $$
  I_1 \models \alpha[v] \Leftrightarrow I_2 \models \alpha[h_ov]
  $$

- **Tesis Inductiva**:

  Sea $\alpha \in F/tam(\alpha)= n+1$:
  $$
  I_1 \models \alpha[v] \Leftrightarrow I_2 \models \alpha[h_ov]
  $$

Sea $\alpha \in F/ ~tam(\alpha)=n+1$, entonces tenemos 3 casos:

1. $\alpha = \neg \beta$  $\beta \in F$

   Como $tam(\alpha)= 1 + n = 1 + tam(\beta)$:
   $$
   tam(\beta)=n
   $$
   Entonces puedo usar la **Hipótesis Inductiva**:
   $$
   I_1 \models \alpha[v] \\
   \Leftrightarrow V_{I_1,v}(\alpha)=1\\
   \Leftrightarrow V_{I_1,v}(\beta)=0\\
   \Leftrightarrow \text{por HI  }~~ V_{I_2,v}(\beta)=0\\
   \Leftrightarrow V_{I_2,v}(\alpha)=1\\
   \Leftrightarrow I_2 \models \alpha[h_ov]
   $$

2. $\alpha = \beta_1 \land \beta_2,~~~\beta_1,\beta_2 \in F$

   Como $tam(\alpha)=n+1 = 1 + tam(\beta_1) + tam(\beta_2)$:
   $$
   \array{ tam(\beta_1) \le n && tam(\beta_2)\le n}
   $$
   Entonces puedo usar la **Hipótesis Inductiva**:
   $$
   I_1 \models (\beta_1 \land \beta_2)[v]\\
   \Leftrightarrow V_{I_1,v}(\beta_1 \land\beta_2)=1\\
   \Leftrightarrow min\{V_{I_1,v}(\beta_1),V_{I_1mv}(\beta_2)\}\\
   \Leftrightarrow \array{ V_{I_1,v}(\beta_1)=1 &\text{y} &V_{I_1,v}(\beta_2)=1}\\
   \Leftrightarrow \text{por HI }
   \array{V_{I_2,v}(\beta_1)=1&\text{y}&V_{I_2,v}(\beta_2)}=1\\
   \Leftrightarrow min\{V_{I_2,v}(\beta_1),V_{I_2,v}(\beta_2)\}=1\\
   \Leftrightarrow V_{I_2,v}(\beta_1 \land \beta_2)=1\\
   \Leftrightarrow I_2 \models (\beta_1 \land \beta_2)[v]
   $$

3. $\alpha = \exist x ~~\beta~~~~~\beta \in F$

   Como $tam(\alpha)=1+n = 1 +tam(\beta)$:
   $$
   tam(\beta)=n
   $$
   Entonces puedo usar la **Hipótesis Inductiva**:
   $$
   I_1 \models \exist x ~~\beta[v]\\
   \Leftrightarrow V_{I_1,v}(\exist x~~\beta)=1\\
   \Leftrightarrow \exist \alpha \in U_1/ V_{I_1,v_{x=\alpha}}(\beta)=1\\
   $$
   Si tomo $b = h(\alpha)\in U_2$:

   $$
   \Leftrightarrow \exist b \in U_2/V_{I_1,(h_ov)_{x=b}}(\beta)=1\\
   $$
   Como $h$ es biyectiva: $\alpha = h^{-1}(b)$:
   $$
   \Leftrightarrow V_{I_2,h_ov}(\exist x~~\beta)=1\\
   \Leftrightarrow I_2 \models \exist x~~\beta[h_ov]
   $$

$\therefore I_2\models \alpha [h_ov]$