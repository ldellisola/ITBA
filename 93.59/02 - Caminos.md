# Caminos

## Camino

Un camino desde el vértice $v_0$ al vértice $v_n$ es una secuencia alternada $w =< v_0,e_1,v_1,e_2,...,v_{n−1},e_n,v_n >$ de vértices y aristas donde $e_i = \{v_{i−1},v_i\}$ con $i = 1,...,n$ . Notación: camino $v_0 −v_n$

### Camino Directo

Un camino directo en un dígrafo de $v_0$ a $v_n$ es una secuencia alternada $w =< v_0,e_1,v_1,e_2,...,v_{n−1},e_n,v_n >$ de vértices y aristas donde $e_i = (v_{i−1},v_i)$ con $i = 1,...,n$. Notación: camino directo $v_0 −v_n$

### Longitud

La longitud de un camino o camino directo es el numero de aristas que recorre el camino.

### Camino Cerrado

Un camino o camino directo $x−y$ es cerrado si $x = y$ sino es abierto.

### Concatenación

La concatenación de dos caminos $w_1 =< v_0,e_1,v_1,e_2,...,v_{k−1},e_k,v_k >$ y $w_2 =< v_k,e_{k+1},v_{k+1},e_{k+2},...,v_{n−1},e_n,v_n >$ tal que $w_2$ empieza donde termina $w_1$ es el camino $w_1◦w_2 =< v_0,e_1,v_1,e_2,...,v_{n−1},e_n,v_n >$

### Subcamino

Un subcamino de $w =< v_0,e_1,v_1,e_2,...,v_{n−1},e_n,v_n >$ es una subsecuencia de entradas consecutivas $s =< v_j,e_{j+1},v_{j+1},e_{j+2},...,v_{k−1},e_k,v_k >$ con $0≤ j ≤ k ≤ n$ que comienza y termina en un vértice. Un subcamino es en sı mismo un camino.

### Vértice Alcanzable

Un vértice $v$ es alcanzable desde un vértice $u$ si $∃ $ un camino $u−v$.

### Distancia

En un grafo la distancia de $s$ a $t$ es la longitud del camino mas corto de $s$ a $t$ o inﬁnito si no hay camino. En los dígrafos la distancia directa es el largo del camino directo mas corto. Notación: $d(s,t)$.

### Reducción de un camino

Dado un camino $w_1 =< v_0,e_1,v_1,e_2,...,v_{k−1},e_k,v_k >$ que contiene un subcamino cerrado $\overline w =< v_k,e_{k+1},v_{k+1},e_{k+2},...,v_{m−1},e_m,v_k >$ la reducción de $w$ por $\overline w$ denotada por $w−\overline w$ es el camino $w−\overline w =< v_0,e_1,...,v_{k−1},e_k,v_k,e_{m+1},v_{m+1},...,v_{n−1},e_n,v_n >$, es decir que borra todas las aristas y vértices de $\overline w$ menos $v_k$

## Camino Simple (Path)

Es un camino que no repite vertices

### Adicion de un Camino Simple

Adicionar un camino simple entre $x$ e $y$ es agregar un camino $x-y$ al grafo $G$ cuyos vertices internos no esten en $G$

<img src="Resources/clip_image001-1568030408265.png" alt="img" style="zoom:33%;" />

### Camino Hamiltoniano

Es un camino simple (no ciclo) en el grafo que contiene todos sus vértices.

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

#### Teorema

Sea $G$ un grafo o multígrafo sin vértices aislados:
$$
G \text{ es un grafo euleriano } \Leftrightarrow \text{ todos los vertices tienen grado par}
$$

- Demostracion (Idea):

  - Vuelta) Por induccion sobre la cantidad de aristas
  - Ida) Directo

- Corolario:

  Sea $G$ un grafo o multígrafo sin vértices asociados:
  $$
  G \text{ tiene un recorrido euleriano} \Leftrightarrow G \text{ tiene extactamente 2 vertices de grado impar y los demas pares}
  $$

  - Demostración:

    - Vuelta:

      Sea $a,b$ vértices de grado impar.

      Agrego una arista $e=\{a,b\}$. Ahora tengo $H=G+e$ y $H$ tiene todos los vértices de grado par.

      Entonces, por el teorema anterior,  $H$ tiene un circuito euleriano

      Si a dicho circuito le quito $e$ y empiezo en $a$ y termino en $b$ obtuve un recorrido euleriano.

    - Ida:

      $G$ tiene un recorrido euleriano, $C=<a,v_1,v_2,\dots,v_n,b>, v_i,a,b \in V_G$ los vértices pueden ser repetidos.

      Sea $v\in V_G$

      mirando al camino en cada $v_i$, cada vez que entro por una arista salgo por otra, esto suma 2 al grado del vértice $v_i$.

      Con $a$ salgo por una arista, esto suma solo uno al vértice. De forma similar con $b$, entro por otra arista, dándole grado 1 al vértice.
      $$
      \therefore gr(a)=1~~~gr(b)=1~~gr(v_i)=2~ \forall v_i\in V_G-\{a,b\}
      $$

## Ciclo (Cycle)

Es un camino simple cerrado.

### Colección de Ciclos de Aristas Disjuntas

Una colección de ciclos de aristas disjuntas $G_1,G_2,...,G_m$ es llamada una descomposición de un circuito $T$ si los $G_i$ son subcaminos de $T$ y $E_T =\cup_m^1 E_{G_i}$ y $\cap_m^1 E_{G_i} =∅$

 ### Ciclo Hamiltoniano

Si $G$ es un grafo o multígrafo y $\#V ≥3 $ decimos que $G$ tiene un ciclo hamiltoniano si existe un ciclo en $G$ que contenga cada vértice de $V$.

