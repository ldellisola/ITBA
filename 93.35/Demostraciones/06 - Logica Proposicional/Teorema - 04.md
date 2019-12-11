# Demostración

**Teorema de Compacidad**: 

Sean $\Gamma \sube F$:
$$
\Gamma \text{ es satisfacible }\Leftrightarrow \Gamma \text{ es f.s.}
$$

#### Demo

La ida es intuitiva, pero para la vuelta se define una sucesión creciente de conjuntos utilizando el [lema anterior](Lema - 01.html). Vamos construyendo el nuevo conjunto agregando variables proposicionales.

$\Rightarrow)$

$\Gamma$ es satisfaible $\Rightarrow \exist v$ valuación tal que $v(\Gamma)=1$

Sea $\Gamma_1=\{\alpha_1,\dots,\alpha_n\} \subseteq \Gamma$, como $v(\alpha)=1~~\forall \alpha \in \Gamma$, en particular cumple con:
$$
v(\Gamma_1)=1
$$
$\Leftarrow)$

Defino una sucesion creciente de conjuntos $\Delta_0 \subseteq \ldots \subseteq \Delta_n$ que van a contener literales.

Defino:
$$
\array{\Delta_0= \empty&&\Delta_{n+1}=

\left\{
	\array{
	\Delta_{n}\cup \{p_n\}	&&	\Gamma\cup \Delta_{n} \cup \{p_n\} \text{ es f.s.}\\
	\Delta_{n}\cup \{\neg p_n\}	&&	\Gamma\cup \Delta_{n} \cup \{\neg p_n\} \text{ es f.s.}
	}
\right.

}
$$
Sabemos que el n-ésimo elemento del conuunto esta bien definido por el [lema anterior](Lema - 01.html):
$$
\Delta = \bigcup_{n\in \N} \Delta_n
$$
Defino $f$ tal que:
$$
f:VAR\rightarrow \{0,1\}/f(p_j)=
\left\{
	\array{
		1 	&&	p_j \in \Delta\\
		0	&&	\neg p_j \in \Delta
	}
\right.
$$
Sea $v_f$ la valuación que extiende a la función $f$.

Notemos que $v_f(\Delta)=1$

Ahora vamos a probar que $v_f(\Gamma)=1$:

Supongamos que $v_f$ no satisface a $\Gamma$, entonces $\exist \alpha \in \Gamma /v_f(\alpha)=0$

Sea $k=max\{j/\text{ $p_j$ aparce en $\alpha$}\}$

Tengo 2 casos:

1. $v_f(p_k)=1$

   Entonces $\Sigma = \{\alpha\} \cup \Delta_k \cup \{p_j\}$ es insatisfacible.

   Ademas $\Delta_k \cup \{p_j\}=\Delta_{k+1}$ por definición.

   Entonces $\Sigma$ es finito e insatisfacible y  $\Sigma \subseteq \Gamma \cup \Delta_{k+1}$

   Pero $\Gamma \cup \Delta_{k+1}$ es finitamente satisfacible, entonces $\Sigma$ es satisfacible.

   **ABS!**, ya que habiamos visto que $\Sigma$ era insatisfacible.

   Vamos a ver que $\Sigma$ es insatisfacible:

   Supongamos que es satisfacible, entonces:
   $$
   \exist w\text{ val }/w(\Sigma)=1 \Rightarrow w(\alpha)= w(\Delta_{k+1})=1
   $$
   Notemos que si $p_j \in VAR(\alpha)$, entonces:
   $$
   p_j \in \Delta_{k+1} \lor \neg p_j \in \Delta_{k+1}
   $$
   Entonces:
   $$
   \left.v_f\right|_{VAR(\alpha)}=\left.w\right|_{VAR(\alpha)} \Rightarrow v_f(\alpha)= w(\alpha) \Rightarrow 0 = 1  
   $$

   **ABS!**

2. $v_f(p_k)=0$

   Entonces $\Sigma = \{\alpha\} \cup \Delta_k \cup \{\neg p_j\}$ es insatisfacible.

   Ademas  $\Delta_k \cup \{\neg p_j\}=\Delta_{k+1}$ por definición. 

   $\Sigma$ es finito e insatisfacible, y $\Sigma \subseteq \Gamma \cup \Delta_{k+1}$

   Pero como $\Gamma \cup \Delta_{k+1}$ es finitamente satisfacible, entonces $\Sigma$ es satisfacible.

   **ABS!**, ya que habiamos visto que $\Sigma$ era insatisfacible.

   El resto de la demo es analogo al primer caso.

$$
\therefore v_f(\Gamma)=1 \Rightarrow\Gamma \text{ es satisfacible}
$$

