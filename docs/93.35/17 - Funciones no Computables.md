# Funciones no Computables

## Definiciones

- **Funcion Par**: La funcion par se define como:
  $$
  <,>:\mathbb{N}^2\rightarrow\mathbb{N}/<x,y>= 2^x\times(2\times y+1)-1
  $$
  Esta funcion es biyectiva y RP

- **Funcion Left**: La funcion left se define como:
  $$
  l:\mathbb{N}\rightarrow\mathbb{N}/l(z) = x /z=<x,y>
  $$
  La funcion es RP.

- **Funcion Right**: La funcion right se define como:
  $$
  r:\mathbb{N}\rightarrow\mathbb{N}/r(z) = y /z=<x,y>
  $$
  La funcion es RP.

- **Numero de Gedel**: Sea $k\in \mathbb{N}_{\ge1}$, para cada $k$ se define una funcion:
  $$
  [\dots]:\mathbb{N}^k\rightarrow\mathbb{N}/[a_1,\dots,a_k]= p_1^{a_1}\times \dots \times  p_k^{a_k}
  $$
  Siendo $p_i$ el $i-$esimo primo. Las funciones numero de Gedel son inyectivas pero no sobreyectivas.

- **Indicadores de Numeros de Gedel**: Son dos funciones:
  $$
  V:\mathbb{N}^2\rightarrow\mathbb{N}/V(x,y)=v_{P_y}(x)\\ 
  [\ \ ]:\mathbb{N}^2\rightarrow\mathbb{N}/x[i]=v_{P_i}(x)\\
  long:\mathbb{N}\rightarrow\mathbb{N}/long(n)=
  \left\{
  	\array{
      	k	&& n=[a_1,\dots,a_k]/a_k\neq0\\
      	0	&&	n=0\\
      	1	&&	n=1
  	}
  \right.
  $$
  Estas funciones son RP.

