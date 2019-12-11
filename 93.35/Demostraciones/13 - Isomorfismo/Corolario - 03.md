# Demostración



Sea $L$ un lenguaje de $1^{er}$ orden e $I$ una interpretación:
$$
\text{Si }\exist h/ h:U_I\rightarrow U_I \text{ es un isomorfismo y } A\subseteq U_I/ \text{ $A$ es expresable}
\\
\Rightarrow h(a) \in A~~~\forall a\in A
$$

#### Demo

$A$ es expresable, entonces $\exist \alpha(x)/ \alpha$ expresa a $A$.

A partir de esto se que:
$$
\array{
(1)&&& I \models \alpha[v_{x=a}]~~\forall a \in A\\
(2)&&& I \not \models \alpha[v_{x=b}]~~\forall b \not\in A
}
$$
Entonces, por el [teorema anterior](Teorema - 01.html):
$$
I\models \alpha[h_ov_{x=a}]
$$
Es decir:
$$
I\models \alpha[(h_ov)_{x=h(a)}]
$$
Entonces:
$$
F(a)\in A~~~ \forall a \in A
$$
$\therefore$ por $(1)$ y $(2)$, $F(A)\subseteq A$

