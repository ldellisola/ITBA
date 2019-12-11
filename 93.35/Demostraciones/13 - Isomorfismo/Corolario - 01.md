# Demostración

Sea $L$ un lenguaje de $1^{er}$ orden, $I_1 \simeq_h I_2$ y $\alpha $ un enunciado:
$$
\alpha \text{ es valido en }I_1 \Leftrightarrow \alpha \text{ es valido en } I_2
$$

#### Demo

$$
I_1 \models \alpha\\
\Leftrightarrow I_1 \models \alpha[v]~~\forall v:VAR\rightarrow U_1/\text{val}\\
$$

Por el [Teorema anterior](Teorema - 01.html):
$$
\Leftrightarrow I_2 \models \alpha[h_ov]~~~\forall v:VAR \rightarrow U_2/\text{val}\\
\Leftrightarrow I_2 \models \alpha[w]~~~\forall w:VAR\rightarrow U_2/\text{val}
$$
Sea $v:VAR \rightarrow U_1$:
$$
\Rightarrow \exist w=h_ov:VAR\rightarrow U_2
$$
Sea $w:VAR \rightarrow U_2$:
$$
\Rightarrow \exist v= h^{-1}:VAR \rightarrow U_1
$$
Entonces:
$$
I_2 \models \alpha
$$
