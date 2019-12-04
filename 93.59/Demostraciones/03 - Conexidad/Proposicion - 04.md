# ==Demostración==

La relacion entre $K_e(G)$ y $K_v(G)$ es:

$$
k \le K_v(G)\le K_e(G) \le \delta
$$

#### Demo

Primero voy a ver que:
$$
K_v(G)\le K_e(G)
$$
Sea $k= K_v(G)$, y sea $S$ un conjunto de $k-1$ aristas del grafo $G$

Como $G$ es $k-conexo$, el grafo $G-S$ es $1-conexo$ por [corolario](#Corolario). 

Entonces, El conjunto de aristas $S$ no es el conjunto de aristas de corte del grafo $G$, lo que implica que:
$$
K_v(G)\le K_e(G)
$$
Por otro lado, voy a probar que $K_e(G) \le \delta$

Sea $v$ un vertice del grafo $G/g(v)=k=\delta_{min}(G)$, entonces si elimino $k$ aristas que estan conectadas con el vertice $v$, el grafo deja de ser conexo.





# Anexo

### Corolario

Sea que $G~k-conexo$ y sea $M$ un conjunto de aristas $M\sub E_G/ \#M = m \le k-1$ 

$\Rightarrow G-M$ es conexo.









