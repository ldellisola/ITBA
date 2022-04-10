# Metodos de Búsqueda

Los métodos de búsqueda permiten encontrar una solución a problemas que cumplen con las siguientes condiciones:

- Están en un **ambiente discreto y finito**.
- **Existe una función de transición** que depende de un estado y una acción, para devolver el proximo estado.
- Para cada estado existe una cantidad **finita de acciones posibles**.

La función de transición describe el efecto de aplicar la acción $a$ al estado $s$. La función d costo determina el costo de llegar a un estado, dado un estado inicial y su modelo de transición. Por último, la condición solución es una función que acepta un estado y decide si se consiguió una solución.

FALTA



## Metodos de Búsqueda No Informados

==falta==

Los métodos de búsqueda pueden tener las siguientes características:

- **Completo**: Encuentra una solución (si existe)
- **Optimo**: Encuentra la solución con menor costo.
- **Complejidad Computacional**: La complejidad computacional puede ser temporal, espacial o ambas.

```pseudocode
Let A be Tree
Let F be Set of non-exanded Nodes from A
let Ex be Set of explored Nodes
let n, node be Node

n = new RootNode()
A = new Tree(n)
F = new Set<Node>(n)
Ex = new Set<Node>()

while !F.empty() do
	node = F.first()
	if !Ex.contains(node) do
		Ex.add(node)
	end
	if node.isGoal() do
		return A.pathFrom(n,node)
	end
	successors = node.successors().notIn(Ex)
	A.add(successors)
	F.add(successors)
	F.sortAccordingToMethod()
end
return new EmptyPath()
```

### Búsqueda a lo Ancho (BPA)

Utiliza el algoritmo anterior, pero a la hora de reordenar los nodos en el set `F`, se priorizan los nodos con menos profundidad. Es **completa** si la cantidad de acciones posibles para cada estado es finito. 

Este método siempre encuentra la solución con menor profundidad, y esta es optima cuando el problema es de costo uniforme.

### BMC



### BPP



### BBPL

Es una alternativa a la búsqueda en profundidad limitada. Busca una solución hasta la cierta profundidad. Este método no es completo ni optimo.

### Búsqueda en Profundidad Variable (BPPV)

Si no se sabe la profundidad limite a partir de la cual se pueden obtener soluciones con el metodo de búsqueda BPPL, se usa este metodo. 

Se comienza con una aproximación a la profundidad que nosotros esperamos encontrar una solución, acá tenemos dos casos:

- Si no se llega a una solución con la profundidad establecida, entonces va agrandando la profundidad limite para encontrar una solución.
- Si se llega a una solución con la profundidad establecida, va a volver a correr el algoritmo con una profundidad menor, para ver si hay un mejor camino

### Estados Repetidos

Podemos detectar estados repetidos en la expansion de los nodos y así evitar tener que recorrer caminos ya utilizados. En el caso de BPPL y BPPV, dado un nuevo nodo con un estado particular, puede pasar que haya otro nodo en el árbol con el mismo estado pero a una profundidad mayor.

## Metodos de Búsqueda Informados

Los métodos de búsqueda informados permiten guiar la búsqueda de una solución incorporando una estimación sobre la conveniencia o no de expandir un nodo dado.

Para poder evaluar la conveniencia de expandir un nodo se utiliza una función llamada **heurística**:
$$
h:\text{Estados} \rarr \R/h(e)= \left \{ 

\array{
0 & e \text{ es un estado objetivo} \\
\geq 0 & e \text{ no es un estado objetivo y } \\ & \forall a \text{ accion el costo de realizar }a \geq 0
}
\right.
$$
Mediante esta función, dado un estado $s$, $h(s)$ es una estimación del costo que resta para alcanzar una solución. 

### Heurística Local

Sea $n_0$ el nodo raiz de búsqueda y sea $s$ el estado inicial representado por $n_0$. Sea $L_0$ una lista vacía de nodos a la cual se agrega el nodo $n_0$, Hay dos versiones de este algoritmo, con y sin retroceso.

<img src="Resources/02 - Metodos de Busqueda/Screen Shot 2022-03-08 at 11.01.07.png" alt="Screen Shot 2022-03-08 at 11.01.07" style="zoom:50%;" />

<img src="Resources/02 - Metodos de Busqueda/Screen Shot 2022-03-08 at 11.01.23.png" alt="Screen Shot 2022-03-08 at 11.01.23" style="zoom:50%;" />

Este método de heurística no es optimo, pero es completo si realiza el retroceso.

### Heurística Global

Es similar a la otra implementación, pero en vez de aplicarse solo a los sucesores, se aplica a todo el set de nodos de frontera.

<img src="Resources/02 - Metodos de Busqueda/Screen Shot 2022-03-08 at 11.03.41.png" alt="Screen Shot 2022-03-08 at 11.03.41" style="zoom:50%;" />

### A*

Esta función esta definida de la siguiente forma:
$$
f:\text{Nodos}\rarr\R/ f(n) = g(n) + h(n.state)
$$
Donde $g$ es la función de costo del camino realizado desde el nodo raiz hasta el nodo actual $n$. 

El algoritmo se define de la siguiente forma:

<img src="Resources/02 - Metodos de Busqueda/Screen Shot 2022-03-08 at 11.11.53.png" alt="Screen Shot 2022-03-08 at 11.11.53" style="zoom:50%;" />

Una heuristica $h()$ es admisible si $f(n)$ nunca sobrestima el costo real de la mejor solución que pasa por el nodo $n$:
$$
\text{dado } h^*(n.state) \text{ correspondiente a la solucion optima}: \\
h(n.state) < h^*(n.state) \lrarr \text{ la heuristica es admisible}
$$
