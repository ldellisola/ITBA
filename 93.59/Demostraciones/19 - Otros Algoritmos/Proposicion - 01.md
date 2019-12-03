# Demostración

Sea $T$ el árbol que se obtiene de aplicar DFS al grafo $G$:
$$
\text{la raíz ($r$) del árbol es vértice de corte de $G$ $\Leftrightarrow r$ tiene mas de un hijo en $T$. }
$$


#### Demo

$\Rightarrow )$

Si $r$ tiene un solo hijo 

$\Rightarrow$ $T-\{r\}$ es conexo y es un árbol recubridor de $G-\{r\}$

$\Rightarrow$ $G-\{r\}$ es conexo

$\Rightarrow$ $r$ no es un vértice de corte

$\Leftarrow)$

Si $r$ tiene mas de un hijo (Supongo que tiene 2, $x$ e $y$) y no es ancestro ni sucesor de $x$ y ninguno de los vertices que cuegan de $y$ son ancestros ni sucesores de $x$

$\Rightarrow$ Por la [observación](#Observación)

Los vertices del subarbol que tienen como raiz $y$ no estan conectados con alguno de los vertices del subarbol que tienen a $x$ como raiz.

$\Rightarrow G-\{r\}$ no es conexo 

==PEDIR==

# Anexo

### Observación

Si $\exist e=\{u,v\} \in E_G$ y $e \notin E_T$ y $dfnum(u) < dfnum(v) \Rightarrow u$ es el ancestro de $v$ en el árbol.





