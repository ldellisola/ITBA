# Demostración

$$
\text{$\exist f:A \rightarrow B$ inyectiva $\Leftrightarrow \exist g:B \rightarrow A$ sobreyectiva}
$$

#### Demo

$\Rightarrow)$

Por dato existe $f:A\rightarrow B/ f \text{ es inyectiva}$

Defino la funcion $g$:
$$
g:B\rightarrow A/g(b)=
\left\{
\array{
	f^{-1}(b)	 &&		 b \in Im(f)\\
	a_0			&&		b\not \in Im(f)
}
\right.\\
$$
Siendo $a_0$ un elemento cualquiera de $A$.

La funcion $g$ esta bien definida pues $f^{-1}(b)$ es unica, ya que $f$ es inyectiva.

Veamos que $g$ es sobreyectiva:

Sea $a\in A \Rightarrow f(a) \in B$  y  $f(a)\in Im(f)$. Además resulta que :
$$
g(f(a))=f^{-1}(f(a))=a
$$
Entonces vemos que $g$ es sobreyectiva y ademas $\#B \ge \#A$

$\Leftarrow )$

Por dato existe $g:B\rightarrow A/g \text{ es sobreyetiva}$ 

Definimos a la función $f$:
$$
f:A\rightarrow B/f(a)=x_a
$$
Siendo $x_a \in g^{-1}(a)$

Como $g^{-1}(a)\not=\empty$, pues $g$ es sobreyectiva

Veamos que $f$ es inyectiva por el contrareciproco:

Sean $a_1, a_2\in A/ a_1 \neq a_2 \Rightarrow g^{-1}(a_1)\cap g^{-1}(a_2) = \empty$

Como $f(a_1)=x_{a_1} \in g^{-1}(a_1)$ y $f(a_2) = x_{a_2} \in g^{-1}(a_2)$

$\Rightarrow x_{a_1} \neq x_{a_2}$

Entonces, vemos que $f$ es inyectiva y ademas, $\#A \le \#B$

















