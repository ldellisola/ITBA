# Demostración

Teorema de Cantor:
$$
\#X \lt \rho(X)
$$

Hay infinitos cardinales infinitos:
$$
\#\N \lt \#\rho(\N) \lt \#\rho(\rho(\N)) \lt \dots 
$$

#### Demo

Defino $f$ tal que:
$$
f:X \rightarrow \rho(X)/f(a) = \{a\}
$$

Podemos ver que $f$ es inyectiva, entonces podemos decir que:
$$
\#X \leq \#\rho(X)
$$

Supongo que $ \exist h:X \rightarrow \rho(X)$ sobreyectiva

Defino $B=\{x\in X/x \notin h(x)\} \sub X$, entonces  $B \in \rho(X)$

Como $h$ es sobreyectiva $\Rightarrow \exist b \in X/h(b)=B $

Quiero ver si $b \in B$:
$$
b \in B \Leftrightarrow b \in h(b) \Leftrightarrow b \notin B
$$
**ABS!**, entonces $h$ no es sobreyectiva, por lo que:
$$
\#\rho(X) \not \le \#X
$$
Y como $\#X \leq \#\rho(X)$ y $\#X \not\geq\# \rho(X)$, entonces:
$$
\#X \lt\# \rho(X)
$$

