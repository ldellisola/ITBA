# Procesos Estocásticos

### Definición

Es un sistema $(X)$ que esta formado por muchas variables aleatorias $(X(t))$.

$T$ es el espacio al que pertenece el parámetro.

El recorrido $(E)$ del proceso es la unión de los recorridos de las variables $X(t)$ 
$$
X=\{X(t):t\in T\}
$$
Para poder utilizar la definición, es requisito que las probabilidades conjuntas de cualquier numero finito $n$  de variables aleatorias $(X(t_1),X(t_2),\dots,X(t_n))$deben estar **determinadas**.



### Proceso Estocástico Estacionario

Son los procesos estocásticos que no dependen del tiempo.

Un proceso no es estocástico $\Leftrightarrow~~P(X(1)=0\neq P(X(0)=0)=1~~\Leftrightarrow~~P(X(2)=0,Y(1)=1)=p~.~q\neq P(X(1)=0,X(0)=1)=0$
$$
\mu~es~costante~~,~~\sigma~es~constante
$$

### Procesos de Conteo

Un proceso estocástico $N(t)$ es de conteo $\Leftrightarrow $ se cumplen:

1. $N(0)=0$
2. $N(t)\geq0~~~~\forall~t\geq0$
3. $s<t \Rightarrow~N(s)\leq N(t)$
4. $E=\N^0$
5. $N(t)-N(s)$ representa el numero de eventos que ocurrieron después de $s$ y antes de $t$.

 

## Procesos de Márkov

Un proceso de Márkov es **procesos estocásticos** para cual todo **n**, toda secuencia $t_1,t_2,\dots,t_n$ y para todo $X$ vale:
$$
P(X(t_n)\leq x~|~X(t_{n-1}),\dots,X(t_1)) = P(X(t_n)\leq x~|~X(t_{n-1}))
$$
Es decir, para averiguar sobre el estado actúa solo es necesario saber sobre el estado anterior.

### Ecuación de Chapman-Kolmogorov

$$
P(X(n)=z~|~X(n-2)=z)=p\times q + q\times p
$$

Forma Generalizada:
$$
P(X(n)=z~|~X(n-2)=z)=\sum_{y\in R_X(n-m)}P(X(n)=x~|~X(n-m)= y~|~X(n-k)=z)
$$

## Proceso de Poisson

Los procesos de poisson son procesos de conteo en tiempo continuo, que avanzan en incrementos estacionarios e independientes y es casi imposible que hayan 2 eventos o mas en un intervalo. La probabilidad de que un evento suceda es $\lambda\ .\ h$.
$$
p_n(t)=P(N(t)=n)=\frac{(\lambda\ .\ t)^n}{n!}\ .\ e^{-\lambda\ .\ t}\\
N(t)\sim Poisson(\lambda\ .\ t)
$$
Para calcular la cantidad de eventos entre 2 puntos en el tiempo $(t_1,t_2)$:
$$
M = N(t_1)-N(t_2)\sim Poisson(\lambda\ .\ (t_2-t_1))
$$
Para calcular la cantidad de eventos hasta un tiempo $x$:
$$
P(t_k\leq x)=1-e^{-\lambda\ .\ x}
$$


















