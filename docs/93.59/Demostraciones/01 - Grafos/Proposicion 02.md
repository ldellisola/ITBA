# Demostración

En un grafo $G$ la cantidad de vértices de grado impar es par. 

#### Demo

Se puede suponer que los primeros $q$ vértices ($0 \leq q \leq n$) tienen grado par y el siguiente conjunto de vértices ($n-q$) tiene grado impar.
$$
\sum_{i=1}^{n=\#V_G} g(v_i)= \sum_{i=1}^{q} g(v_i) + \sum_{i=q+1}^{n} g(v_i)  =2 \cdot \#E_G
$$

y suponemos que $n-q = 2\cdot k + 1$, por lo que obtenemos:
$$
\sum_{i=1}^{q} g(v_i) = 2 \cdot k'\\
\sum_{i=q+1}^{n} g(v_i) = 2 \cdot k '' +1
$$
Y al sumar obtenemos que:
$$
2 \cdot k' + 2\cdot k''+1 = 2 \cdot \#E_G
$$
Pero es _Absurdo_ por que $2 \cdot \#E_G$ siempre va a ser un numero par. Entonces la cantidad de vértices de grado impar es par.