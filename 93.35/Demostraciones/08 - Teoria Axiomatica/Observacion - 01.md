# Demostración

$$
\Gamma \text{ satisfacible } \Rightarrow \Gamma \text{ consistente}
$$

#### Demo

La demostración se hace por absurdo mediante el teorema de correctitud.

Supongamos que $\Gamma$ no es consistente, entonces:
$$
\exist \alpha \in F / \Gamma \vdash \alpha \land \Gamma \vdash \neg \alpha
$$
Entonces, por [Teorema de correctitud](Teorema - 03.html):
$$
\alpha \in C(\Gamma) \land \neg \alpha \in C(\Gamma)
$$
Como $\Gamma$ es satisfacible, entonces:
$$
\exist v \text{ valuación }/v(\Gamma)=1
$$
Como $\alpha $ y $\neg \alpha \in  C(\Gamma)$:
$$
v(\alpha)=1 \land v(\neg \alpha)=1
$$
**ABS!**

$\therefore \Gamma$ es consistente