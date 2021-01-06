# Demostración

Sea $T$ el árbol que se obtiene luego de aplicar el algoritmo de Kruskal:
$$
T \text{ es un árbol recubridor mínimo }
$$

#### Demo

Las aristas de $T$ son elegidas en orden según su peso,  $e_1,e_2,\dots,e_{n-1}$ con $n= \#V_G-1$

El grafo puede tener más de un árbol recubridor mínimo. De todos estos, vamos a elegir aquel $T_1/ d(T_1)=k$ máximo. 

$d(T_i) = k \Rightarrow e_1,e_2,\dots,e_{k-1} \in E_{T_i}$ pero $e_k \not \in E_{T_i}$

Si $k=n$, entonces la demostración esta completa, sino, vamos a probarlo por absurdo.

Supongamos que $k \le n-1$, entonces en $T_1$ tengo $e_1,\dots,e_{k-1}$ de forma tal que:

- $e_k \in E_T$ pero $e_k \not \in E_{T_1}$
- Si en $T_1 + \{e_k\}$ se genera un ciclo y en ese ciclo hay una arista $e'$ tal que $e'\not \in E_T$ y $e'\in E_{T_1}$==No entiendo esto==

Como el algoritmo elige a la arista de menor peso

