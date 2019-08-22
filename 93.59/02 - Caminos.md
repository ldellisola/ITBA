# Caminos

## Camino

Un camino desde el vertice $v_0$ al vertice $v_n$ es una secuencia alternada $w =< v_0,e_1,v_1,e_2,...,v_{n−1},e_n,v_n >$ de vertices y aristas donde $e_i = \{v_{i−1},v_i\}$ con $i = 1,...,n$ . Notacion: camino $v_0 −v_n$

### Camino Directo

Un camino directo en un digrafo de $v_0$ a $v_n$ es una secuencia alternada $w =< v_0,e_1,v_1,e_2,...,v_{n−1},e_n,v_n >$ de vertices y aristas donde $e_i = (v_{i−1},v_i)$ con $i = 1,...,n$. Notacion: camino directo $v_0 −v_n$

### Longitud

La longitud de un camino o camino directo es el nu´mero de aristas que recorre el camino.

### Camino Cerrado

Un camino o camino directo $x−y$ es cerrado si $x = y$ sino es abierto.

### Concatenacion

La concatenacion de dos caminos $w_1 =< v_0,e_1,v_1,e_2,...,v_{k−1},e_k,v_k >$ y $w_2 =< v_k,e_{k+1},v_{k+1},e_{k+2},...,v_{n−1},e_n,v_n >$ tal que $w_2$ empieza donde termina $w_1$ es el camino $w_1◦w_2 =< v_0,e_1,v_1,e_2,...,v_{n−1},e_n,v_n >$

### Subcamino

Un subcamino de $w =< v_0,e_1,v_1,e_2,...,v_{n−1},e_n,v_n >$ es una subsecuencia de entradas consecutivas $s =< v_j,e_{j+1},v_{j+1},e_{j+2},...,v_{k−1},e_k,v_k >$ con $0≤ j ≤ k ≤ n$ que comienza y termina en un vertice. Un subcamino es en sı mismo un camino.

### Vertice Alcanzable

Un vertice $v$ es alcanzable desde un vertice $u$ si $∃ $ un camino $u−v$.

### Distancia

En un grafo la distancia de $s$ a $t$ es la longitud del camino mas corto de $s$ a $t$ o inﬁnito si no hay camino. En los digrafos la distancia directa es el largo del camino directo mas corto. Notacion: $d(s,t)$.

### Reduccion de un camino

Dado un camino $w_1 =< v_0,e_1,v_1,e_2,...,v_{k−1},e_k,v_k >$ que contiene un subcamino cerrado $\overline w =< v_k,e_{k+1},v_{k+1},e_{k+2},...,v_{m−1},e_m,v_k >$ la reduccion de $w$ por $\overline w$ denotada por $w−\overline w$ es el camino $w−\overline w =< v_0,e_1,...,v_{k−1},e_k,v_k,e_{m+1},v_{m+1},...,v_{n−1},e_n,v_n >$, es decir que borra todas las aristas y vertices de $\overline w$ menos $v_k$

## Camino Simple (Path)

Es un camino que no repite vertices

### Camino Hamiltoniano

Es un camino simple (no ciclo) en el grafo que contiene todos sus vertices.

## Recorrido (Trail)

Es un camino que no repite aristas

### Recorrido Euleriano

Un recorrido euleriano en un grafo es un recorrido que contiene todas las aristas del grafo.

## Circuito (Closed Trail)

Es un recorrido cerrado.

### Circuito Euleriano

Un circuito euleriano es un recorrido euleriano cerrado.

### Grafo Euleriano

Es un grafo que tiene un circuito euleriano

## Ciclo (Cycle)

Es un camino simple cerrado.

### Coleccion de Ciclos de Aristas Disjuntas

Una coleccion de ciclos de aristas disjuntas $G_1,G_2,...,G_m$ es llamada una descomposicion de un circuito $T$ si los $G_i$ son subcaminos de $T$ y $E_T =\cup_m^1 E_{G_i}$ y $\cap_m^1 E_{G_i} =∅$

 ### Ciclo Hamiltoniano

Si $G$ es un grafo o multigrafo y $\#V ≥3 $ decimos que $G$ tiene un ciclo hamiltoniano si existe un ciclo en $G$ que contenga cada vertice de $V$ .

