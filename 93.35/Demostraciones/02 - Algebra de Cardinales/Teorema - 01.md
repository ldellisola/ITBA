# Demostración

Sea $X$ un conjunto:
$$
\#\rho(X)=2^{\#X}
$$


#### Demo

Sea $f$:
$$
f:\rho(X) \rightarrow\{0,1\}^X
$$
defino $F$ tal que:
$$
F(A)=C_A
$$
Siendo $C_A$ la [ función caracteristica](#Función Característica) de $A~(A\sub X)$.

Veo que $F$ es inyectiva:
$$
F(A)=F(B) \Leftrightarrow C_A = C_B \Leftrightarrow\\
t\in A \Leftrightarrow C_A(t)=1 \Leftrightarrow C_B(t)=1\Leftrightarrow t \in B \\
\therefore A=B
$$
Veo que $F$ es sobreyectiva:

Sea $g \in \{0,1\}^X$, quiero encontrar $C \sub X / F(C) = g$, es decir $C=\{t\in X/g(t)=1\}$

Pido que $F(C) = C_C-X_C$

Quiero ver que $X_C = g$

$$
t\in X \Rightarrow X_C(t)=1 \Leftrightarrow t\in C \Leftrightarrow g(t)=1\\

\left.
	\array{
		X_C(t)=1 \Leftrightarrow g(t)=1 \\
		X_C(T)\neq 0 \Leftrightarrow g(t) \neq 1
	}
\right\}

g=X_C
$$
Entonces $F$ es sobreyectiva.

Como $F$ es sobreyectiva e inyectiva, entonces es biyectiva, entonces:
$$
\#\rho(X)=2^{\#X}
$$

# Anexo

### Función Característica

$C_A$ es la función caracteristica de $A~(A\sub X )$  tal que:
$$
C_A :X \rightarrow \{0,1\}/ C_A(t)=\left\{	\array{		1 & t \in A\\		0 & t \notin A	}\right.
$$
