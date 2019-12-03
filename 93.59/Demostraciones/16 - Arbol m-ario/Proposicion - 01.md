# Demostración

$$
\text{Un árbol m-ario tiene como mucho $m^k$ vertices en el nivel $k$.}
$$

#### Demo

Lo voy a probar por inducción. 

- Caso base:

  $k=0$, entonces tiene 0 niveles y en el nivel 0 tiene $m^0=1$ elemento, la raiz.

- Hipotesis Inductiva:

  Si $k=n$ entonces un árbol m-ario tiene como mucho $m^n$ en el nivel $n$.

- Tesis Inductiva:

  Si $k=n+1$, entonces un árbol m-ario tiene como mucho $m^{n+1}$ elementos en el nivel $n+1$.

Cada vertice del nivel $k$ tiene $m$ hijos, entonces en el nivel $k+1$ habra como mucho $m^k \times m$ hijos, es decir $m^{k+1}$.