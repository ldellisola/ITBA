# Conexidad

Un grafo es conexo si $∀ \text{ par de vertices } u \text{ y } v \text{ hay un camino } u−v$.

## Digrafo Conexo

Un digrafo puede ser al mismo tiempo fuerte y debilmente conexo. Por ejempo, todo grafo fuertemente conexo va a ser debilmente conexo

### Debilmente Conexo

Un digrafo es debilmente conexo si al considerarlo no dirigido es conexo.

### Fuertemente Conexo

Un digrafo es fuertemente conexo si todo par de vertices en el digrafo es mutuamente alcanzable. Dos vertices $u$ y $v$ son mutuamente alcanzables si existen en el digrafo un camino directo $u−v$ y un camino directo $v−u$.

## Componentes

Se llama componente de un grafo a un subgrafo conexo maximal del grafo $G$. Es decir, un subgrafo es maximal si no es un subgrafo propio de otro subgrafo de $G$.

Por ejemplo, tanto el subgrafo formado por los vertices $C_1=\{A,B,C\}$, o por $C_2=\{D,E\}$, o por $C_3=\{F\}$ son todos componentes.

![1567422862367](Resources/1567422862367.png)

En el grafo $G$, la componente 1 ($C_1$) tambien se puede llamar como $C(A)=C(B)=C(C)$.

Si definimos la relacion $v_iRv_j$ ==__PEDIR__==

$R$ es de equivalencia. Cada clase de equivalencia contiene a todos los vertices de una componente de $G$.

### Observaciones

Si $G$ es conexo, tiene solo una componente.

## Vertice de Corte

Tambien llamado punto de articulacion, es un vertice que al removerlo, se generan mas componentes. Si $v$ es es vertice de corte y $G$ es un grafo, entonces la cantidad de componentes conexas de $G$ es menor a $G-\{v\}$.

Se denomina $\scr{K}$ $(G)$ a la cantidad de componentes de $G$.

![1567423331727](Resources/1567423331727.png)

En este caso, se puede ver que el vértice $F$ y $E$ son vértices de corte ya que si los remuevo genero nuevos subgrafos

### Proposiciones

$$
v\in V_G \text{ es vertice de corte de }G \\ \Leftrightarrow \\\exist \mu,v,w \in V_G/ \mu \neq v, v \neq w, \mu \neq w \text{ tal que todo camino de } \mu-w \text{ pasa por } v
$$

 [Demostración](Demostraciones\03 - Conexidad\Proposicion - 01.html) ==FINAL==

## Aristas de corte o Puente

$e$ es una arista de corte si: $\scr{K}$ $(G-\{e\}) \gt$ $\scr{K}$ $(G)$

![1567424425647](Resources/1567424425647.png)

La arista marcada con un $1$ es una arista de corte, ya que al eliminarla obtengo 2 componentes.

### Observaciones

Si $v$ es de corte  $\scr{K}$ $(G-\{v\}) \gt$ $\scr{K}$ $(G)$ no sabemos por cuanto difieren.

Si $e$ es de corte  $\scr{K}$ $(G-\{e\}) =$ $\scr{K}$ $(G)+1$

Si la arista $e=\{a,b\}$ es de corte y el $gr(a)\gt 1 \Rightarrow a$ es de corte.

### Proposiciones

Sea $G$ conexo:
$$
e\in E_G \text{ es arista de corte } \Leftrightarrow e \text{ no pertenece a un ciclo en }G
$$

 [Demostración](Demostraciones\03 - Conexidad\Proposicion - 02.html) 

 ## Conexidad por Vertices

Es la minima cantidad de vertices que hay que remover del grafo para que deje de ser conexo <u>o se transforme en el grafo trivial</u>.

Notacion $K_v(G)$

### Ejemplos

![1567426095801](Resources/1567426095801.png)

$K_v(G)=2$, siendo los vertices de corte $C,D,E,F$. Eliminando 2 de esos vertices se obtienen 2 componentes.

Para Grafos $K_n$: $K_v(K_n)=n-1$

### Observaciones

Si $G$ tiene vertice de corte $\Rightarrow K_v(G)=1$

Si $G$ no es conexo, decimos que $K_v(G)=0$

## Grafo $k-conexo$ 

Si $k \leq K_v(G) \Rightarrow$ decimos que $G$ es $k-conexo$.

### Ejemplos

Si tomo al grafo $K_4$ , veo que $K_v(K_4)=3$, entonces puedo decir que es $conexo$, $2-conexo$ y $3-conexo$ 

### Proposicion

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

 [Demostración](Demostraciones\03 - Conexidad\Proposicion - 03.html) 

#### Corolario

Sea que $G~k-conexo$ y sea $M$ un conjunto de aristas $M\sub E_G/ \#M = m \le k-1$ 

$\Rightarrow G-M$ es conexo.

### Proposicion ==FINAL==

la relacion entre $K_e(G)$ y $K_v(G)$.

$$
k \le K_v(G)\le K_e(G) \le \delta
$$

 [Demostración](Demostraciones\03 - Conexidad\Proposicion - 04.html) 

## Conexidad por aristas 

Es la minima cantidad de aristas que hay que remover del grafo para que deje de ser conexo.

Notacion $K_e(G)$

### Observaciones

Sea $\delta_{min}=min\{v_i\}$, entonces  $K_e(G)\leq \delta_{min}$. Basta tomar las aristas incidentes en el tiene de grado minimo para que el grafo deje de ser conexo.

## Grafo $k-arista~conexo$

Si $k \leq K_e(G)$ podemos decir que $G$ es $k-arista~conexo$.

## Vertice Interno

Dado un camino $u-v$ en $G$, un vertice interno del camino es un vertice $w/w\neq u \and w \neq v$.

## Coleccion de Caminos Internamente Disjuntos (CCID)

Una CCID $u-v$ es una coleccion de caminos $u-v$ tales que ningun camino contiene vertices internos de otros caminos en la coleccion.

### Ejemplo

<img src="Resources/1567429128678.png" alt="1567429223658" style="zoom:50%;" />

La CCID $A-D$ contiene 3 caminos disjuntos.

<img src="Resources/1567429223658.png" alt="1567429223658" style="zoom:50%;" />

En este caso los 3 caminos no son internamente disjuntos pero sin <u>disjuntos por aristas</u>. 

## Particion por Corte de Aristas

Sean $V_1 \sub V_G \and V_2 \sub V_G/V_1\cap V_2 = \empty \and V_1 \cup V_2 = V_G$
$$
<V_1,V_2>=\{

	e\in E_G / e=\{v_1,v_2\} \text{ con } v_1 \in V_1 \and v_2 \in V2

\}
$$
Es decir, el conjunto $<V_2,V_2>$ es el conjunto de aristas que empiezan en algun vertice de $V_1$ y terminan en algun vertice de $V_2$ o viceversa.

### Observacion

Para cualquier particion de $V_G$, se cumple que $\#<V_1,V_2> \geq K_e(G)$

