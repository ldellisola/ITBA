# ==Demostración==

$$
v\in V_G \text{ es vertice de corte de }G \\ \Leftrightarrow \\\exist \mu,v,w \in V_G/ \mu \neq v, v \neq w, \mu \neq w \text{ tal que todo camino de } \mu-w \text{ pasa por } v
$$

#### Demo

$\Rightarrow ) $

Si $v$ es vertice de corte de $G \Rightarrow$ 

$G-\{v\}$ tiene al menos dos componentes si tomamos a $v,w$ como dos componentes distintas de $G-\{v\} \Rightarrow$

$\not \exist$ camino $\mu-w$ en $G-\{v\} \Rightarrow$

Como $G$ es conexo, en $G$ todo camino $\mu-w$ pasa por $v$

$\Leftarrow)$ 

Si todo camino $\mu-w$ en $G-\{v\}$ pasa por $v$ $\Rightarrow$

En $G-\{v\}$ no hay camino $\mu-w$ $\Rightarrow$

$G-\{v\}$ no es conexo,  como $G$ es conexo $\Rightarrow$

$v$ es vertice de corte.