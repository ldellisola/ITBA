# Demostración

Sea $a=\#A, b=\#B, k=\#K, A \cap B= \empty$
$$
a+b = \#(A\cup B)
$$

#### Demo

Verificamos que este bien definido:

Tomo $A' \sim A,B'\sim B/ A' \cap B'=\empty$ y quiero probar que $\#(A'\cup B') = \#(A\cup B)$

Puedo definir $f$ :
$$
\text{Como } A' \sim A \Rightarrow \exist f:A\rightarrow A' \text{ biyectiva}
$$
Puedo definir $g$:
$$
\text{Como } B' \sim B \Rightarrow \exist g:B \rightarrow B' \text{ biyectiva}
$$
Tambien defino $h$ tal que:
$$
h:A\cup B \rightarrow A' \cup B'/h(x)=
\left\{
	\array{
	f(x) &	x\in A\\
	g(x)	&	x \in B
	}
\right.
$$
Vemos que $h$ es biyectiva:

- $h$ es inyectiva:

  - Caso 1) $x,y \in A$
    $$
    h(x)=h(y)\\f(x)=f(y)\\
    \text{Como $f$ es inyectiva}\\
    x=y
    $$

  - Caso 2) $x,y \in B$
    $$
    h(x)=h(y)\\
    g(x)=g(y)\\
    \text{Como $g$ es inyectiva}\\
    x=y
    $$

  - Caso 3) $x\in A, y\in B \Rightarrow x\neq y$

    Quiero ver que $h(x) \neq h(y)$
    $$
    \array{
    	h(x)=f(x) \in A'\\
    	h(y)=g(y) \in B'
    }
    $$
    Pero como sabíamos que $A'\cap B' = \empty$, entonces:
    $$
    h(x) \neq h(y)
    $$

  $\therefore h$ es inyectiva

- $h$ es sobreyectiva:

  Sea $z \in A' \cup B'$

  - Caso 1) $z \in A'$
    $$
    h(a)=f(a)=z
    $$
    Por que $f$ es sobreyectiva

  - Caso 2) $z \in B'$
    $$
    /h(b)=g(b)=z
    $$
    Por que $g$ es sobreyectiva

Como $h$ es inyectiva y sobreyectiva, entonces es biyectiva.
$$
\Rightarrow\#(A'\cup B') = \#(A\cup B)
$$
