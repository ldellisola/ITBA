# Demostración

Sea $G$ un grafo plano, conexo y bipartito, entonces:
$$
e \le 2 \times v - 4
$$

#### Demo

Sabemos que en un grafo bipartito:
$$
\array{ g(R_i) \ge 4 && (1)}
$$
Entonces si planteamos la sumatoria de grados de regiones
$$
\array{\sum_{\forall R_i} g(R_i) = 2 \times e && (2)}
$$
Por ultimo, mediante el  [Teorema de Euler](Teorema - 01.html), podemos decir:
$$
\array{ v-e+r = 2 && (3)}
$$
Igualando $(1)$ y $(2)$:
$$
\array{ 2 \times e \ge 4 \times r&& (4)}
$$
Luego, de $(3)$ y $(4)$ obtengo:
$$
2 \times e \ge 4 \times (2-v+e)\\
2 \times v - 4 \ge e
$$
