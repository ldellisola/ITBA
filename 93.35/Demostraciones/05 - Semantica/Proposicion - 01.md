# Demostración

Sean $\alpha \in F$,  $(P_1\rightarrow \alpha)$ es una tautología, entonces:
$$
\text{Si } p_1 \not \in VAR(\alpha) \Rightarrow \alpha \text{ es tautología}
$$

#### Demo

Sea $v$ una valuación, queremos ver que $v(\alpha)=1$:

Defino $f$:
$$
f:VAR \rightarrow\{0,1\}/f(p_i)=
\left\{
	\array{
		v(p_i)	&&	p_i \in VAR(\alpha)\\
		1 && p_i\not \in VAR(\alpha)
	}
\right.
$$
Sea $v_f$ la unica valuación que extiende a $f$, sabemos por dato que:
$$
v_f(p_i \rightarrow \alpha)=1\\
max\{1-v_f(p_i),v_f(\alpha)\}=1\\
max\{1-f(p_i),f(\alpha)\}=1\\
max\{1-1,v(\alpha)\}=1\\
max\{0,v(\alpha)\}=1\\
\Rightarrow v(\alpha)=1 ~~\forall v
$$
$\therefore \alpha$ es una tautología

