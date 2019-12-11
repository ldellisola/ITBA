# Demostración

Son equivalentes:
$$
\array{
1)&\Gamma \text{ es f.s } \Leftrightarrow \Gamma \text{ es satisfacible}\\
2)&\Gamma \text{ no es f.s.} \Leftrightarrow \Gamma \text{ es insatisfacible}\\
3)&\alpha \in C(\Gamma) \Rightarrow \exist \Gamma' \text{ finito}/ \Gamma' \sube \Gamma \and \alpha \in C(\Gamma')
}
$$


#### Demo

Solamente hay que demostrar $ ((1)\Leftrightarrow (2) ) \Leftrightarrow (3)$

Como el enunciado $(1)$ es el [teorema de compacidad](Teorema - 04.html), y el enunciado $(2)$ es el contrareciproco, solo hay que probar la relacion entre estos y el tercer enunciado.

$((1)\Leftrightarrow (2)) \Rightarrow (3)$

Sea $\alpha \in C(\Gamma) \Rightarrow\Gamma \cup \{\neg \alpha\}$ es insatisfacible

Entonces, por el **Teorema de Compacidad**, $\Gamma \cup \{\neg \alpha\}$ no es finitamente satisfacible.

Entonces, $\exist \Gamma'\subseteq \Gamma \cup \{\neg\alpha\}/ \Gamma'$ es finito e insatisfacible.

Hay 2 casos:

1. $\Gamma' \subseteq \Gamma$

   Como $\Gamma'$ es insatisfacible, entonces:
   $$
   C(\Gamma')= F \Rightarrow \alpha \in C(\Gamma')
   $$

2. $\Gamma' \not \subseteq \Gamma$

   Podemos redefinir a $\Gamma ' = \Gamma'' \cup \{\neg \alpha\}/\Gamma '' \subseteq \Gamma$

   Queremos ver que $\alpha \in C(\Gamma '')$.

   Vamos a suponer que $\alpha \not  \in C(\Gamma'') $:

   Entonces $\exist v$ valuación tal que:
   $$
   v(\Gamma'')=1 \land v(\alpha)=0\\
   \Rightarrow v(\Gamma'')=1 \land v(\neg \alpha)=1
   $$
   Por definición podemos decir que:
   $$
   v(\Gamma')=1
   $$
   **ABS!** por que $\Gamma'$ es insatisfacible.

$$
\therefore \alpha \in C(\Gamma'')
$$

$((1)\Leftrightarrow(2)) \Leftarrow (3)$

Primero pruebo que el teorema es valido:

$\Rightarrow ) $

Sea $\Gamma$ satisfacible, entonces existe una valuación $v$ tal que $v(\Gamma)=1$

Sea $\Gamma' \subseteq \Gamma$ finito, entonces:
$$
v(\Gamma')=1 \Rightarrow \Gamma' \text{ es finitamente satisfacible}
$$
$\Leftarrow )$ <u>Por Contrareciproco</u>

Queremos ver que $\Gamma$ es insatisfacible $\Rightarrow \Gamma$ no es finitamente satisfacible

Sea $\Gamma$ insatisfacible, entonces:
$$
C(\Gamma)=F \Rightarrow (p_1 \land \neg p_1) \in C(\Gamma)
$$
Entonces, por $(3)$, $\exist \Gamma' \subseteq \Gamma$ finito tal que:
$$
(p_1 \land \neg p_1)\in C(\Gamma')\\
\Rightarrow \Gamma' \text{ es insatisfacible}\\
\Rightarrow \Gamma' \text{ no es finitamente satisfacible}
$$
