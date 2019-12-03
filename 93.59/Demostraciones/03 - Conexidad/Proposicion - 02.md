# Demostración

Sea $G$ conexo:
$$
e\in E_G \text{ es arista de corte } \Leftrightarrow e \text{ no pertenece a un ciclo en }G
$$

#### Demo

$\Rightarrow)$ **Por Contrareciproco**

Si $e$ pertenece a un ciclo de $G$

$\Rightarrow$ para todo camino $u-v$ que contenga a la arista $e$ habra otro camino en $G$ que no la contenga.

$\Rightarrow$ $e$ no es de corte.

Basta ver lo siguente:

Sea $e=\{a,b\}$, $L$ el camino, $e-v=<u,\dots,a,e,b,\dots,v>$

Como hay un ciclo, entonces existe un camino alterantivo $L'=<a,\dots,b>$ que no contiene a $e$.

Entonces al quitar $e$ sigue habiendo un camino $u-v=L_{u-a}L'L_{b-v}$

$\Leftarrow)$ **Por Contrareciproco**

Si $e$ no es de corte

$\Rightarrow$ $G-\{e\}$ es conexo

$\Rightarrow$ Para todo camino $L=u-v$ que contiene a $e$ existe un camino alternativo $L'$ que no contiene a $e$ y $LL'$ es un ciclo que contiene a $e$.