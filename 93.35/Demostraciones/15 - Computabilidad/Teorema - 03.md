# Demostración

$$
\text{A partir de la definición de $\bold{ERII}$, podemos decir que $g$ y $h$ son computables, entonces $f$ es computable.}
$$

#### Demo

Como $g$ y $h$ son computables, entonces existen programas $P_g$ y $P_h$ que los computan, por lo que puedo hacer un programa en lenguaje S para computar a $f$:

```
		Y <- h(X1, ..., Xk)
[B1]	IF Xk!=0 GOT0 A1
		GOTO E1
[A1]	Y <- g(X1, ..., Xk,Z1,Y)
		Z1 <- Z1 + 1
		Xk+1 <- Xk+1 - 1
		GOTO B1
```

