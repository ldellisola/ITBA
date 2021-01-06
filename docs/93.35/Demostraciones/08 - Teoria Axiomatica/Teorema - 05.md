# Demostración

**Teorema de la Completitud**
$$
\alpha \in C(\Gamma) \Leftrightarrow \Gamma \vdash \alpha
$$

#### Demo

$\Rightarrow)$

Sea $\alpha \in C(\Gamma)$, podemos decir que:
$$
\Gamma \cup\{\neg\alpha\} \text{ es insatisfacible}
$$
Entonces, usando el contrareciproco del teorema que dice $\text{Satisfacible} \Rightarrow \text{Consistente}$:
$$
\Gamma \cup\{\neg\alpha\} \text{ es inconsistente}
$$
Por Lema:
$$
\Gamma \vdash \alpha
$$
$\Leftarrow )$

La vuelta esta probada en el [teorema de la correctitud](Teorema - 03.html)