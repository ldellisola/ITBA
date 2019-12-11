# Demostración

Sea $\Gamma \sube F, p_i\in Var$:
$$
\Gamma \text{ es f.s.} \Rightarrow R\cup \{p_i\} \text{ es f.s.} \or R\cup \{\neg p_i\} \text{ es f.s.}
$$

#### Demo

Supongamos que $\Gamma \cup \{p_j\}$ no es finitamente satisfacible y que $\Gamma \cup \{\neg p_j\}$ tampoco lo es

Entoces podemos decir que:
$$
\exist \Gamma_1 \subseteq\Gamma\cup \{p_j\} \text{ finito e insatisfacible}
$$

$$
\exist \Gamma_1 \subseteq\Gamma\cup \{\neg p_j\} \text{ finito e insatisfacible}
$$

Notemos que $\Gamma_1 \not \subseteq \Gamma$ y $\Gamma_2 \not \subseteq \Gamma$ pues $\Gamma $ es finitamente satisfacible.

Entonces:
$$
\Gamma_1 = \widetilde \Gamma_1 \cup \{p_j\} /\widetilde \Gamma_1 \subseteq \Gamma
$$

$$
\Gamma_2 = \widetilde \Gamma_2 \cup \{\neg p_j\} /\widetilde \Gamma_2 \subseteq \Gamma
$$

Defino $\widetilde \Gamma = \widetilde \Gamma_1 \cup \widetilde \Gamma_2$ con $\widetilde \Gamma_1$ y $\widetilde \Gamma_2$ finitos, entonces $\widetilde \Gamma$ es finito.

Como $\widetilde \Gamma_1 \subseteq \Gamma$ y $\widetilde \Gamma_2 \subseteq \Gamma \Rightarrow \widetilde \Gamma \subseteq \Gamma$

Como $\widetilde \Gamma$ es finito, $\widetilde \Gamma \subseteq \Gamma$ y $\Gamma$ es finitamente satisfacible:
$$
\widetilde \Gamma \text{ es satisfacible}\\
\Rightarrow  \exist v\text{ val }/v(\widetilde \Gamma)=1
$$
Por ultimo, tengo que analizar 2 casos:

1. $v(p_j)=1$

   Entonces $v(\widetilde \Gamma_1 \cup \{p_j\})=1$ 

   **ABS!** por que $\widetilde \Gamma_1 \cup \{p_j\}=\Gamma_1$  y $\Gamma_1$ es insatisfacible

2. $v(p_j)=0$

   Entonces $v(\widetilde \Gamma_2 \cup \{\neg p_j\})=1$

   **ABS!** por que $\widetilde \Gamma_2 \cup \{\neg p_j\} = \Gamma_2$ y $\Gamma_2$ es insatisfacible

Entonces, (Por Ley de Morgan) $\Gamma \cup \{p_j\}$ es finitamente satisfacible o $\Gamma \cup \{\neg p_j\}$ es finitamente satisfacible.