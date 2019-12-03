# Demostracion

Sea $G$ un grafo o multígrafo sin vértices aislados:
$$
G \text{ es un grafo euleriano } \Leftrightarrow \text{ todos los vertices tienen grado par y $G$ es conexo}
$$

#### Demo

$\Rightarrow)$

Si $G$ es un grafo euleriano, entonces $\exist$ un camino cerrado en $G$ que recorre todas sus aristas sin repetirlas. Vamos *"hacer"* el recorrido cerrado:

1. Empezamos con el vertice $v$. Como $v$ es adyacente a un vertice $w$, mediante una arista $e$, para salir de $w$ necesito otra arista. Ademas, $w$ puede tener un lazo, lo recorremos, volvemos a $w$ y salimos (Si tiene muchos lazos hago lo mismo). En todos los casos, **el aporte de $g(w)$ es par** por que son lazos, entrada y salida
2. **Para todo vertice $u \neq w$, va a pasar lo mismo que en el paso 1**, y como al terminar el recorrido cerrado, la ultima arista incide en $v$, **$g(v)$ es par**.
3. En el caso de que $v$ tenga lazos, sucede lo mismo que en el paso 1 y podemos decir que su grado sera par.

$\therefore$ Todos los vertices tienen grado par

$\Leftarrow)$

Vamos a probar esto mediante induccion en $\#E_G$:

- Caso Base:

  $\#E_G = 1$, entonces obtenemos que $G$ es un dipolo con una sola arista o es un vertice con un lazo:

  1. $G$ es un vertice con un lazo, que es un circuito.
  2. $G$ es un dipolo con una arista, entonces no se cumple que $g(v)=2\times k$.

- Hipotesis Inductiva:
  $$
  \#E_G\le n
  $$

- Tesis Inductiva:
  $$
  \#E_G = n+1
  $$

Como $G$ es conexo y $g(v)=2\times k~~~ \forall v \in  V_G \Rightarrow \exist$ un ciclo en $G$.

Eliminamos este ciclo borrando aristas y vertices aislados, el resultado puede quedar conexo o no, pero en todos los casos las componentes resultantes tienen sus vertices de grado par.

Entonces, por **hipotesis inductiva**, cada compoenente es euleriana, ya que tiene a lo sumo $n$ aristas. Ademas, cada componente tiene al menos un vertice en comun con el ciclo inicial, por lo que podemos reconstruir y exhibir el circuito euleriano.



















