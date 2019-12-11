# Demostración

**Lema de Lindenbaum**

Dado un $\Gamma$ consistente: 
$$
\exist \Gamma' M.C./ \Gamma' \sube \Gamma
$$

#### Demo

Sabemos que:
$$
\#F = \chi_o \Rightarrow \exist f: \N \rightarrow F/ f \text{ es biyectiva}
$$
Tambien podemos decir que $F = Im(f)=\{\gamma_0,\dots,\gamma_n\}$

Vamos a definir al conjunto $\Gamma'$:
$$
\Gamma_0=\Gamma\\
\Gamma_{n+1}=
\left\{
	\array{
		\Gamma_n \cup \{\gamma_n\} && \text{si } \Gamma_n \cup \{\gamma_n\} \text{ es consistente}\\
		\Gamma_n	&&	\text{sino}
	}
\right.\\
\Gamma'=\bigcup_{n\in \N}\Gamma_n
$$
Queremos ver que $\Gamma'$ es Maximal Consistente  y que $\Gamma \subseteq \Gamma'$:

<u>Primero vemos que $\Gamma \subseteq \Gamma'$:</u>

Por definición sabemos que $\Gamma_0 = \Gamma$ y que $\Gamma_0 \subseteq \Gamma'$, entonces:
$$
\Gamma \subseteq \Gamma'
$$
<u>Ahora vamos a ver que $\Gamma'$ es Maximal Consistente:</u>

Supongamos que $\Gamma'$ no es consistente, entonces:
$$
\exist \alpha /\Gamma'\vdash \alpha \and \Gamma' \vdash \neg \alpha
$$
Entonces:
$$
\exist \alpha_1,\dots,\alpha_n \text{ prueba a partir de } \Gamma'\\
\exist \beta_1,\dots,\beta_k \text{ prueba a partir de } \Gamma'
$$
Voy a definir al conjunto $X$ a partir de las pruebas anteriores:
$$
X=\{\alpha_j/1\le j\le \text{ y } \alpha)j \in \Gamma' \} \cup \{b_i/1\le i \le n \text{ y } \beta_i \in \Gamma'\}
$$
Defino al numero $M$:
$$
M-max\{r/\gamma_r \in X\}
$$
Entonces:
$$
X \subseteq \Gamma_{M+1}
$$
Y como este es maximal, contiene a todos.

Entonces:
$$
\Gamma_{M+1} \vdash \alpha \text{ y } \Gamma_{M+1} \vdash\neg \beta
$$
**ABS!** por que $\Gamma_{M+1}$ es consistente.

<u>Vemos que $\Gamma_n$ es consistente $\forall n\in\N$</u>

Se va a demostrar por inducción:

- **Caso Base**: $\Gamma_0 = \Gamma$ consistente por dato.

- **Hipótesis Inductiva**:
  $$
  \Gamma_n \text{ es consistente}
  $$

- **Tesis Inductiva**:
  $$
  \Gamma_{n+1} \text{ es consistente}
  $$

Habíamos definido a $\Gamma_{n+1}$ como:
$$
\Gamma_{n+1}=
\left\{
	\array{
		\Gamma_n \cup \{\gamma_n\} && \text{si } \Gamma_n \cup \{\gamma_n\} \text{ es consistente}\\
		\Gamma_n	&&	\text{sino}
	}
\right.
$$
Entonces veo que hay dos casos:

1. Si $\Gamma_n \cup \{\gamma_n\}$ es consistente, entonces $\Gamma_{n+1}$ es consistente

2. Si $\Gamma_n \cup \{\gamma_n\}$ no es consistente, entonces $\Gamma_{n+1} = \Gamma_n$

   Por **Hipótesis Inductiva** $\Gamma_n$ es consistente, entonces $\Gamma_{n+1}$ es consistente.

<u>Por ultimo, veo que $\Gamma'$ es maximal</u>:

Supongo que $\exist \beta \in F/ \beta \not \in \Gamma' \land \Gamma' \cup \{\beta\}$ es consistente.

Entonces, $\exist N / \beta = \gamma_n$

Siguiendo con la definición anterior de $\Gamma_{n+1}:$
$$
\Gamma_{n+1}=
\left\{
	\array{
		\Gamma_n \cup \{\gamma_n\} && \text{si } \Gamma_n \cup \{\gamma_n\} \text{ es consistente}\\
		\Gamma_n	&&	\text{sino}
	}
\right.
$$
Como $\gamma_N \not \in \Gamma'$, entonces $\Gamma_N\cup \{\gamma_N\}$ no es consistente.

Entonces:
$$
\exist \delta \in F/ \Gamma_N \cup \{\gamma_N\} \vdash \delta \land \Gamma_N \cup \{\gamma_N\} \vdash \neg \delta 
$$
Entonces:
$$
\Gamma' \cup \{\gamma_n\} \vdash \delta \land \Gamma' \cup \{\gamma_n\} \vdash \neg \delta
$$
**ABS!** por que supusimos que  es consistente.

$\therefore \Gamma'$ es maximal consistente