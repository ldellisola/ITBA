# Demostración

Todo arbol con al menos una arista tiene por lo menos 2 vertices de grado 1.

#### Demo

Tomamos en el arbol al camino $v_1-v_q$ mas largo y vemos que $g(v_1) = g(v_q) = 1$. 

Si $g(v_1) > 1$, entonces $v_1$ tendria a otro vertice adyacente $u$ ademas de a $v_2$, entonces $v_1-v_q$ no seria el camino mas largo $(\array {u \neq v_i&3\le i \le q})$.

Si $u$ fuera alguno de los vertices del camino $v_1-v_q$ habria un ciclo, que seria **ABS!**, por que no seria un árbol.

Si $v_q$ fuera alguno de los vertices del camino $v_1-v_q$ habria un ciclo, que seria **ABS!**, por que no seria un árbol.

