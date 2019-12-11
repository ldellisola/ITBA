# Demostración

Sea $L$ un lenguaje de $1^{er}$ orden e $I$ una interpretación:
$$
\text{Si }\exist h/ h:U_I\rightarrow U_I \text{ es un isomorfismo y } a \in U_I \text{ es distinguible}\\
\Rightarrow h(a)=a
$$

#### Demo

Como $a$ es distinguible, entonces $\exist \alpha(x)\in F/\alpha(x) $ expresa a $\{a\}$

Entonces sabemos que:
$$
\array{
(1)&&& I \models \alpha[v_{x=a}]\\
(2)&&& I \not \models \alpha[v_{x=b}]~~b\neq \alpha
}
$$
Por el [teorema anterior](Teorema - 01.html):
$$
I\models \alpha[h_ov_{x=a}]
$$
Es decir, se comple con:
$$
I \models \alpha[(h_ov)_{x=h(a)}]
$$
Por $(1)$ y $(2)$:
$$
\therefore h(a)=a
$$

