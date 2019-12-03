# Demostración

Sea $G$ un grafo o multígrafo sin vértices asociados:
$$
G \text{ tiene un recorrido euleriano} \Leftrightarrow G \text{ tiene extactamente 2 vertices de grado impar y los demas pares}
$$

**Corolario del Teorema:**

Sea $G$ un grafo o multígrafo sin vértices aislados:
$$
G \text{ es un grafo euleriano } \Leftrightarrow \text{ todos los vertices tienen grado par}
$$

#### Demo

$\Leftarrow )$

Sea $a,b$ vértices de grado impar.

Agrego una arista $e=\{a,b\}$. Ahora tengo $H=G+e$ y $H$ tiene todos los vértices de grado par.

Entonces, por el teorema anterior,  $H$ tiene un circuito euleriano

Si a dicho circuito le quito $e$ y empiezo en $a$ y termino en $b$ obtuve un recorrido euleriano.



$\Rightarrow )$

$G$ tiene un recorrido euleriano, $C=<a,v_1,v_2,\dots,v_n,b>, v_i,a,b \in V_G$ los vértices pueden ser repetidos.

Sea $v\in V_G$

mirando al camino en cada $v_i$, cada vez que entro por una arista salgo por otra, esto suma 2 al grado del vértice $v_i$.

Con $a$ salgo por una arista, esto suma solo uno al vértice. De forma similar con $b$, entro por otra arista, dándole grado 1 al vértice.
$$
\therefore gr(a)=1~~~gr(b)=1~~gr(v_i)=2~ \forall v_i\in V_G-\{a,b\}
$$
