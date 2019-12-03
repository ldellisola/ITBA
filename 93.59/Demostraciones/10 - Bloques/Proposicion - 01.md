# Demostración

Sean $B_1,B_2$ dos bloques distintos de $G$, entonces tienen a lo sumo un vertice en común. 

#### Demo

Supongo que $u,v$ son vertices de $B_1$ y $B_2$, entonces:

- $B_1-\{u\}$ es conexo $\Rightarrow \exist$ camino $w-v $ $\forall w \neq v$ en $B_1-\{u\}$
- $B_2-\{u\}$ es conexo $\Rightarrow \exist$ camino $x-v $ $\forall x \neq v$ en $B_2-\{u\}$

Entonces, existe un camino $w-x$ en $(B_1 \cup B_2) - \{u\}$

Entonces $u$ no es vertice de corte de $B_1 \cup B_2$

**ABS!** $B_1 \cup B_2$ no tiene vertices de corte y esto contradice a la maximalidad

??? ==PREGUNTAR==

