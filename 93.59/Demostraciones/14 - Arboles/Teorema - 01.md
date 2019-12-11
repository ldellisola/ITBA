# ==Demostración==

Equivalencias entre la definición de árbol. 

Sea $T$ un grafo con $n$ vértices sin lazos, entonces las siguientes afirmaciones son equivalentes:

1. $T$ es un árbol.
2. $T$ no contiene ciclos y tiene $(n-1)$ aristas.
3. $T$ es conexo y tiene $(n-1)$ aristas.
4. $T$ es conexo y toda arista es una arista de corte.
5. Todo par de vértices de $T$ están conectados por exactamente un camino simple.
6. $T$ no contiene ciclos y $T+\{e\}$ tiene exactamente un ciclo.

 #### Demo

- $T$ es Árbol $\Rightarrow T$ no contiene ciclos y tiene $(n-1)$ aristas.

  Como $T$ es un árbol, sabemos que no contiene ciclos.

  Similar a como probamos la [Proposicion 3](#Proposición 3), por el teorema de Euler podemos decir que tiene $(n-1)$ aristas ya que tiene $n$ vértices y una sola región $(R_\infty)$.

- $T$ no contiene ciclos y tiene $(n-1)$ aristas $\Rightarrow T$ es conexo y tiene $(n-1)$ aristas.

  Por hipótesis ya sabemos que $T$ tiene $(n-1) $ aristas.

  Supongamos que es un bosque $(F=T)$, entonces el grafo tiene $n-\scr{K}$ $(F)$ aristas. Y como por hipótesis sabemos que tienen $(n-1)$ aristas, podemos decir que $\scr{K}$ $(F)=1$, entonces $F$ es conexo. Como $F$ es conexo y $F$ contiene solamente a un árbol, entonces ese árbol es conexo, por lo que $T$ es conexo.

- $T$  es conexo y tiene $(n-1)$ aristas $\Rightarrow$ $T$ es conexo y toda arista es una arista de corte.

  Por [Corolario](#Proposición 5), sabemos que todo grafo conexo tiene al menos $n-\scr{K}$ $(G)$ aristas.  

  Además podemos ver que $T-\{e\}$ tiene $n-2$ aristas y por hipótesis sabemos que $\scr{K}$ $(T)=1$.

  Así podemos ver que $T-\{e\}$ tiene 2 componentes, por lo que $e$ es una arista de corte.

- $T$ es conexo y toda arista es una arista de corte $\Rightarrow$ Todo par de vértices de $T$ están conectados por exactamente un camino simple.

  Supongamos que hubiera mas de un camino entre algún par de vértices.

  $\Rightarrow$  el grafo tendrá un ciclo.

  $\Rightarrow$ el grafo tendrá una arista ciclo.

  $\Rightarrow$ no toda arista seria arista de corte. **ABS!**

  $\therefore$ Solo hay un camino entre todo par de vértices.

- Todo par de vértices de $T$ están conectados por exactamente un camino simple $\Rightarrow$ $T$ no contiene ciclos y $T+\{e\}$ tiene exactamente un ciclo.

  Supongo que $T$ tiene un ciclo.

  $\Rightarrow$ existen al menos 2 caminos entre cualquier par de vértices. **ABS!**

  $\therefore$ $T$ no contiene ciclos.

  $T+\{e\}$ tiene un ciclo pues por hipótesis todo par de vértices esta único por un camino simple, al agregar $e$ se forma un ciclo.

  $T+\{e\}$ tiene exactamente un ciclo pues si tendría 2 ciclos, entonces $T$ tendría un ciclo, **ABS!**.

-  $T$ no contiene ciclos y $T+\{e\}$ tiene exactamente un ciclo $\Rightarrow$ $T$ es Árbol.

   Si $T$ no fuera conexo, entonces tendría al menos 2 componentes. De esta forma podemos agregar una arista $e$ entre vértices de distintas componentes y podríamos decir que el grafo $T+\{e\}$ no tiene ciclos. **ABS!**.

# Anexo

### Proposición 3

Todo árbol es conexo, y como no tiene ciclos es plano, por lo que vale la formula de Euler.

### Proposición 5

Todo árbol con $n$ vértices tiene exactamente $n-1$ aristas.

Esta proposición tiene 2 **corolarios**:

1. Todo bosque con $n$ vértices tiene $n-\scr K$ $(F)$ aristas
2. Un grafo $G$ con $n$ vértices tiene por lo menos $n-\scr K$ $(F)$ aristas