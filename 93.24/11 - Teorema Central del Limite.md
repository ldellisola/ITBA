# Teorema Central del Limite

La distribución de probabilidades de una suma de variables aleatorias se parece a la distribucion Normal cuando crece el numero.

Sean $X_1,X_2,\dots,X_n$ VA continuas o discretas que tengan $\mu=E[x]$ y $\sigma^2=var(X_n)$

Hay dos formas de utilizarlo:

- Sea $\overline {X_n} = \frac 1 n \cdot \sum_{k=1}^n X_k$, con $E[\overline {X_n}] = \mu$ y $var[\overline {X_n}] = \frac {\sigma^2} n$, entonces

$$
P(\overline {X_n} \leq x) \sim \Phi \left( \frac {x-\mu} {\sigma/\sqrt n} \right)
$$

- Sea $S_n= \sum_{k=1}^n X_k$, con $E[S_n] = n\cdot\mu$ y $var[S_n] = n\cdot\sigma^2$, entonces

$$
P(S_n \leq s) \sim \Phi\left( \frac {s - \mu \cdot n}{\sigma \cdot \sqrt n}\right)
$$

### Ejemplo $S_n$

Sea $X_i$ el contenido de leche del tambor $i$, sea $S_n = \sum_{k=1}^n X_k$.

Si sabemos que el valor medio de los tambores es $\mu = 30,01$, que el desvío estándar de los tambores es $\sigma = 0.1$

1. **Cual es la probabilidad de que la cantidad total contenida en 50 tambores sea mayor a 1500 litros?**

Me piden la cantidad en 50 tambores, por lo que $n = 50$ y me dicen que tiene que ser mayor a 1500 litros, por lo que $s = 1500$.

Podemos sumar las variables aleatorias por ser independientes, por lo que nos queda
$$
S_{50} = \sum_{k=1}^{50} X_k
$$
con $E[S_{50}] = n \cdot \mu =50 \cdot 30.01 = 1500,5$ y $var[S_{50}] = n \cdot \sigma^2 =50 \cdot 0.01 = 0.5$.

Y como  $n$ es grande $(n \geq 30)$, puedo aplicar el Teorema Central del Limite:
$$
P(S_{50} > 1500 ) = 1- P(S_{50} \leq 1500) \sim 1 - \Phi \left( \frac {1500 - 1500.5} {\sqrt {0.5}} \right)= \Phi(\sqrt{0.5}) \sim0.76025
$$
$\therefore$ La probabilidad de que el total contenido en 50 tambores sea de 1500 litros es del  $76\%$.

2. **Si la cantidad total de solucion en el tanque es de 2041 litros, cual es la probabilidad de que puedan llenarse 80 tambores sin vaciar al tanque?**

Acá me piden la probabilidad de que 80 tambores $(n=80)$ puedan contener menos de 2041 litros  $(s = 2041)$ de solucion.

Entonces puedo sumar las 80 VA independientes:
$$
S_{80} = \sum_{k=1}^{80} X_k
$$
Con $E[S_{80}] = n \cdot \mu =80 \cdot 30.01 = 2400.8$ y $var[S_{80}] = n \cdot \sigma^2 =80 \cdot 0.01 = 0.8$.

Y como $n$ es grande, puedo utilizar el Teorema Central del Limite:
$$
P(S_{80}\leq 2041) \sim\Phi\left( \frac {2041 - 2040.8} {\sqrt{0.8}} \right) \sim 0.58847
$$
$\therefore$ Hay un $59\%$ de probabilidades de que pueda llenar 80 tambores con 2041 litros.

3. **Que cantidad de solucion debe contener el tanque para tener una probabilidad del $90\%$ de que puedan llenarse 100 tambores sin que se vacíe el tanque?**

Acá me piden el volumen del tanque $(s)$ para el cual tenga una probabilidad del $90\%$ de llenar 100 tambores $(n = 100)$.

Entonces puedo sumar las 100 VA independientes:
$$
S_{100} = \sum_{k=1}^{100} X_k
$$
Con $E[S_{100}] = n \cdot \mu =100 \cdot 30.01 = 3001$ y $var[S_{80}] = n \cdot \sigma^2 =100 \cdot 0.01 = 1$.

Y como $n$ es grande, puedo utilizar el Teorema Central del Limite:
$$
P(S_{100} \leq s) = 0.9\\
\Phi\left( \frac {s-3001} {\sqrt 1} \right) = 0.9\\
s-3001 = \Phi^{-1}(0.9) = 1.2816 \\
s = 3002.2816
$$
$\therefore$ El tanque tiene que contener $3002.28$ litros de solucion para poder llenar a 100 tambores con una probabilidad de $90\%$.

## Corrección por Continuidad

La corrección por continuidad sirve para convertir VAD en VAC para poder aplicar el Teorema Central del Limite. Gracias a esto podemos aproximar VA Binomiales a Normales.

Sea $X\sim Binomial(n,p)$ con $\mu = n \cdot p $ y $\sigma = n\cdot p \cdot (1-p)$, entonces:
$$
P(X = k) = P(k-0.5 \leq X \leq k+0.5) = \Phi\left( \frac {k+0.5- \mu} {\sigma} \right) - \Phi\left( \frac {k - 0.5 - \mu} {\sigma} \right)
$$

### Ejemplo

Una central telefónica A da servicio a **1800 usuarios** de una central cercana  B. Como seria costoso instalar 1800 líneas directas de A a B, se pueden instalar solo $k$ líneas de forma tal que solamente **1 de cada 100** llamadas en promedio no encuentre inmediatamente una línea tronca disponible. Supóngase que en la hora mas ocupada del día, cada usuario requiere una línea troncal de B **durante un promedio de 2 minutos.** En un momento fijo de la hora de máximo trafico, puede suponerse la situación como un conjunto de **1800 ensayos independientes** con una probabilidad $p = \frac 1 {30}$ (obtenida de 2 minutos en 60 minutos) en que cada uno requiere una línea. Determinar el numero $k$ de líneas a instalar entre A y B.

Como cada ensayo tiene una distribución de Bernoulli, se lo puede modelar de la siguiente forma:
$$
X_i \left\{
	\begin{array}{}
		1 & si~el~i-esimo~usuario~utilizo~la~linea\\
		0 & si~no~utiliza~la~linea.
	\end{array}
\right.
 \sim Bernoulli(1/30)
$$
Sea $S_{1800}$ el numero de usuarios que requieren una llamada.
$$
S_{1800} = \sum_{i=1}^{1800} X_i \sim Binomial(1800,1/30)
$$
Con $\mu = n \cdot p = 1800 \cdot 1/30 = 60$,  $\sigma = \sqrt{n \cdot p \cdot (1-p)} = \sqrt{59}$ 
$$
P(S_{1800} \gt k) = 0.01\\
1-P(S_{1800} \leq k) \sim 1- \Phi\left( \frac {n - 60} {\sqrt{59}} \right) \leq 0.01\\
0.01 - 1 \leq \Phi \left( \frac {n-60} {\sqrt{59}} \right) \\
\Phi^{-1}(-0.99) \leq  \frac{n-60}{\sqrt{59}}	\\
n \geq 77.71 \rightarrow n = 78
$$















































