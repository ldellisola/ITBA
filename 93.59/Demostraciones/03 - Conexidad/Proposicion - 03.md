# Demostración

Sea $G~k-conexo$ con $k\ge 3 \Rightarrow G-\{e\}$ es $(k-1)-conexo~~~~ \forall e \in E_G $

<u>Analisis de la Hipotesis:</u>

Sea $G~k-conexo $ 

- Si saco $q \lt k$ vertices, el grafo no se desconecta.
- $K_v(G)\ge k$
- $\#V_G \ge k+1$

<u>Tesis:</u>

Sea $G-\{e\} ~(k-1)-conexo$ 

- Si saco $q' < k-1$ vertices, el grafo se desconecta.
- $K_v(G) \ge k-1$
- $\#V_{G-\{e\}} = \#V_G$

#### Demo

Sea $W \subset V_{G-\{e\}}/ \#W = k-2$. Ademas, sean $x,y \in V_{G-\{e\}-W}$. 

Solo tenemos que probar la existencia de un camino $\{x,y\}$ en $G-\{e\}-W$

- Primero suponemos que al menos uno de los vertices de la arista $e$ pertenece al conjunto $W$. 

  Como el subgrafo $G-W$ es conexo  ($2-conexo$), entonces existe un camino $\{x,y\}$ en $G-W$ tal que no contiene a la arista $e$, por lo que el camino $\{x,y\}$ esta en el subgrafo $G-\{e\}-W$.

- Por otro lado, suponemos que ninguno de los extremos de la arista $e$ pertenecen al conjunto $W$, por lo que tenemos 2 casos:

  1. Sean los vertices $x,y$ los extremos de $e$, el grafo $G$ tiene al menos $(k+1)$ vertices, ya que $G$ es $k-conexo$.

     Entonces existe un vertice $z \in V_{G}-W-\{x,y\}$, como $G$ es $k-conexo$, entonces existe un camino $\{x,z\} = p_1$ en el subgrafo $G-\{w_1,\dots,x_{k-2},y\}$. Ademas,  existe un camino $\{z,y\}=p_2$ en el subgrafo $G-\{w_1,\dots,w_{k-2},x\}$.

     Ninguno de estos caminos contienen a la arista $e$, entonces la concatenacion de $p_1$ y $p_2$ es $\{x,y\}$, que pertenece al subgrafo $G-\{e\}-W$.

  2. Al menos uno de los vertices $x,y$ no es un extremo de  la arista $e$. Voy a tomar que el vertice $x$ no es extremo de la arista $e$.

     Sea $u$ el otro extremo de la arista $e$, como el grafo $G$ es $k-conexo$, el subgrafo $G-W-\{u\}$ es conexo.

     Entonces, existe un camino $\{x,y\}=p$ en el subgrafo $G-W-\{u\}$. Luego, el camino $p$ en $G-W$ no contiene al vertice $u$, entonces excluye a la arista $e$.

     De esta forma $p$ es un camino $\{x,y\}$ en $G-\{e\}-W $.

