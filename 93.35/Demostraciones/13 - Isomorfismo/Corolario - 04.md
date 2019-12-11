# Demostración

Sea $L$ un lenguaje de $1^{er}$ orden e $I_1 \simeq_h I_2$:
$$
a\in U_I \text{ es distinguible en }I_1 \Leftrightarrow h(a) \in U_2 \text{ es distinguible en }I_2
$$

#### Demo

$a$ es distinguible en  $I_1$, entonces $\exist \alpha(x)/ \alpha$ expresa a $\{a\}$

Por esto se que :
$$
\array{
(1)&&& I\models\alpha[v_{x=a}]\\
(2)&&& I\not\models\alpha[v_{x=b}]~~~b\neq a
}
$$
Queremos ver que $\exist \beta/$ distingue a $h(a) $ en $I_2$ 

Por el [Teorema Anterior](Teorema - 01.html):
$$
\array{
(3)&& I_2\models\alpha(x)[h_ov_{x=a}] \Rightarrow I_2 \models \alpha(x)[(h_ov)_{x=h(a)}]\\
(4)&& I_2\not\models \alpha(x)[h_ov_{x=b}] \Rightarrow I_2 \not\models\alpha(x)[(h_ov)_{x=h(b)}]~~~~h(a)\neq h(b)
}
$$
Queremos ver que $V_{I_2,v_{x=c}}=1 \Leftrightarrow c=h(a)$

$\Leftarrow)$

Por $(1)$, como $c=h(a)$ y $I_2\models \alpha(x)[w_{x=c= h(a)}]$, entonces:
$$
V_{I_2,w_{x=c}}(\alpha(x))=1
$$
$\Rightarrow)$

Por el contrarreciproco:

Si $c\neq h(a)$, entonces, por $(2)$:
$$
I_2\models \alpha(x)[w_{x=c\neq h(a)}]\\
\Rightarrow V_{I_2,w_{x=c}}(\alpha(x))=0
$$
$\therefore \alpha(x)$ distingue a $h(a)\Rightarrow h(a)$ es distinguible