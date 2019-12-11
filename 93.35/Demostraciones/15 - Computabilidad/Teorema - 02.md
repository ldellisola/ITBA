# Demostración

$$
\text{A partir de la definición de $\bold {ERI}$, podemos decir que si $g$ es computable, entonces $f$ es computable.}
$$

#### Demo

Como $g$ es computable, puedo utilizarla como macro en un programa de lenguaje S:

```
		Y <- k
[B1]	IF Y!=0 GOTO A1
		GOTO E1
[A1]	Y <- g(Z1,Y)
		Z1 <- Z1 + 1
		X1 <- X1 - 1
		GOTO B1
```

