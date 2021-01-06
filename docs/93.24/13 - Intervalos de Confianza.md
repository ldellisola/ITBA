# Intervalos de Confianza

## Intervalos de confianza Bilaterales

Sea $X_i \sim N(\mu,\sigma)$, con $\mu$ desconocida. Y sea $\hat\mu = \frac 1 n \cdot \sum_{i=1}^{n} X_i = \overline {X_n}$.

Se define al intervalo de confianza bilateral como:
$$
[L(X_1,X_2,\dots,X_n);H(X_1,X_2,\dots,X_n)]/ P(\mu \in [L,H]) = P(L\leq \mu \leq H) = c
$$
Siendo $[L,H]$ el **intervalo de confianza**, con $L = \overline {X_n} - \Delta c$, $H = \overline {X_n} + \Delta c$ y $c$ es la **confianza**.

Entonces puedo describir al estimador $\hat\mu = \overline {X_n} \sim N(\mu,\frac \sigma {\sqrt n})$ 

Y puedo calcular el valor de  $\Delta c$:
$$
P(L\lt \mu \lt H) = c\\
P(\hat\mu - \Delta c \lt \mu \lt \hat\mu + \Delta c)=c \\
P(-\Delta c \lt \mu - \hat\mu\lt \Delta c)=c\\
\Phi\left( \frac {\Delta c} {\sigma /\sqrt n} \right) - \Phi\left( \frac {-\Delta c} {\sigma /\sqrt n} \right) = c\\
2 \cdot\Phi\left( \frac {\Delta c} {\sigma /\sqrt n} \right) -1 = c\\
\Delta c = \Phi^{-1}\left( \frac {c+1} {2} \right)\cdot \frac \sigma {\sqrt n}
$$

## Intervalos de Confianza Unilaterales

Sea $X_i \sim N(\mu,\sigma)$, con $\mu$ desconocida. Y sea $\hat\mu = \frac 1 n \cdot \sum_{i=1}^{n} X_i = \overline {X_n}$.

Se define al intervalo de confianza unilateral como:
$$
[L(X_1,X_2,\dots,X_n);+\infty] / P(\mu\in[L,+\infty]) = P(L\leq \mu\leq \infty) = c
$$
Siendo $[L,\infty]$ el **intervalo de confianza**, con $L = \overline {X_n} - \Delta c$ y $c$ es la **confianza**.

Entonces puedo describir al estimador $\hat\mu = \overline {X_n} \sim N(\mu,\frac \sigma {\sqrt n})$ 
$$
P(L\lt \mu \lt \infty) =P(L\lt \mu) = c\\
P(\hat\mu - \Delta c \lt \mu) = c\\
P(\hat\mu \lt \mu +\Delta c) = c\\
\Phi\left(\frac{\Delta c} {\sigma / \sqrt n}\right) = c\\
\Delta c = \Phi^{-1}(c) \cdot \frac \sigma {\sqrt{n}}
$$
De forma similar se puede utilizar el intervalo de confianza positivo, tal que :
$$
[-\infty,\overline {X_n} + \Delta c]
$$

## Generalización a VA no Normales

Hasta ahora vimos como todos los intervalos de Confianza se podían hacer solo con VA normales, pero mediante el [Teorema Central del Limite](11 - Teorema Central del Limite.html), podemos utilizar cualquier tipo de VA.

Sea $X_i$ no necesariamente Normal, con $\mu = E[X_i]$  y $\sigma^2 = var(X_i)$, entonces aproximo con el TCL:
$$
\hat\mu = \overline {X_n} \sim N(\mu, \sigma / \sqrt n)
$$

## Proporción de una Población

Sea:
$$
X_i \sim Bernoulli(p) = 
\left\{
	\begin{array}{}
	1	&	Si~tiene~la~poblacion\\
    0	&	No~la~tiene
	\end{array}
	
	
\right.
$$
con $p$ desconocido.

Puedo definir a la muestra como:
$$
S_n = \sum_{i=1}^n X_i \sim Binomial(n,p)
$$
Y mi estimador $\hat p$ es:
$$
\hat p = \overline {X_n} = \frac 1 n \cdot S_n \sim N\left(n,\sqrt \frac{p\cdot(1-p)}{n}\right)
$$
Y tambien puedo decir que para $n\gt 100$, puedo reemplazar el valor $p$ desconocido por mi estimador $\hat p$:
$$
\sqrt{\frac{\hat p \cdot (1- \hat p)}{n}} \sim \sqrt{\frac{ p \cdot (1- p)}{n}}
$$
Entonces, puedo calcular los intervalos de confianza de la siguente forma:

- Bilateral:

$$
\left[\hat p - \overline{X_n} \cdot \sqrt{\frac{\hat p \cdot (1- \hat p)}{n}}; \hat p + \overline {X_n} \cdot \sqrt{\frac{\hat p \cdot (1- \hat p)}{n}} \right]
$$

- Unilateral:

$$
\left[ \hat p - \overline{X_n}\cdot \sqrt{\frac{\hat p \cdot (1- \hat p)}{n}}~;~1\right] \\
\left[0~;~ \hat p + \overline{X_n}\cdot \sqrt{\frac{\hat p \cdot (1- \hat p)}{n}}\right]
$$

## Intervalos de Confianza con $\sigma$ Desconocida

Sea $X_i \sim N(\mu,\sigma)$ con $\sigma$ desconocido.

Usando un estadístico _Pivot_ puedo decir que :
$$
T = \frac {\overline {X_n} - \mu} {s/\sqrt n}
$$
con $s$ proviene de la varianza muestral ($s^2$).

De aquí obtengo que $T$ tiene una distribución **Student** con $n-1$ grados de libertad:
$$
T \sim t_{n-1}
$$
Con $E[t_{n-1}] = 0$ y $var(t_{n-1}) = \frac {n-1}{n-3}$ 

Y si vuelvo a calcular el intervalo de confianza:
$$
P(L\lt \mu \lt H) = c\\
P(\overline{X_n} - H \lt \overline{X_n} - \mu \lt \overline{X_n}-L) = c\\
P\left(\frac{\overline{X_n} - H }{S/\sqrt n} \lt\frac{\overline{X_n} - \mu }{S/\sqrt n} \lt \frac{\overline{X_n} - L }{S/\sqrt n}\right) = c\\
2\cdot P\left( \frac{\overline{X_n} - \mu }{S/\sqrt n} \lt\Delta c \right) - 1 = c\\
\therefore ~~t_{n-1,\frac {1+c} 2} = \Delta c
$$
Siendo $t_{n-1,\frac {1+c} 2}$ la inversa de la distribución Student. Se calcula con una [tabla](Resources/TablaStudentInversa.pdf) o con la calculadora.

Luego de calcular $\Delta c$, podemos ver como serian los Intervalos de Confianza:

- Bilateral:

$$
\left[\overline{X_n} - t_{n-1,\frac{1+c} 2} \cdot \frac S{\sqrt n}~;~ \overline{X_n} + t_{n-1,\frac{1+c} 2} \cdot \frac S{\sqrt n}  \right]
$$

- Unilateral:

$$
\left[-\infty~;~ \overline{X_n} + t_{n-1,\frac{1+c} 2} \cdot \frac S{\sqrt n}  \right]\\
\left[\overline{X_n} - t_{n-1,\frac{1+c} 2} \cdot \frac S{\sqrt n}~;~ \infty \right]
$$

























