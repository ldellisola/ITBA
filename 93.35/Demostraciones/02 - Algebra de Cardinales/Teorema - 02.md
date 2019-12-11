# Demostración

$$
2^{\chi_o} = C
$$

#### Demo

Sea $T=\{0,1\}^\N=\{f:\N \rightarrow\{0,1\}/ \text{$f$ es funcion} \}$, $U=[0,1]$

Defino $F$ tal que:
$$
F:T \rightarrow U/ F(f)=[0,f(0)f(1)f(2)\dots]_2
$$
Podemos ver que $F$ es sobreyectiva por que en base 2 se cumple que:
$$
F(\mu_0,\mu_1\mu_2\mu_3 \dots)=[0,\mu_0\mu_1\mu_2\mu_3\dots]_2 \rightarrow \sum_{n=1}^\infty \frac {\mu_n} {2^n}
$$
Pero tenemos problemas para ver la inyectividad por que no podemos encontrar una notación con escritura unica

Propongo el conjunto $T_0$ tal que:
$$
T_0=\{f\in T/ \text{$f$ hace cola de ceros}\}\\
(f(n)=0 ~~ \forall n)
$$
$\#T_0=\chi_o$ por que: 
$$
T_0= \bigcup_{k\in \N} T_{0k},

\left.
	\array{
	T_{00}=\{f/f(n)=0\}\\
	T_{01}=\left\{f \left/ \array{f(0)=1\\ f(n)=0} \right. \right\}\\
	\vdots\\
	T_{0k}=\left\{f \left/ \array{f(k-1)=1\\ f(n)=0} \right. \right\}\\
	}
\right.
$$


$T_0$ es finito $\Rightarrow$ $\# T_0=2^{k-1} \Rightarrow T_0$ es numerable por ser union de conjuntos numerables, entonces:
$$
\#T_0 \leq \chi_o
$$
Entonces observo que:
$$
\#(T-T_0)= \#T= 2^{\chi_o}
$$
Ahora puedo redefinir a $F$ como:
$$
F:T-T_0 \rightarrow (0,1] \sim[0,1]/ f(\mu_1\mu_2\mu_3\dots)=[0,\mu_1\mu_2\mu_3\dots]_2
$$
A partir de esta nueva función voy a ver si es biyectiva:

- Veo que $F$ sea inyectiva:
  $$
  F(f)=F(g)\\
  [0,f(0)f(1)f(2)\dots]_2=[0,g(0)f(1)g(2)\dots]_2\\
  f(i)=g(i) ~~\forall i\\
  f = g
  $$

- Veo que $F$ sea sobreyectiva:

  Sea $x \in (0,1]$ $x$ se puede escribir en base 2 sin colas de ceros:
  $$
  x=[0,x_0x_1x_2\dots]_2 ~~~x_i\in\{0,1\}\\
  \therefore F(x_0,x_1x_2\dots)= [x]_2
  $$

Como $F$ es biyectiva, entonces:
$$
2^{\chi_o}=\#(T-T_0)=\#(0,1] = \#[0,1] = C
$$
 