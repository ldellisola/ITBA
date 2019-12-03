# ==Demostración==

Equivalencias entre la definicion de arbol. 

Sea $T$ un grafo con $n$ vertices sin lazos, entonces las siguentes afirmaciones son equivalentes:

1. $T$ es un arbol.
2. $T$ no contiene ciclos y tiene $(n-1)$ aristas.
3. $T$ es conexo y tiene $(n-1)$ aristas.
4. $T$ es conexo y toda arista es una arista de corte.
5. Todo par de vertices de $T$ estan conectados por exactamente un camino simple.
6. $T$ no contiene ciclos y $T+\{e\}$ tiene exactamente un ciclo.

 #### Demo

- $T$ es Arbol $\Rightarrow T$ no contiene ciclos y tiene $(n-1)$ aristas.

  Como $T$ es un arbol, sabemos que no contiene aristas.

  Similar a como probamos la [Proposicion 3](#Proposición 3), por el teorema de euler podemos decir que tiene $(n-1)$ aristas ya que tiene $n$ vertices y una sola region $(R_\infty)$.

- $T$ no contiene ciclos y tiene $(n-1)$ aristas $\Rightarrow T$ es conexo y tiene $(n-1)$ aristas.

  Por hipotesis ya sabemos que $T$ tiene $(n-1) $ aristas.

  Supongamos que es un bosque $(F=T)$, entonces el grafo tiene $n-\chi(F)$ aristas. Y como por hipotesis sabemos que tienen $(n-1)$ aristas, podemos decir que $\chi(F)=1$, entonces $F$ es conexo. Como $F$ es conexo y $F$ contiene solamente a un arbol, entonces ese arbol es conexo, por lo que $T$ es conexo.

- $T$  es conexo y tiene $(n-1)$ aristas $\Rightarrow$ $T$ es conexo y toda arista es una arista de corte.

  Por [Corolario](#Proposición 5), sabemos que todo grafo conexo tiene al menos $n-\chi(G)$ aristas. 

  Ademas podemos ver que $T-\{e\}$ tiene $n-2$ aristas y por hipotesis sabemos que $\chi(T)=1$.

  Asi podemos ver que $T-\{e\}$ tiene 2 componentes, por lo que $e$ es una arista de corte.

- $T$ es conexo y toda arista es una arista de corte $\Rightarrow$ Todo par de vertices de $T$ estan conectados por exactamente un camino simple.

  Supongamos que hubiera mas de un camino entre algun par de vertices.

  $\Rightarrow$  el grafo tendra un ciclo.

  $\Rightarrow$ el grafo tendra una arista ciclo.

  $\Rightarrow$ no toda arista seria arista de corte. **ABS!**

  $\therefore$ Solo hay un camino entre todo par de vertices.

- Todo par de vertices de $T$ estan conectados por exactamente un camino simple $\Rightarrow$ $T$ no contiene ciclos y $T+\{e\}$ tiene exactamente un ciclo.

  Supongo que $T$ tiene un ciclo.

  $\Rightarrow$ existen al menos 2 caminos entre cualquier par de vertices. **ABS!**

  $\therefore$ $T$ no contiene ciclos.

  $T+\{e\}$ tiene un ciclo pues por hipostesos todo par de vertices esta unico por un camino simple, al agregar $e$ se forma un ciclo.

  $T+\{e\}$ tiene exactamente un ciclo pues si tendria 2 ciclos, entonces $T$ tendria un ciclo, **ABS!**.

-  $T$ no contiene ciclos y $T+\{e\}$ tiene exactamente un ciclo $\Rightarrow$ $T$ es Arbol.

   Si $T$ no fuera conexo, entonces tendria al menos 2 componentes. De esta forma podemos agregar una arista $e$ enre vertices de distintas componentes y podriamos decir que el grafo $T+\{e\}$ no tiene ciclos. **ABS!**.

# Anexo

### Proposición 3

Todo arbol es conexo, y como no tiene ciclos es plano, por lo que vale la formula de euler.

### Proposición 5

Todo arbol con $n$ vertices tiene exactamente $n-1$ aristas.

Esta proposicion tiene 2 **corolarios**:

1. Todo bosque con $n$ vertices tiene $n-\chi(F)$ aristas
2. Un grafo $G$ con $n$ vertices tiene por lo menos $n-\chi(G)$ aristas.