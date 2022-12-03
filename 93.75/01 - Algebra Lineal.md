# Algebra Lineal



> **Definición 1.1**
>
> Un **cuerpo** $\mathbb{K}$ es un conjunto de elementos, denominados escalares que tiene dos operaciones $+,*$ que cumplen con:
>
> - $\mathbb{K}$ es **cerrado** para $+,*$ si:
>   $$
>   \alpha,\beta \in \mathbb{K} \implies \alpha +\beta, \alpha * \beta \in \mathbb K
>   $$
>
> - $+,*$ son **asociativos** en $\mathbb K$ si:
>   $$
>   \alpha,\beta,\gamma \in \mathbb K \implies \array{
>   \alpha + (\beta + \gamma) = (\alpha + \beta) + \gamma \\
>   \alpha * (\beta * \gamma) = (\alpha * \beta) * \gamma
>   }
>   $$
>
> - $+,*$ son **conmutativos** en $\mathbb K$ si:
>   $$
>   \alpha,\beta \in \mathbb K \implies \array{
>   \alpha + \beta = \beta + \alpha\\
>   \alpha * \beta = \beta * \alpha
>   }
>   $$
>
> - $+,*$ son **distributivos** en $\mathbb K$ si:
>   $$
>   \alpha,\beta,\gamma \in \mathbb K \implies \alpha * (\beta + \gamma) = (\alpha * \beta) + (\alpha * \gamma)
>   $$
>
> - Existe un **elemento neutro** para $+$ si:
>   $$
>   \forall \alpha \in \mathbb K,\exists 0 \in \mathbb K / \alpha  + 0 = \alpha 
>   $$
>
> - Existe un **elemento neutro** para $*$ si :
>   $$
>   \forall \alpha \in \mathbb K , \exists 1 \in \mathbb K/\alpha * 1 = \alpha
>   $$
>
> - Existe un **inverso aditivo**:
>   $$
>   \alpha \in \mathbb K \implies \exists -\alpha \in \mathbb K / \alpha + (-\alpha) = 0
>   $$
>
> - Existe un **inverso multiplicativo**:
>   $$
>   \exists \alpha  \neq 0\in \mathbb K \implies  \exists \alpha^{-1}\in \mathbb K/\alpha * \alpha^{-1}=1
>   $$
>

Estas propiedades son cumplidas por los numeros racionales, reales y complejos, pero no por los anturales o los enteros.

## Aritmética de Vectores y Matrices

> **Definición 1.2**
>
> Dos vectores o matrices son iguales cuando todos y cada uno de sus elementos son iguales:
> $$
> \array{ 
> \vec u = \vec v \iff \forall i\  u_i = v_i  \\
> M = N \iff \forall i,j\  M_{ij} = N_{ij}
> 
> }
> $$

También podemos **sumar** vectores y matrices cuando los tamaños sean iguales y esta operacion se realiza aplica de elemento a elemento. 

Sean $\vec v,\vec u$ vectores de igual tamaño:
$$
(\vec u + \vec v)_i = u_i + v_i
$$
Sean $M,N$ matrices de igual dimensión:
$$
(M + N)_{ij} = M_{ij} + N_{ij}
$$
El **producto por un escalar** funciona de la misma manera:
$$
\array{
(\alpha \vec u)_i = \alpha u_i\\
(\alpha M)_{ij}  = \alpha M_{ij}
}
$$
El **producto matricial** funciona de forma distinta ya que no es conmutativo. Sean $M,N$ matrices de dimensión $m\times n,n \times r$ respectivamente, podemos realizar el producto $MN$ y obtener una matriz con dimensión $m \times r,$ donde cada elemento tiene la siguiente forma:
$$
(MN)_{ij} = \sum_{k=1}^n M_{ik}N_{kj}
$$

> **Definición 1.3**
>
> Una matriz $L^{n\times m}$ se llama **preinversa** de la matriz $A^{m\times n}$ si y solo si $LA = \mathbb{I}_n.$ Por otra parte, la matriz $R^{n\times m}$ se denomina **postinversa** de $A$ si y solo si $AR = \mathbb{I}_m.$

A partir de las matrices cuadradas se puede obtener su **determinante**. Se conocen las siguientes propiedades de los determinantes:

1. Si intercambiamos dos filas o dos columnas de una matriz cuadrada, su determinante cambia de signo, aunque son iguales en valor absoluto.

2. El determinate de una matriz cuadrada concede con el determinante de su transpuesta:

3. Si $A,B \in \mathbb{K}^{n \times n}$, entonces:

$$
\det(AB) = \det(A)\det(B)
$$

4. Si $A$ es inversible:

$$
\det(A^{-1}) = \det(A)^{-1}
$$

5. Si multiplicamos todos los elemento de una fila o columna de una matriz cuadrada por un numero $k$, su determinante queda multiplicado por dicho numero:

$$
A \in \mathbb {K}^{n \times n}, k \in \mathbb {K}/ \det(k*A) = k *\det(A)
$$

6. Si una matriz cuadrada tiene todos los elementos de una fila o columna en 0, su determinante es el elemento nulo.

7. Si una matriz cuadrada tiene dos filas o dos columnas iguales, si determinante es 0.

8. Si una matriz cuadrada tiene dos filas o columnas proporcionales, su determinante es 0.

9. Todos los elementos de una fila o columna de una matriz cuadrada se descomponen en dos sumandos, entonces su determinante es igual a la suma de los dos determinantes que tienen en dicha fila o columna el primero y el segundo sumando respectivamente, siendo los restantes elementos iguales a los elementos del determinate inicial.

10. Si una fila o columna de una matriz cuadrada es combinación lineal de dos o más de las restantes filas o columnas, su determinante es cero.

11. Si a una fila o columna de una matriz cuadrada se le suma otra paralela a ella, su determinate no varia.

12. Si a una fila o columna de una matriz cuadrada se le suma otra paralela a ella multiplicada por un numero, su determinante no varia.

> **Definición 1.4**
>
> Si el determinante de una matriz cuadrada es distinto de cero, exite la **inversa** de ella y a la matriz se la denomina **inversible**. Si por el contrario es nulo, se la denomina **singular**.

> **Definición 1.5**
>
> Se define como **traza** de una matriz cuadrada a la suma de los elementos de la diagonal.
> $$
> \text{tr}(A) = \sum_{i=1}^n a_{ii}
> $$

==END==



## Vectores y Matrices



Una **matriz diagonal** es una matriz cuadrada donde todos los elementos son nulos excepto por los valores en la diagonal:
$$
\left(\matrix{1&0&0\\0&2&0\\0&0&3}\right)
$$
Una matriz de denomina **de bandas** si los elementos distintos de 0 se colocan todos en una banda diagonal que incluye a la diagonal principal.

Una matriz es **triangular inferior** si es cuadrada y ademas $a_{ij}=0 \forall i >j.$ Se dice que es **triangular superior** si es cuadrada y ademas  $a_{ij}=0 \forall i <j.$

Una matriz cuadrada es **simétrica** si $a_{ij} = a_{ji}.$

Una matriz cuadrada es **antisimetrica** si $a_{ij}=-a_{ji}.$

Una matriz $M \in \mathbb{K}^{m \times n}$ se dice que es **ortogonal** si:
$$
M'M = I_{n\times n}
$$
Ademas, si $n=m,$  decimos que $M' = M^{-1}.$

Una matriz es **escalonada** si:

- Todas las filas cero están en la parte inferior de la matriz.
- El primer elemento no nulo de una fila esta a la derecha del elemento no uso de la fila anterior.
- El primer elemento no nulo o uno de cada fila esta a la derecha del primer elemento diferente de 0.

Dada una matriz $A \in \mathbb {K}^{n \times m}$ arbitraria, por eliminación gaussiana se la puede llevar a su forma escalonada.

### Operaciones

- Los vectores y matrices se suman componente a componente:
  $$
  \left(\matrix{3\\2\\1}\right) +
  \left(\matrix{6\\5\\4}\right) =
  \left(\matrix{9\\7\\5}\right)
  $$

  $$
  \left(\matrix{2&3\\4&5}\right) + 
  \left(\matrix{6&7\\8&9}\right) =
  \left(\matrix{8&10\\12&14}\right)
  $$

- El **producto escalar** también es componente a componente:
  $$
  -1 * \left(\matrix{3\\2\\1}\right) = 
  \left(\matrix{-3\\-2\\-1}\right)
  $$

  $$
  2 * \left(\matrix{2&3\\4&5}\right) = \left(\matrix{4&6\\8&10}\right)
  $$

- La **multiplicación** de matrices se puede realizar si las dimensiones de las mimas son concordantes, esto significa que:
  $$
  A \in \mathbb {R}^{n\times m},B \in \mathbb {R}^{m\times q} \implies AB = C\in \mathbb {R}^{n\times q}
  $$
  Esta operación no es **conmutativa**.

- El operador $\text{‘}$ es similar a la operación de transposición de matrices, pero ademas conjuga a los elementos complejos:
  $$
  \left(\matrix{1&i\\0&i}\right)' = \left(\matrix{1&0\\-i&-i}\right)
  $$

- La operación **transponer** cambia las filas por columnas de una matriz.

- La matriz **adjunta** es una matriz que tiene como filas, las columnas conjugadas. 

- La operación **rango** se calcula a partir de una matriz. Se debe convertir a esta matriz a una escalonada, y luego se cuentan la cantidad de filas que no están compuestas exclusivamente por valores nulos. Una matriz de **rango maximo** tiene el valor de rango igual que su cantidad de filas.

### Matriz Inversible

Una matriz con la misma cantidad de filas que columnas, se la llama **matriz cuadrada**.

Si una matriz $A \in \mathbb {K}^{n\times m}$ no es cuadrada, puede que existan matrices $L,R$ tal que:
$$
\array{ LA = I_n & AR - I_m}
$$
Si $A \in \mathbb {K}^{n\times n}$ es una matriz cuadrada, es util conocer si existe una matriz $B \in \mathbb{K}^{n \times n}$ tal que:
$$
AB = BA = I
$$
Si existe esta matriz, entonces se dice que $A$ es **inversible** y notamos a $B = A^{-1}.$

Podemos saber que una matriz es inversible si su determinante es distinto de 0:
$$
A \in \mathbb {K}^{n \times n}: \det(A) \neq 0 \implies \exists B \in \mathbb{K}^{n\times n}/AB = I
$$
Otra forma de ver esto, seria con la representación de la matriz en el espacio. Si el paralelepípedo formado por los vectores columna tienen volumen, es inversible. El volumen es medido por el determinante de la matriz. Si el determinante es 0, entonces esta sobre el mismo eje.

Si una matriz es cuadrada y tiene rango máximo entonces es invertible

## Sistema de Ecuaciones Lineales

En una ecuación lineal, las incógnitas no aparecen multiplicándoselo ni elevadas a una potencia distinta de 1. Una ecuación lineal con $n$ incognitos se escribe como:
$$
b = \sum_{k=1}^n a_kx_k
$$
Si tenemos $n$ de estas ecuaciones entonces llevamos a un sistema lineal de $n$ ecuaciones con $n$ incógnitas. Este sistema se puede representar en forma matricial como:
$$
\array{M \vec x =\vec b & M_{jk} = a_{jk}}
$$
==FALTA==

## Espacios Vectoriales

Un espacio vectorial es un conjunto de vectores con dos operaciones definidas:
$$
(\mathbb {V},\oplus,\otimes)
$$
Donde el espacio vectorial $\mathbb V$ esta definido sobre el cuerpo $\mathbb K$. Ademas se deben cumplir las siguientes propiedades:

1. Cerrado por la suma
2. Conmutatividad de la suma vectorial
3. Asociatividad de la suma vectorial
4. Elemento neutro de la suma vectorial
5. Elemento inverso de la suma vectorial
6. Distributividad de $\otimes$ con la suma vectorial.

### Subespacios Vectoriales

Se dice que un conjunto de vectores $\mathbb{W} \subseteq \mathbb {V}$ es un subespecie vectorial si:

- Es un conjunto no vacío.
- Es cerrado bajo la suma.
- Es cerrado bajo el producto escalar

Con las mismas operaciones que $\mathbb V.$

### Combinación Lineal de Vectores

Dado un conjunto de vectores $\{\vec u_j\}^n_1$ se llamara combinación lineal de ellos a cualquier vector de la forma:
$$
\vec v = \sum_{j=1}^n \alpha_j \vec u_j
$$
Donde los escalares $\alpha_j$ se llaman coeficientes de la combinación lineal. 

Decimos que un conjunto es linealmente dependiente si existe una combinación lineal de sus elementos:
$$
\vec 0_{\mathbb{V}} = \sum_{j=1}^n \alpha_j \vec u_j
$$
Donde algún $\alpha_j$ es distinto de cero. Y definiremos al conjunto como linealmente independiente, si la única manera de obtener el vector cero es con todos los coeficientes de la combinación nulos.

### Generadores y Bases

Dado un conjunto de vectores $B = \{\vec u_j\}^n_1 \subset \mathbb {V}$ definimos al subespecie generado por $B: \text{Gen}(B)$ como el conjunto de todas las combinaciones lineales de los vectores de $B:$
$$
\text{Gen}(B) = \left\{\vec v \in \mathbb {V}: \vec v = \sum_{j=1}^n \alpha_j \vec v_j; \alpha_j \in \mathbb {K}\right\}
$$
Se define como **rango** de un conjunto $B\subseteq \mathbb{V}$ al numero de vectores linealmente independientes que contiene $B.$ Este numero se denomina dimension del subespacio $\text{Gen}(B).$

Decios que un conjunto $B$ es una base de un espacio $\mathbb V$ cuando tiene el numero máximo posible de vectores linealmente independiente.

Ademas, la dimension de un subespacio es la cantidad de vectores linealmente independiente que tiene un conjunto que lo genera. 

#### Espacios Asociados con una Matriz

Dada una matriz $A \in \mathbb {K}^{n\times m}$ definimos a:

- El espacio de columnas de una matriz $\text{Col}(A) \subset \mathbb {K}^m$ como el subespacio generado por las columnas de la misma.
- El espacio de filas de una matriz $\text{Col}(A)\subset \mathbb{K}^n$ como el subespacio generado por las filas de la misma.
- El espacio nulo de la matriz $\text{Nul}(A)\subset \mathbb {K}^m$ como el generado por las soluciones $A\vec x = 0$

#### Espacios de Dimension Infinita Numerable

Sea $\mathbb V$ un espacio vectorial, decimos que es una dimension infinita si y solo si existe una secuencia $(v_1,v_2,\dots)$ de vectores en $\mathbb V$  tal que $\{v_1,\dots,v_n\}$ es linealmente independiente para todo $n\in \N.$



