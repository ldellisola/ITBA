# Demostración

$$
\Gamma \text{ es consistente} \Leftrightarrow \Gamma \text{ es satisfacible}
$$

#### Demo

$\Rightarrow )$

La demostración se hace por el [Lema de Lindenbaum](Lema - 01.html) e inducción en la complejidad de  $\alpha$

Por dato, y utilzando el Lema de Lindenbaum:
$$
\Gamma \text{ es consistente }\Rightarrow  \exist \Gamma' \text{MC }/\Gamma \subseteq \Gamma'
$$
Vamos a ver que $\Gamma'$ es satisfacible:

Como  $\Gamma'$ es $MC$, entonces $\alpha\in \Gamma' ~~\veebar~~\neg \alpha \in \Gamma' $  $\forall \alpha \in F$

En particular, pdemos decir que:
$$
p_j \in \Gamma' ~~\veebar~~ \neg p_j \in \Gamma'~~~~\forall p_j\in VAR
$$
Defino $f$:
$$
f:VAR \rightarrow\{0,1\}/f(p_j)=
\left\{
	\array{
		1 && p_j \in \Gamma'\\
		0 && p_j \not\in \Gamma'
	}
\right.
$$
Sea $v_f$ la valuación que extiende a $f$, queremos ver que $v_f(\Gamma)=1$

Vamos a probar por inducción en $c(\alpha)$ que $v_f(\alpha)=1 \Leftrightarrow \alpha \in \Gamma'$

- **Caso Base**: $c(\alpha)=1$

  Entonces $\alpha = p_j$, por lo que si $\alpha \in \Gamma'$:
  $$
  v_f(\alpha)=v_f(p_j)=1
  $$

- **Hipotesis Inductiva**: $\alpha \in F/ c(\alpha)\le n$
  $$
  v_f(\alpha)=1\Leftrightarrow \alpha\in \Gamma'
  $$

- **Tesis Inductiva**: $\alpha \in F/ c(\alpha)=n+1$
  $$
  v_f(\alpha)=1\Leftrightarrow \alpha\in \Gamma'
  $$

Sea $\alpha \in F/ c(\alpha)=n+1$, tenemos 2 casos:

1. $\alpha= \neg \beta$  $\beta \in F$

   Como $c(\alpha)=n+1 = 1 + c(\beta)$:
   $$
   c(\beta) = n
   $$
   Entonces por **Hipotesis Inductiva**:
   $$
   v_f(\beta)=1\Leftrightarrow \beta\in \Gamma'
   $$
   Por otro lado:
   $$
   v_f(\alpha)=1 \Leftrightarrow v_f(\beta)=0
   $$
   Entonces:
   $$
   \beta \not\in \Gamma'
   $$
   Y como $\Gamma'$ es $MC$, podemos decir que:
   $$
   \neg \beta \in \Gamma'
   $$
   Entonces:
   $$
   \neg \beta \in \Gamma' \Leftrightarrow \alpha \in \Gamma'
   $$

2. $\alpha = (\beta_1 \rightarrow \beta_2)$   $\beta_1\,\beta_2 \in F$

   Por dato $c(\alpha)= n+1= c(\beta_1) + c(\beta_2) +1 $, entonces:
   $$
   \array{ 
   	c(\beta_1) \le n &&c(\beta_2)\le n
   }
   $$
   Entonces, puedo usar la **Hipotesis Inductiva**.

   Por otro lado:
   $$
   v_f(\alpha) = 1 \Leftrightarrow v_f(\beta_1)=0 \lor v_f(\beta_2)=1
   $$
   Por **Hipotesis Inductiva**, puedo decir que como $\beta_1 \not \in \Gamma'$ y $\Gamma'$ es $MC$:
   $$
   \neg \beta_1 \in \Gamma' \Rightarrow \Gamma' \vdash (\beta_1 \rightarrow \beta_2)
   $$
   Por **Hipotesis Inductiva**, puedo decir que como $\beta_2 \in \Gamma'$ y $\Gamma'$ es $MC$:
   $$
   \neg \beta_2 \not \in \Gamma' \Rightarrow \Gamma' \vdash \beta_2 \Rightarrow \Gamma' \vdash (\beta_2 \rightarrow (\beta_1 \rightarrow \beta_2))
   $$
   Entonces, si hacemos modus ponenes, obtenemos:
   $$
   \Gamma' \vdash (\beta_1 \rightarrow \beta_2)
   $$
   Por ultimo anaizo el caso donde $v_f(\alpha)=0$, es decir, si $v_f(\beta_1)=1 \land v_f(\beta_2)=0$

   En este caso se que $\beta_1 \in \Gamma'$ y que $\beta_2 \not\in \Gamma'$ por **Hipotesis Inductiva**.

   Entonces, operando obtengo:
   $$
   \empty \vdash (\beta_1 \rightarrow(\neg\beta_2 \rightarrow\neg(\beta_1 \rightarrow\beta_2)))\\
   \Rightarrow \empty \vdash \neg (\beta_1 \rightarrow \beta_2)\\
   \Rightarrow \Gamma' \vdash \neg(\beta_1 \rightarrow \beta_2)\\
   $$
   Y como $\Gamma'$ es MC:
   $$
   (\beta_1 \rightarrow \beta_2 ) \not \in \Gamma'
   $$

$\therefore \alpha \in \Gamma'$ 



$\Leftarrow )$

La vuelta la demostramos [acá](Observacion - 01.html) 