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

Sea el éxito de un experimento cuya probabilidad es $p$:
$$
X_n\sim Bernoulli(p)
$$
Con :

- $R_{X_n}=\{0,1\}$
- $P(X_n=1)=p~$
- $\mu=p$
- $\sigma^2=p\ .\ (1-p)$

Entonces el numero de éxitos en $K$ experimentos independientes (Todos con la misma probabilidad $p$) se expresa como:
$$
S_K\sim Binomial(n,p)
$$

## Suma de Binomiales

Las VA binomiales se pueden sumar siempre y cuando estas tengan el mismo valor $p$. De ser asi,
$$
S = S_1+S_2 \sim Binomial(n_1+n_2,p)
$$

## Suma de Poisson

Sean $X_1 \sim Poisson(\lambda_1)$, $X_2 \sim Poisson(\lambda_2)$ independientes y  $R_{X_1} = R_{X_2}=\N^0$

Si $S = X_1+X_2$, $R_S = \N^0$:
$$
P(S = k) = \sum_{m=0}^\infty P(X_1 = K-m)\cdot P(X_2 = m)\\
=\sum_{m=0}^\infty \frac {{\lambda_1}^{k-m} \cdot e^{-\lambda_1} } {(k-m)!} \cdot \frac {{\lambda_2}^{m} \cdot e^{-\lambda_2} } {(m)!}\\
= \frac {e^{-(\lambda_1 +\lambda_2)}} {k!} \cdot (\lambda_1 + \lambda_2)^k
$$
Entonces podemos ver que
$$
S \sim Poisson(\lambda_1 + \lambda_2 )
$$

## Suma de Exponenciales (Distribución Gamma)

Sean $n$ VA $T_n \sim Exp(\lambda)$ independientes entre si y con el mismo valor $\lambda$. Si $S = \sum_{i=0}^n T_i$

Entonces la suma tiene la **distribucion Gamma**:
$$
S \sim \Gamma(n,\lambda)
$$

$$
f_S(t)=
\left\{
	\begin{matrix}{}
		\frac {\lambda\cdot(\lambda\cdot t)^{n-1}} {(n-1)!} \cdot e^{-\lambda\cdot t} &t>0\\
		0		& t<0
	\end{matrix}
\right.
$$



## Suma de Normales

Sean $X_1 \sim N(\mu_1,\sigma_1)$, $X_2 \sim N(\mu_2,\sigma_2)$ independientes entre si:
$$
S = X_1 +X_2 \sim N(\mu_1 +\mu_2, \sqrt{\sigma_1^2+\sigma_2^2})
$$
