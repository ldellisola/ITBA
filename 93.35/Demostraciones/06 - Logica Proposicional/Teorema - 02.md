# Demostración

Sea $\alpha \in F, \Gamma=\{\gamma_1,\dots,\gamma_n\}\sube Formulas$, entonces:
$$
\alpha \in C(\Gamma) \Leftrightarrow \beta-((\gamma_1 \and \dots \and \gamma_n) \rightarrow \alpha) \text{ es tautologia}
$$

#### Demo

$\Leftarrow)$

Sea $v$ una valuación tal que $v(\Gamma)=1$, queremos probar que $v(\alpha)=1$

$v(\gamma_i)=1,~~1\le j\le n$, entonces:
$$
\array{v(\gamma_1 \land \ldots \land \gamma_n) = min\{v(\gamma_1),\dots,v(\gamma_n)\}=1 && (1)}
$$
Ademas, por dato sabemos que:
$$
\array{v((\gamma_1\land\ldots\land\gamma_n)\rightarrow\alpha)=1&\forall v &&(2)}
$$
Entonces, gracias a $(1)$ y $(2)$:
$$
v((\gamma_1\land\ldots\land\gamma_n)\rightarrow\alpha)= max\{0,v(\alpha)\}= 1
$$

$$
\therefore v(\alpha) =1
$$

Entonces probamos que:
$$
\alpha \in C(\Gamma)
$$
$\Rightarrow )$

Sabemos por dato que $\alpha \in C(\Gamma)$, entonces queremos ver que $\sigma=((\gamma_1 \land \ldots \land \gamma_n)\rightarrow \alpha)$ es una tautología.

Tenemos 2 casos:

1. $v(\gamma_1 \land\ldots \land\gamma_n)=0$

   Entonces $v(\sigma)= max\{1-v(\gamma_1 \land \ldots\land \gamma_n),v(\alpha)\}=max\{1,v(\alpha)\}=1$

2. $v(\gamma_1 \land\ldots \land\gamma_n)=1$

   Entonces:
   $$
   min\{v(\gamma_1),\dots,v(\gamma_n)\}= 1 \Rightarrow v(\gamma_i)=1 ~~ 1 \le i \le n 
   $$
   Por esto puedo decir que:
   $$
   v(\Gamma)=1
   $$
   Entonces, por dato:
   $$
   v(\alpha)=1
   $$
   Calculo el valor de $\sigma$:
   $$
   v(\sigma)= max\{1-v(\gamma_1 \land \ldots\land \gamma_n),v(\alpha)\}=max\{0,v(\alpha)\}=1
   $$

$\therefore v(\sigma)=1~~\forall v \Rightarrow \sigma$ es una tautología