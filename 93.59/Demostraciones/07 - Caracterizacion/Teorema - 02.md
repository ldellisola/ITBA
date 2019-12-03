# Demostración

$$
G \text{ es conexo}\\\Leftrightarrow\\G \text{ es un ciclo o una sintesis de Whitney a partir de un ciclo}
$$

#### Demo

$\Rightarrow)$

Como $G$ es un grafo $2-conexo$, tenemos 2 casos:

1. $G$ es un ciclo, en cuyo caso termina la demostración.
2. $G$ no es un ciclo, pero podemos agregar caminos simples a un ciclo de $G$ (subgrafo) hasta obtener $G$ mediante el [Lema](#Lemas) 1 y 2.

$\Leftarrow)$

Por los [Lemas](#Lemas) 1 y 2, el grafo tiene que ser $2-conexo$.

# Anexo

### Lemas

1. Sea $H$ un grafo $2-conexo$. La adicion a $H$ de un camino simple lo convierte en un grafo $H'$ $2-conexo$.
2. Sea $H \sub G~2-conexo$ y sea $e \in E_{G-H}$, Entonces se puede adicionar un camino simple a $H$ que contenga la arista $e$.