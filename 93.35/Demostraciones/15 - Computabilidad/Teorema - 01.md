# Demostración

**Composición de funciones computables es computable**:

Sean $f:\N^k\rightarrow\N$, $g_1,\dots,g_k:\N^m\rightarrow \N$ todas funciones computables
$$
h:\N^m\rightarrow\N/h(x_1,x_2,\dots,x_m)=f_o(g_1,g_2,\dots,g_k) \text{ es computable}
$$

#### Demo

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