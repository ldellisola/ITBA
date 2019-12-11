# Demostración

**Teorema de la Deduccion**: 

Sean $\alpha,\beta \in F, \Gamma \sube F,$ entonces:
$$
(\alpha \rightarrow \beta) \in C(\alpha) \Leftrightarrow \beta \in C(\Gamma \cup \{\alpha\})
$$

#### Demo

$\Rightarrow )$

Sea $v$ una valuación tal que $v(\Gamma \cup \{\alpha\})=1 \Rightarrow v(\Gamma)=v(\alpha)=1$

Como $(\alpha \rightarrow \beta) \in C(\Gamma)$:
$$
v(\alpha \rightarrow \beta)=1\\
\Rightarrow max\{1-v(\alpha),v(\beta)\}=1\\
\Rightarrow max\{0,v(\beta)\}=1\\
v(\beta)=1
$$
Entonces probe que:
$$
\beta \in C(\Gamma \cup \{\alpha\})
$$
$\Leftarrow )$

Sea $v$ una valuación tal que $v(\Gamma)=1$

Tengo dos casos:

- $v(\alpha)=0$

  Entonces:
  $$
  v(\alpha \rightarrow \beta) = \max\{1,v(\beta)\} = 1
  $$

- $v(\alpha)=1$

  Entonces:
  $$
  v(\Gamma \cup \{\alpha\})=1
  $$
  Como por dato $\beta \in C(\Gamma \cup \{\alpha\})$, entonces $v(\beta)=1$:
  $$
  v(\alpha \rightarrow \beta)= max\{0,v(\beta)\}=v(\beta)=1
  $$

Entonces se cumple que:
$$
(\alpha \rightarrow \beta) \in C(\Gamma)
$$
