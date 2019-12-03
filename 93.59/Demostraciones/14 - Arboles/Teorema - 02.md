# Demostración

Sea $T$ un arbol con $n$ vertices y sea $G$ un grafo simple tal que el $\delta_{min}(G) \ge (n-1)$:
$$
T\text{ es un subgrafo de }G.
$$

#### Demo

Voy a probarlo por inducción.

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