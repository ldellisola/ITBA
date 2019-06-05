# Variables Aleatorias

### Definición

Una **variable aleatoria** (VA) es una función que va del espacio muestral hacia los números reales $(X:S\rightarrow \R)$

El **recorrido** $(R)$ de la variable discreta es la Imagen de $X$. Este puede ser continuo o discreto.

Las VAs tienen dos funciones características, una llamada **función de masa de probabilidad**$(P_x(k))$, que mide la probabilidad individual de cada elemento, y luego esta **función de probabilidad** $(F_x(k) = P(X\leq k))$, que mide la probabilidad acumulada.

Tambien tienen funciones como el **valor esperado**, el **momento**, el **valor medio o media**, los **momentos centrales** y la **varianza**.

### Propiedades 

#### Función de Masa

1. $0\leq P_x(k)\leq1$
2. $\sum_{k\ \in\ R_x} P_x(k) = 1$

#### Función de Probabilidad

1. $\lim_{k\rightarrow -\inf} F_x(k) =  0$
2. $\lim_{k\rightarrow \inf} F_x(k) =  1$
3. $F_X(k)$ es monotona creciente.
4. $lim_{k\rightarrow k_0} F_X(k) = F_X(k_0)$
5. $P(A<X\leq B) = F_X(B) - F_X(A)$ 

## Variables Aleatorias Discretas

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

#### Aproximacion

- La variable aleatoria de bernoulli se puede aproximar a una binomial de la siguiente forma:

$$
Y\sim Bernoulli(p) \rightarrow\ Y\sim Binomial(1,p)
$$

## Variable Aleatoria Binomial

$$
X\sim Binomial(n,p)
$$

Se repite un experimento **n** veces, cada experimento es **independiente** de los demas y la probabilidad de exito en cada experimento es **p**.

- $x = \#\ de\ exitos\ en\ los~n~experimentos $.

- $P_k = P(x=k)=\begin{pmatrix} n\\k \end{pmatrix}\ .\ p^k\ .\ q^{n-k}$
- $\mu = n\ .\ p$
- $\sigma^2=q\ .\ n\ .\ p$

### Aproximacion

- La VAD binomial se aproxima a la VAD bernoulli de la siguente forma

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

### Aproximacion

- La VAD Poisson se puede aproximar a la VAD de binomial  de la siguiente forma cuando $n$ es **grande**, $p$ es **chico** y $k\sim p\ .\ n$ :

$$
Binomial(n,p) \sim Poisson(n\ .\ p)
$$













