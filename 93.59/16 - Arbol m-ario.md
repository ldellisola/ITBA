# Arbol m-ario

Un **arbol m-ario** con $m\ge 2$ es un arbol con raiz en el cual todo vertice tiene $m$ hijos o menos.

Un Arbol m-ario completo es un arbol m-ario pero con exactamente m hijos.

Se habla de un **arbol ordenado** en el cual cada hijo de cada vertice tiene asignado un orden fijo.

Los **arboles binarios** son arboles 2-arios en el cual cada hijo es asignado como hijo izquierdo o derecho.

Un **subarbol** es un subgrafo conexo de otro arbol. En el caso de un arbol binario, se puede tomar al subarbol izquierdo de un vertice $v$ de un arbol binario $T$ como un subarbol binario recubridor del hijo isquierdo y todos sus descendientes.

La cantidad de vertices de un arbol binario completo de altura $h$ se calcula como:
$$
\#V_T=2^{h+1}-1
$$
Y un arbol binario de altura $h$ tiene al menos:
$$
\#V_T=2^{h+1}-1
$$
==FALTA CODIGO BINARIO==

## Proposiciones

- Un arbol m-ario tiene como mucho $m^k$ vertices en el nivel $k$.

## Teoremas

- Sea $T$ un arbol m-ario con n vertices y altura $h$:
  $$
  h+1 \le n\le \frac{m^{h+1}-1}{m-1}
  $$
  [Demostracion](#Teorema 4)

## Demostarciones

#### Proposicion 5

Lo voy a probar por induccion. 

- Caso base:

  $k=0$, entonces tiene 0 niveles y en el nivel 0 tiene $m^0=1$ elemento, la raiz.

- Hipotesis Inductiva:

  Si $k=n$ entonces un arbol m-ario tiene como mucho $m^n$ en el nivel $n$.

- Tesis Inductiva:

  Si $k=n+1$, entonces un arbol m-ario tiene como mucho $m^{n+1}$ elementos en el nivel $n+1$.

Cada vertice del nivel $k$ tiene $m$ hijos, entonces en el nivel $k+1$ habra como mucho $m^k \times m$ hijos, es decir $m^{k+1}$.

#### Teorema 4

Sea $T$ m-ario, con $n$ vertices y altura $h$, sabemos que:
$$
n=\sum n_i
$$
Para cada nivel del arbol.

La cantidad de vertices en el nivel $i$ es:
$$
1 \le n_i \le m^i\\
\sum_{i=0}^h1 \le \sum_{i=0}^h n_i \le \sum_{i=0}^{h} m^i\\
h+2 \le n \le \frac{m^{h+1}-1}{m-1}
$$
























