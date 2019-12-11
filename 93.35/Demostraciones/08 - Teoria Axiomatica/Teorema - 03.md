# Demostración

**Teorema de la Correctitud**: 

Sea $\alpha \in F$ 
$$
\Gamma \vdash \alpha  \Rightarrow \alpha \in C(\Gamma)
$$

#### Demo

Hay 2 casos dependiendo de $\Gamma$:

1. $\Gamma = \empty$

   Queremos ver que $\empty \vdash \alpha \Rightarrow \alpha \in C(\empty)$

   Por definición, podemos decir que:
   $$
   \array{\empty \vdash \alpha \Rightarrow \alpha \text{ es demostrable} && (1)}
   $$
   Por otro lado, sabemos que $C(\empty)= \text{ tautologias}$, entonces si $\alpha \in C(\empty) \Rightarrow \alpha \text{ es una tautologia}$ $(2)$

   Gracias a este [teorema](Teorema - 01.html), sabemos que $(1)\Rightarrow (2)$ es verdadero, entonces:
   $$
   \empty \vdash \alpha \Rightarrow \alpha \in C(\empty)
   $$

2. $\Gamma \not = \empty$

   Por dato $\exist \alpha_1,\dots,\alpha_n$ prueba de $\alpha$ a partir de $\Gamma$

   Entonces tengo 3 casos:

   1. $\alpha $ es un axioma:

      En este caso $v(\alpha)=1$

   2. $\alpha \in \Gamma$

      Si $v(\Gamma)=1 \Rightarrow v(\alpha )=1$

   3. $\alpha$ se obtiene por $MP$ de anteriores

      Entonces :
      $$
      \exist a_j,~~ j\le n / a_j =(a_i\rightarrow\alpha)
      $$
      Supongamos que $\exist v$ valuación $/ v(\alpha)=0$

      Ahora $v(\alpha_k)=1, ~~k\le n$ pues forman parte de la prueba, según vimos en el [teorema de la deducción](Teorema - 02.html) 

      Vamos a calcular el valor de $v(\alpha_j)$:
      $$
      v(\alpha_j)=1 \\
      \Rightarrow max\{1-v(\alpha_i),v(\alpha)\}=1\\
      \Rightarrow max\{1-1,0\}= 1
      $$
      **ABS!** entonces $v(\alpha)=1$

$\therefore v(\alpha)=1 \Rightarrow \alpha \in C(\Gamma)$

