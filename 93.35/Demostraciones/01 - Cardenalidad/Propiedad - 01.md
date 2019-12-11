# Demostración

Sea $X$ infinito no numerable ($\#X \gt \chi_o$) y $A$ numerable, entonces:
$$
X\cup A \sim X
$$

#### Demo

$$
\exist f:\N \rightarrow X \text{ inyectiva no biyectiva }\\
Im(f)=\{ f(0), f(1), \dots \} = Y \sim \N \and Y \sub X
$$


Caso 1: $A \cap X = \empty$
$$
Y \cup A \sim Y \Rightarrow \exist g: Y\cup A \rightarrow Y/ g \text{  biyectiva}
$$
​	Luego defino una función $f$ biyectiva:
$$
f: X\cup A \rightarrow X/ f(t)=
\left\{
	\begin{matrix}
		t & t \in X-Y\\
		g(t) & t \notin X-Y
	\end{matrix}
\right.
$$
![img](Resources/clip_image001.png)
$$
\therefore X\cup A \sim X
$$
Caso 2: $A \cap X \neq \empty$

​	Podemos escribir a $A$ como:
$$
A=(A \cap X) \cup (A-X)=(A \cap X)\cup \overline{A}
$$
​	Como $A$ es parte de $X$, podemos decir que $X\cup A = X \cup \overline A$.

​	De la misma forma, como $\overline A \sub A-X$ y $A-X$ es numerable, $\overline A$ es numerable.

​	Entonces caigo en el caso 1.

