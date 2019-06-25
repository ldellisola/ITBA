# Variables Aleatorias

### Definición

Una **variable aleatoria** (VA) es una función que va del espacio muestral hacia los números reales $(X:S\rightarrow \R)$

El **recorrido** $(R)$ de la variable discreta es la Imagen de $X$. Este puede ser continuo o discreto.

Las VAs tienen dos funciones características, una llamada **función de densidad de probabilidad**$(P_x(k))$, que mide la probabilidad individual de cada elemento, y luego esta **función de probabilidad acumulada** $(F_x(k) = P(X\leq k))$, que mide la probabilidad acumulada.

Tambien tienen funciones como el **valor esperado**, el **momento**, el **valor medio o media**, los **momentos centrales** y la **varianza**.

### Propiedades 

#### Función de Densidad

1. $0\leq P_x(k)\leq1$
2. $\sum_{k\ \in\ R_x} P_x(k) = 1$

#### Función de Probabilidad Acumulada

1. $\lim_{k\rightarrow -\inf} F_x(k) =  0$
2. $\lim_{k\rightarrow \inf} F_x(k) =  1$
3. $F_X(k)$ es monótona creciente.
4. $lim_{k\rightarrow k_0} F_X(k) = F_X(k_0)$
5. $P(A<X\leq B) = F_X(B) - F_X(A)$ 

# Variables Aleatorias Discretas

### Definición

Una **variable aleatoria discreta** (VADs) son aquellas cuyo recorrido es discreto.

### Valor Esperado

$$
E[g(x)] = \sum_{k\ \in\ R_x}g(k)\ .\ P_x(k)
$$

### Momentos

$$
\mu_n=E[x^n]\ \ ,\ \ n\in\N
$$

#### Valor Medio (1er Momento)

$$
\mu=E[x]=\sum_{k\in R_x} k\ .\ P_x(k)
$$

### Momentos Centrales

$$
\gamma_n=E[(x-\mu)^n]\ \ ,\ \ n\in \N
$$

#### 1er Momento Central

$$
\gamma_1=E[(x-\mu)]=\sum_{k\in R_x} k\ .\ P_x(k) + \sum_{k\in R_x} \mu\ .\ P_x(k)
$$

#### Varianza (2do Momento)

$$
\sigma^2=\gamma_2=E[(x-\mu)^2] = E[x^2]-E[x]^2
$$

## Variable Aleatoria de Bernoulli

$$
Y\sim Bernoulli(p)
$$

El experimento puede ser exitoso o no, con probabilidad $p$.
$$
Y\left\{
	\begin{array}{ll}
		1\ \ existoso \\
		0\ \ no\ exitoso\\
	\end{array}
\right.\\


p_0 = q = 1-p\ \ ,\ \ p_1=p\ \ ,\ \ \mu = p\ \ ,\ \ \sigma^2=p\ .\ q
$$

#### Aproximación

- La variable aleatoria de Bernoulli se puede aproximar a una binomial de la siguiente forma:

$$
Y\sim Bernoulli(p) \rightarrow\ Y\sim Binomial(1,p)
$$

## Variable Aleatoria Binomial

$$
X\sim Binomial(n,p)
$$

Se repite un experimento **n** veces, cada experimento es **independiente** de los demás y la probabilidad de éxito en cada experimento es **p**.

- $x = \#\ de\ exitos\ en\ los~n~experimentos $.

- $P_k = P(x=k)=\begin{pmatrix} n\\k \end{pmatrix}\ .\ p^k\ .\ q^{n-k}$
- $\mu = n\ .\ p$
- $\sigma^2=q\ .\ n\ .\ p$

### Aproximación

- La VAD binomial se aproxima a la VAD Bernoulli de la siguiente forma

$$
X \sim Bernoulli(p) \rightarrow X \sim Binomial(1,p)
$$

- La VAD binomial se puede aproximar a la VAD de Poisson de la siguiente forma cuando $n$ es **grande**, $p$ es **chico** y $k\sim p\ .\ n$ :

$$
Binomial(n,p) \sim Poisson(n\ .\ p)
$$

## Variable Aleatoria Poisson

$$
X\sim Poisson(\lambda)
$$

Las VADs de Poisson se suelen cuando se trata de contar al tiempo.

- $P_k = P(x=k)=\frac{\lambda^k}{k!}\times e^{-\lambda}$
- $\mu = \lambda$
- $\sigma^2 = \lambda$

### Aproximación

- La VAD Poisson se puede aproximar a la VAD de binomial  de la siguiente forma cuando $n$ es **grande**, $p$ es **chico** y $k\sim p\ .\ n$ :

$$
Binomial(n,p) \sim Poisson(n\ .\ p)
$$

# Variables Aleatorias Continuas

En este tipo de VACs buscamos la probabilidad que que ocurra un intervalo, por lo que se redefinen las siguientes funciones:

- Función de densidad:

$$
f_x(y)
$$



- Función de probabilidad acumulada:

$$
sea~ P(a\leq X\leq b) = \int_a^bf_x(y)dy
$$

## Distribución Uniforme

$$
X\sim U(a,b)\\
f_x=
\left\{
	\begin{array}{ll}
	\frac{1}{b-a}\ \ ,\ \ x\in (a,b)\\
	0\ \ ,\ \ x\notin(a,b)
	\end{array}
\right.
\ \ ,\ \ 
F_x=
\left\{
	\begin{array}{ll}
	0\ \ ,\ \ x \lt a\\
	\frac{x-a}{b-a}\ \ ,\ \ x\in (a,b)\\
	1\ \ ,\ \ x \gt b
	\end{array}
\right.\\
\mu = \frac{a+b}{2}\ \ ,\ \ \sigma^2=\frac{(b-a)^2}{12}
$$



## Distribución Exponencial

Sirve cuando se trata de tiempos.
$$
X\sim e(\lambda)
\\
f_t(x)=
\left\{
	\begin{array}{ll}
		0\ \ ,\ \ x\lt 0\\
		\lambda\ .\ e^{-\lambda\ .\ x}\ \ ,\ \ x>0
	\end{array}
\right.
\ \ ,\ \ 
F_t(x)=
\left\{
	\begin{array}{ll}
		0\ \ ,\ \ x\lt 0\\
		1- e^{-\lambda\ .\ x}\ \ ,\ \ x>0
	\end{array}
\right.
\\
\mu=\frac{1}{\lambda}\ \ ,\ \ \sigma^2=\frac{1}{\lambda^2}
$$

## Distribución Normal (Gaussiana)

$$
X\sim N(\mu,\sigma)\ \ ,\ \ \sigma \gt0\\
f_X(x)=\frac{e^{\frac{-(x-\mu)^2}{2\ .\ \sigma^2}}}{\sqrt{2\ .\ \pi\ .\ \sigma^2}}
\ \ ,\ \ 
F_X(x) = \int_{-\infty}^{x}{f_X(y)dy}
$$

## Distribución Normal Standard

Es igual a la distribución normal $(X)$ pero se realiza un cambio de variable. No es necesario calcularlo siempre con la formula ya que existe una [tabla](Resources/TablaNormal.pdf) para calcularlo.
$$
Z=\frac{X-\mu}{\sigma}\\
f_Z(x)=\frac{1}{\sqrt{2\ .\ \pi}}\times e^{\frac{Z^2}{2}}\\
\Phi(Z) = F_Z(x)=\int_{-\infty}^{x}f_Z(y)dy\\
\Phi(-Z)=1-\Phi(Z)\\
\mu = 0\ \ ,\ \ \sigma=0
$$

### Inversa

Tambien existe una [tabla inversa](Resources/TablaNormalInversa.pdf) para poder calcular con facilidad la inversa de esta función.
$$
Z_\alpha = \Phi(\alpha)^{-1}
$$








