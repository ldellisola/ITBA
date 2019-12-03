# Demostración

La suma de los grados de los vértices de un grafo $G$ es par y es igual al $2\cdot \#E_G$:
$$
\sum_{i=1}^{n=\#V_G} g(v_i)=2 \cdot \#E_G
$$

#### Demo

Cada arista aporta:

- 2 unidades al $g(v_i)$ si es un lazo
- 2 unidades, una por el $g(v_i)$ y otra por el $g(v_j)$, si la arista es $e-\{v_i,v_j\}, i\neq j $

