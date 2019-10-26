# Arboles

Hay muchas definiciones de arboles, la primera que vamos a tomar es que un **arbol** es un grafo conexo que no tiene ciclos. Por ejemplo, aca tenemos 3 arboles distintos:

<img src="Resources/1571656129684.png" alt="1571656129684" style="zoom:33%;" />

Un **bosque** es un conjunto de arboles. Es un grafo no conexo donde los componentes son arboles.

## Definiciones

- **Arbol**: Grafo conexo que no tiene ciclos.
- **Arista Ciclo**: Sea $e$ una arista de un grafo $G$, esta se llama arista ciclo si existe en $G$ un ciclo que la contiene.
- **Bosque**: Es un grafo no conexo donde los componentes son arboles.

## Teoremas

- Equivalencias entre la definicion de arbol. ==FINAL==

  Sea $T$ un grafo con $n$ vertices sin lazos, entonces las siguentes afirmaciones son equivalentes:

  1. $T$ es un arbol.
  2. $T$ no contiene ciclos y tiene $(n-1)$ aristas.
  3. $T$ es conexo y tiene $(n-1)$ aristas.
  4. $T$ es conexo y toda arista es una arista de corte.
  5. Todo par de vertices de $T$ estan conectados por exactamente un camino simple.
  6. $T$ no contiene ciclos y $T+\{e\}$ tiene exactamente un ciclo.

  [Demostración](#Equivalencias de la definicion de Arbol)

- Sea $T$ un arbol con $n$ vertices y sea $G$ un grafo simple tal que el $\delta_{min}(G) \ge (n-1) \Rightarrow T$ es un subgrafo de $G$.

  [Demostración](#Teorema 2)

## Proposiciones

- Sea $e$ una arista en un grafo conexo $G$:

  ​										es conexo $\Leftrightarrow e$ es una arista ciclo de $G$.

  [Demostración](#Proposicion 1)

  Esta proposicion tiene 2 corolarios

  1. Una arista de un grafo es una arista de corte $\Leftrightarrow$ no es una arista ciclo.

     [Demostración](#Proposicion 1 Corolario 1)

  2. Sea $e$ cualquier arista de  $G$, entonces $\chi(G-\{e\}) = \left\{\array{\chi(G) &e \text{ es una arista ciclo}\\\chi(G)+1 & \text{else}}\right.$

     [Demostración](#Proposicion 1 Corolario 1)

- Todo arbol con al menos una arista tiene por lo menos 2 vertices de grado 1.

  [Demostración](#Proposicion 2)

  Esta proposicion tiene un corolario:

  1. Si $g(v_i) \ge 2~\forall v_i\in V_G \Rightarrow$ el grafo debe contener al menos un ciclo.

- Todo arbol con $n$ vertices tiene $n-1$ aristas.

  [Demostración](#Proposicion 3)

- Todo arbol con $n$ vertices tiene exactamente $n-1$ aristas.

  Esta proposicion tiene 2 corolarios:

  1. Todo bosque con $n$ vertices tiene $n-\chi(F)$ aristas
  2. Un grafo $G$ con $n$ vertices tiene por lo menos $n-\chi(G)$ aristas.

- Sea $G$ un grafo simple con $n$ vertices y $k$ componentes $\Rightarrow$ la cantidad de aristas es :
  $$
  \#E_G \le \frac{(n-k)(n-k+1)}{2}
  $$
  Esta proposicion tiene 1 corolario:

  1. Un grafo simple con $n$ vertices y mas de $\frac{(n-1)(n-2)}{2}$ aristas, debe ser conexo.

## Demostraciones

#### Proposicion 1

Primero demuestro la <u>ida</u>. 

Sea $e=\{a,b\}$, queremos probar que si $G-\{e\}$ es conexo $\Rightarrow \exist $ un camino en $G-\{e\}$ entre $a$ y $b$.

Hay un camino simple $a-b$, dicho camino es ==PREGUNTAR== (concatenado) con $a-e-b$. De esta forma, la arista $e$ y sus extremos forman un  ciclo en $G$, por lo que $e$ es una arista ciclo.

Ahora demuestro la <u>vuelta</u>.

Si $e=\{a,b\}$ es una arista ciclo en $G \Rightarrow$ en $G-\{e\}$ todo par de vertices esta unido por al menos un camino ($G$ es conexo) pues $a$ y $b$ siguen unidos por el resto del ciclo que queda al sacar $e$.

#### Proposicion 2

Tomamos en el arbol al camino $v_1-v_q$ mas largo y vemos que $g(v_1) = g(v_q) = 1$. 

Si $g(v_1) > 1$, entonces $v_1$ tendria a otro vertice adyacente $u$ ademas de a $v_2$, entonces $v_1-v_q$ no seria el camino mas largo $(\array {u \neq v_i&3\le i \le q})$.

Si $u$ fuera alguno de los vertices del camino $v_1-v_q$ habria un ciclo, que seria ABS, por que no serua un grafo.

Si $v_q$ fuera alguno de los vertices del camino $v_1-v_q$ habria un ciclo, que seria ABS, por que no serua un grafo.

#### Proposicion 3

Todo arbol es conexo, y como no tiene ciclos es plano, por lo que vale la formula de euler.

Como no hay ciclos, podemos tomar que solo existe una region $(R_\infty)$:
$$
v-e+r=2\\
n-e+1=2\\
e=n-1
$$

#### Equivalencias de la definicion de Arbol

- $T$ es Arbol $\Rightarrow T$ no contiene ciclos y tiene $(n-1)$ aristas.

  Como $T$ es un arbol, sabemos que no contiene aristas.

  Similar a como probamos la [Proposicion 3](#Proposicion 3), por el teorema de euler podemos decir que tiene $(n-1)$ aristas ya que tiene $n$ vertices y una sola region $(R_\infty)$.

- $T$ no contiene ciclos y tiene $(n-1)$ aristas $\Rightarrow T$ es conexo y tiene $(n-1)$ aristas.

  Por hipotesis ya sabemos que $T$ tiene $(n-1) $ aristas.

  Supongamos que es un bosque $(F=T)$, entonces el grafo tiene $n-\chi(F)$ aristas. Y como por hipotesis sabemos que tienen $(n-1)$ aristas, podemos decir que $\chi(F)=1$, entonces $F$ es conexo. Como $F$ es conexo y $F$ contiene solamente a un arbol, entonces ese arbol es conexo, por lo que $T$ es conexo.

- $T$  es conexo y tiene $(n-1)$ aristas $\Rightarrow$ $T$ es conexo y toda arista es una arista de corte.

  Por el <u>Corolario 5</u>, sabemos que todo grafo conexo tiene al menos $n-\chi(G)$ aristas. 

  Ademas podemos ver que $T-\{e\}$ tiene $n-2$ aristas y por hipotesis sabemos que $\chi(T)=1$.

  Asi podemos ver que $T-\{e\}$ tiene 2 componentes, por lo que $e$ es una arista de corte.

- $T$ es conexo y toda arista es una arista de corte $\Rightarrow$ Todo par de vertices de $T$ estan conectados por exactamente un camino simple.

  Supongamos que hubiera mas de un camino entre algun par de vertices.

  $\Rightarrow$  el grafo tendra un ciclo.

  $\Rightarrow$ el grafo tendra una arista ciclo.

  $\Rightarrow$ no toda arista seria arista de corte. ABS

  $\therefore$ Solo hay un camino entre todo par de vertices.

- Todo par de vertices de $T$ estan conectados por exactamente un camino simple $\Rightarrow$ $T$ no contiene ciclos y $T+\{e\}$ tiene exactamente un ciclo.

  Supongo que $T$ tiene un ciclo.

  $\Rightarrow$ existen al menos 2 caminos entre cualquier par de vertices. ABS

  $\therefore$ $T$ no contiene ciclos.

  $T+\{e\}$ tiene un ciclo pues por hipostesos todo par de vertices esta unico por un camino simple, al agregar $e$ se forma un ciclo.

  $T+\{e\}$ tiene exactamente un ciclo pues si tendria 2 ciclos, entonces $T$ tendria un ciclo, ABS.

-  $T$ no contiene ciclos y $T+\{e\}$ tiene exactamente un ciclo $\Rightarrow$ $T$ es Arbol.

  Si $T$ no fuera conexo, entonces tendria al menos 2 componentes. De esta forma podemos agregar una arista $e$ enre vertices de distintas componentes y podriamos decir que el grafo $T+\{e\}$ no tiene ciclos. ABS.

#### Teorema 2

Voy a probarlo por induccion.

- Caso Base:

  $n=2$,  Podemos ver que $\delta_{min}(G) \ge 1 \Rightarrow$ $K_2 \subset G$

- Hipotesis Indictiva:

  Se cumple para $n$.

- Tesis Inductiva:

  Se cumple para $n+1$.

Demostracion:

Sea $T$ con $n+1$ verices:
$$
\exist v \in V_T / g(v) =1 \Rightarrow\\
 \exist e \in E_T, e=\{v,u\}/ \text{ si quito el vertice $v$ desaparece la arista y queda un arbol con $n$ vertices}\\
 \Rightarrow \text{ Por HI } T-\{v\} \text{ es un subgrafo de }G
$$
Ahora el grado de $u$  en $T-\{v\}$ es a lo sumo $n-1$ y el grado de $u$ en $G$ es como minimo $n$.

$\Rightarrow$ hay un vertice en $G$ que no pertenece a $T-\{v\}$  y es adyacente a $u$ llamado $w$.

$\Rightarrow$ Si a $T-\{v\}$ le agrego la arista que une a $w$ con $u$ y el vertice $w$, obtengo un arbol isomorfo a $T$ y ee arbol es un subgrafo de $G$.

$\Rightarrow$ $T$ es subgrafo de $G$.













