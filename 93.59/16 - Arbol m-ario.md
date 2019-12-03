# Arbol m-ario

Un **árbol m-ario** con $m\ge 2$ es un árbol con raiz en el cual todo vertice tiene $m$ hijos o menos.

Un árbol m-ario completo es un arbol m-ario pero con exactamente m hijos.

Se habla de un **árbol ordenado** en el cual cada hijo de cada vertice tiene asignado un orden fijo.

Los **arboles binarios** son arboles 2-arios en el cual cada hijo es asignado como hijo izquierdo o derecho.

Un **subarbol** es un subgrafo conexo de otro árbol. En el caso de un árbol binario, se puede tomar al subarbol izquierdo de un vertice $v$ de un árbol  binario $T$ como un subarbol binario recubridor del hijo izquierdo y todos sus descendientes.

La cantidad de vertices de un árbol binario completo de altura $h$ se calcula como:
$$
\#V_T=2^{h+1}-1
$$
Y un árbol binario de altura $h$ tiene al menos:
$$
\#V_T=2^{h+1}-1
$$
==FALTA CODIGO BINARIO==

## Proposiciones

- Un arbol m-ario tiene como mucho $m^k$ vertices en el nivel $k$.

   [Demostración](Demostraciones\16 - Arbol m-ario\Proposicion - 01.html) 

## Teoremas

- Sea $T$ un arbol m-ario con n vertices y altura $h$:
  $$
  h+1 \le n\le \frac{m^{h+1}-1}{m-1}
  $$
  [Demostración](Demostraciones\16 - Arbol m-ario\Teorema - 01.html) 


















