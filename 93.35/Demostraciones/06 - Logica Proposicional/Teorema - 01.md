# Demostración

Sea $\alpha \in F, \Gamma \sub Formulas$, entonces:
$$
\alpha \in C(\Gamma) \Leftrightarrow \Gamma \cup \{\neg \alpha\} \text{ es insatisfacible}
$$

#### Demo

$\Rightarrow)$ <u>Por contrareciproco</u>

Supongo que $\Gamma \cup \{\alpha\}$ es insatisfacible.

Entonces $\exist v $ valuación $/ v(\Gamma) =1 \land v(\neg \alpha)=0$

Por lo que $\alpha \not \in C(\Gamma)$

Queda demostrado por el contrareciproco.

$\Leftarrow )$

Supongo que $\alpha \not \in C(\Gamma) \Rightarrow v(\Gamma)=1 \land v(\alpha)=0$

Entonces, $v(\Gamma)=1$ y $v(\neg \alpha)=1$

Por lo que $v$ satisface a $\Gamma \cup \{\neg\alpha\}$

Entonces $\Gamma \cup \{\neg \alpha\}$ es satisfacible

Queda demostrado por contrareciproco.