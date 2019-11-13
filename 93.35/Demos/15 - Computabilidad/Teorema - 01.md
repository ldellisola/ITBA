## Composición de funciones computables es computable

Como $f$ y $g$ son computables $i\leq j \leq k$, existen programas $P_f,P_{g_i}$ que computan a dichas funciones.

Gracias a esto puedo usar macros para representar a dichas secuencias de instrucciones:

```
Z1 <- g1(X1, ..., Xn)
Z2 <- g2(X1, ..., Xn)
...
Zk <- gk(X1, ..., Xn)
Y <- f(Z1, Z2, ..., Zk)
```

Entonces, como puedo hacer un programa que compute a la función $h$, esta es computable.