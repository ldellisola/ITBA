# Demostración

Sea $T$ un árbol m-ario con n vertices y altura $h$:
$$
h+1 \le n\le \frac{m^{h+1}-1}{m-1}
$$
#### Demo

Sea $T$ m-ario, con $n$ vertices y altura $h$, sabemos que:
$$
n=\sum n_i
$$
Para cada nivel del árbol.

La cantidad de vertices en el nivel $i$ es:
$$
1 \le n_i \le m^i\\
\sum_{i=0}^h1 \le \sum_{i=0}^h n_i \le \sum_{i=0}^{h} m^i\\
h+2 \le n \le \frac{m^{h+1}-1}{m-1}
$$
