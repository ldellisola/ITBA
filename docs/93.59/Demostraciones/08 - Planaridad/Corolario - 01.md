# Demostración

Sea $G$ simple, conexo y sin lazos ($e>2$), entonces
$$
e\le 3 \times v - 6
$$
Si $G$ no cumple con esto, entonces no es plano.

#### Demo

Sea $G$ un grafo conexo:

Como $G$ no tiene lazos, entonces puedo decir que $g(R_i) \ge 2$

Además, como $G$ es un grafo simple, es decir, no tiene multiaristas, puedo decir que $g(R_i)\ge 3$

Entonces:
$$
g(R_i)\ge 3~~~\forall R_i
$$
Gracias a esto, podemos decir que:
$$
\array {\sum_{\forall R_i}g(R_i) \ge 3 \times r &&(1)}
$$


Tambien sabemos que 
$$
\array{ \sum_{\forall R_i} g(R_i)=2 \times e && (2)}
$$
Y como $G$ es plano, puedo usar el [Teorema de Euler](Teorema - 01.html), que me dice:
$$
\array{ v - e + r = 2 && (3)}
$$
Si igualo $(1)$ y $(2)$:
$$
\array {2 \times e \ge 3 \times r && (4)}
$$
Con $(3)$ y $(4)$:
$$
2\times e \ge 3 \times (2-v+e)\\
3\times v - 6 \ge e
$$


