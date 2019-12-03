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

Quiero ver que $G-\{e\}$ es $(k-1)-conexo$, entonces si saco $k-2$ vertices del grafo, este seguira siendo conexo.

Tomamos $W \sub V_G$ de vertices $/\#W=k-2$. Si pruebo que $G-\{e\}\cup W$ es conexo, habre probado que $G-\{e\}$ es $(k-1)-conexo$  

- Caso $I$ : $a \in W$ o $b\in W$, entonces $G-W=G-\{e\}\cup W$ 

  Al sacar uno de los extremos desaparece la arista.

  $\Rightarrow$ Como $G$ es $k-conexo$, $G-W$ es conexo.

- Caso $II$:  $a,b \notin W$

  1. Busco la existencia del camino $u-v$ en caso de que alguno de los dos no es extremo de $e$.

     Supongo que $u \neq a$ y que $u\neq b$.

     Supongo que $v \neq b$

     Veamos que $G-W\cup \{b\}$ es conexo. Entonce en este grafo hay un camino $u-v$ que no contiene  a $e$ (Desaparecio al sacar a $b$).

     $\Rightarrow$ hay un camino $u-v$ en $G-W\cup\{e\}$

  2. Veamos que hay camino $a-b$, entonces, $(1) ~G-W\cup\{a\}$ y $(2)~G-W\cup\{b\}$ con conexos.

     En $(1)$ esta el vertice $b$ y otro vertice $z$ distinto de $b$ $\Rightarrow$ Por ser conexo $\exist$ un camino $b-z=L_1$ 

     En $(2)$ esta el vertice $a$ y otro vertice $z$ distinto de $a$ $\Rightarrow$ Por ser conexo $\exist$ un camino $z-a=L_2$

     $\Rightarrow$ $L_1L_2$ es un camino $a-b$ que no contiene a $e$.