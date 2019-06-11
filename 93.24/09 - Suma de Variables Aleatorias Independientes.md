# Suma de Variables Aleatorias Independientes

Para la suma de variables aleatorias, siempre se mantiene:
$$
S = X_1+X_2\rightarrow
\left\{
	\begin{array}{ll}
		\sigma_S^2 = \sigma_{X_1}^2+\sigma_{X_2}^2 \\
		\mu_S = \mu_{X_1} +\mu_{X_2}
	\end{array}
\right.
$$

## Suma de Bernoulli

Sea el exito de un experimento cuya probabilidad es $p$:
$$
X_n\sim Bernoulli(p)~~~|~~~R_{X_n}=\{0,1\}~~~|~~~P(X_n=1)=p~~~|~~~ \mu=p~~~|~~~\sigma^2=p\ .\ (1-p)
$$
Entonces el numero de exitos en $K$ experimentos independientes (Todos con la misma probabilidad $p$) se expresa como:
$$
S_K\sim Binomial(n,p)
$$
