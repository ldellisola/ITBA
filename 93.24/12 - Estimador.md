# Estimadores

La **estimación** es el proceso por el cual intentamos de aproximar una cantidad desconocida a partir de los datos de una muestra.

### Definiciones

- Estimador: Es una variable aleatoria. Es una función de la muestra que intenta de aproximar una cantidad o valor desconocido.
- Estimación: Es un valor para una muestra dada. Puede ser puntual (1 solo valor) o por intervalo.

Si $\theta$ es el parámetro desconocido, entonces $\hat \theta$ es su estimador.

### Error Cuadrático Medio

$$
E[(\hat\theta - \theta)^2] = var(\hat\theta) + Sesgo(\hat\theta)^2
$$

### Estimador Insesgado

El estimador no tiene sesgo si $Sesgo(\hat\theta) = 0 \Leftrightarrow E[\hat\theta] = \theta$. Entonces:
$$
Sesgo(\hat\theta) = E[\hat\theta] - \theta
$$

## Estrategias para Encontrar Estimadores

### Máxima Verosimilitud

Probabilidad de $X_1,X_2,\dots,X_n $ depende del parámetro $\theta = f(X_1,X_2,\dots,X_n,\theta)$

$\hat\theta = argmax_\theta f(X_1,X_2,\dots,x_n, \theta)$

#### Ejemplo Bernoulli

Sea $X_i \sim Bernoulli(p)$ con $p$ desconocido, entonces mi estimador es $\hat p$.

El **estadístico** es $S_n = \sum_{i=1}^n x_i \sim Binomial(n,p)$, siendo $n$ la cantidad de muestras.
$$
f(S_n,p) = 
\begin{pmatrix}
	n \\ S_n
\end{pmatrix} 
\cdot p^{S_n} \cdot (1-p)^{n-S_n}
$$
Como quiero maximizar la función, la derivo en función de $p$.
$$
\frac {df} {dp} = \begin{pmatrix} n \\ S_n \end{pmatrix} \cdot p^{S_n -1} \cdot (1-p)^{n-S_n -1} \cdot[S_n\cdot(1-p) - (n-S_n) \cdot p]
$$
Veo cuando es igual a 0
$$
S_n \cdot(1-p) - (n-S_n)\cdot p = 0\\
S_n - n = 0\\
S_n = n
$$

#### Ejemplo Normal

Sea $X_i \sim N(\mu,\sigma)$ con $\mu$ desconocido, entonces utilizamos el estimador $\hat \mu$

Sea la verosimilitud :
$$
f(X_1,X_2,\dots,X_n) = f(X_1)\cdot f(X_2) \dots f(X_n)
= \frac{1}{(2 \cdot\pi \cdot \sigma^2)^{n/2}} \cdot e^{\left( \frac{-1}{2\cdot\sigma^2} \sum_{i=1}^n (X_i-\mu)^2  \right)}
$$
Y la verosimilitud logarítmica es 
$$
l(X_1,X_2,\dots,X_n,\mu) = \frac n 2 \cdot ln(2\pi\sigma^2) - \frac 1 {2\sigma^2} \cdot \sum_{i=1}^{n} (X_i - \mu)^2
$$
Para maximizar tengo que derivar dos veces y pedir $\frac {dl} {d\mu} = 0$ y $\frac {d^2l} {d\mu^2} < 0$
$$
\frac {dl} {d\mu} = \frac 1 {2\sigma^2} \cdot\sum_{i=1}^n 2\cdot(X_i - \mu) = 0 \Leftrightarrow \sum_{i=1}^n(X_i- \hat\mu) = 0\\
\sum_{i=1}^n(X_i)-n\cdot \hat\mu = 0\\
\hat \mu = \sum_{i=1}^n\frac {X_i} n 
$$

$$
\frac {d^2l} {d\mu^2} = \frac {-1} {\sigma^2} \cdot \sum _{i=1}^n 1 = \frac{-n} {\sigma^2} \lt 0 ~~~~\forall n
$$

### Método de los Momentos

Un estimador de $E[X^k] = \frac 1 n \cdot \sum_{i=1}^n X_i^k$, $E[X^k]$ puede escribirse en función del parámetro $g_k(\theta)$. Y su estimador va a ser:
$$
\hat \theta = g_k^{-1}\left( \frac 1 {n} \cdot \sum _{i=1}^n X_i^k \right)
$$

#### Ejemplo Exponencial

Sea $X_i \sim exp(\lambda)$, con $\lambda$ desconocido, entonces tomo como estimador a $\hat \lambda$

$E[X_i] = \frac 1 \lambda \rightarrow$ Estimador de $E[X_i]$:
$$
X_n = \frac 1 n \cdot \sum _{i=1}^n X_i = \frac {1} {\hat{\lambda}}\\
\hat\lambda = \frac n {\sum_{i=1}^{n}X_i} = \frac 1 {\overline X}
$$
Siendo $\overline X$ el promedio de todas las muestras tomadas.

Tambien se puede estimar la varianza:
$$
var(X_i) = \frac 1 {\lambda^2} = \frac 1 {n-1} \cdot \sum_{i=1}^n (X_i - \overline X)^2\\
\therefore~~~~ \hat\lambda = \sqrt{\frac{n-1} {\sum_{i=1}^n (X_i - \overline X)^2}}
$$













