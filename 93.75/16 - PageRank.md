PageRank es un algoritmo que intenta de dar un puntaje a todos los nodos. Este puntaje se obtiene midiendo la cantidad de nodos que hacen referencia a cada uno de ellos. 
Se puede visualizar al algoritmo de la siguiente forma:

> Tenemos un crawler que esta recorriendo una red de forma probabilistica, a cada nodo que llega, obtiene todas las conexiones del nodo y las guarda en su modelo para seguir investigando la red.
> El objetivo es entender todas las relaciones de la red y ver que nodos son más populares. El puntaje no solo se define por la cantidad de conexiones entrantes, sino por la calidad de las mismas. Una conexión de un nodo con un puntaje alto es mejor que una conexión de un nodo con un mal puntaje.

A partir de nuestra red, podemos obtener la matriz de hipervinculos $H \in \R^{N\times N}$ donde $N$ es la cantidad de nodos. La fila $i$ de la matriz representa las conexiones entrantes de todos los nodos al nodo $i$ mientras que la columna $j$ representa las conexiones salientes del nodo $j$ hacia todos los nodos de la red.
Por ejemplo, si tenemos la siguiente red:
$$
1 \leftrightarrow 2 \leftrightarrow3 \rightarrow 1
$$
Vamos a generar los siguientes vectores:
$$
\array{
H_1 =& [\array{0 & 1 & 0 }]' \\
H_2 =& [\array{0 & 1/2 & 1/2}]' \\
H_3 =& [\array{1/2 & 0 & 1/2}]' \\
}
$$
Y podemos generar a la matriz de hiper links de la siguiente forma:
$$
H = \{H_1,H_2,H_3\} = \left[\array{
0 & 0 & 1/2 \\
1 & 1/2 & 0 \\
0 & 1/2 & 1/2
}\right]
$$
El algoritmo de PageRank es un algoritmo iterativo:
$$
r^{i+i} = Hr^{i}
$$
Donde $r^i$ es el vector que guarda los rankings de los nodos. Este vector se puede inicializar de varias maneras, aunque las más comunes son inicializarlo con valores aleatorios o con el valor $\frac 1 N.$ 
Eventualmente, cuando $i\rightarrow \infty$ vamos a ver que $r^i$ converge a un valor especifico. Esta es la probabilidad de que el crawler visite a cada uno de estos nodos. Los nodos con mayor probabilidad de ser visitados son los que tienen mayor ranking.

El problema de este método es que es iterativo, y al tener miles de millones de nodos, se hace poco practico multiplicar las matrices. Por esto podemos utilizar el teorema de Perrone-Frobenius y simplificar los calculos. 
El teorema nos garantiza que $\lambda = 1$ es un autovalor. Ademas sabemos que eventualmente el vector de rankings converge, por lo que nos encontramos con la siguiente formula:
$$
Hr = r
$$
Esta formula es igual a la siguiente. Sea $v$ un autovector y $\lambda$ su autovalor asociado, se cumple que:
$$
Hv = \lambda v
$$
**Entonces, si conseguimos el autovector asociado con el autovalor $\lambda = 1$ podemos obtener el vector de los rankings de forma mucho más rápida**.

## Problemas del algoritmo
El algoritmo básico se puede aplicar siempre que se cumplan dos condiciones:
- No puede haber **dead ends**. Esto implica que no puede haber un nodo con entradas y sin salidas. Este caso es fácil de ver ya que en la matriz de hiperlinks vamos a ver una columna cuyos elementos no suman 1. Si existen dead ends, entonces no se puede aplicar el teorema de Perrone-Frobenius y no se puede garantizar que $1$ sea un autovalor.
- No puede haber **spider traps**. Esto implica que hay al menos un nodo que tiene entradas y una  sola salida, que apunta al mismo nodo. Este caso es similar al anterior, pero se cumple el teorema de Perrone-Frobenius. El problema es que el crawler siempre se va a quedar atrapado en ese nodo y no va a poder seguir escaneando la red.

## Optimizaciones
En el caso de encontrarse en una situación donde hay spider traps, podemos ajustar el algoritmo para que el crawler pueda teletransportarse a otro nodo con cierta probabilidad.

El **método de teletransportación** nos dice que podemos modificar a la matriz de hiper vínculos de la siguiente manera:
$$
\mathbb{H} = \beta H + \text{ones(N,N)}\times\frac{1-\beta}{N} 
$$
Donde $\beta \in (0,1)$ es un factor de amortiguamiento, $\text{ones(a,b)}$ es una función que genera una matriz que contiene $1$s de dimensión $a\times b$ y $N$ es la cantidad total de nodos de la red.

Si nos encontramos con dead ends en nuestra red, podemos mitigar sus efectos reemplazando los valores de la columna del nodo que genera el dead end por $\frac 1 N$ y luego aplicar el método de teletransportación. El calculo termina de la siguiente forma:
$$
\mathbb{H} = \beta H + \frac \beta N \text{ones(N,N)} \times e_l'+ \text{ones(N,N)}\times\frac{1-\beta}{N} 
$$
Donde $e_k$ es un vector cuyos valores son 0 excepto por el elemento en la posición $k,$ que es $1$ y $l$ es el nodo que genera el dead end.