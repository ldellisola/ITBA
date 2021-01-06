# Demostración

Teorema de Cantor:
$$
\#X \lt \rho(X)
$$

Hay infinitos cardinales infinitos:
$$
\#\mathbb{N} \lt \#\rho(\mathbb{N}) \lt \#\rho(\rho(\mathbb{N})) \lt \dots 
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

Supongo que $\exists h:X \rightarrow \rho(X)$ sobreyectiva

Defino $B=\{x\in X/x \notin h(x)\} \subset X$, entonces  $B \in \rho(X)$

Como $h$ es sobreyectiva $\Rightarrow \exists b \in X/h(b)=B$

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

