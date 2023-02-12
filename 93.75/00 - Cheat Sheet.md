Apuntes de otras materias [acá](https://ldellisola.github.io/ITBA)
# Matrices
Existen distintos tipos de matrices:
- Matriz **singular**: $A \in \mathbb{R}^{n\times n} : \not \exists A^{-1}$ 
- Matriz **Diagonal**: $A \in \mathbb{K}^{m\times n}: A[i,i] \neq 0\land A[i,j] = 0$
- Matriz **Tridiagonal**: $A \in \mathbb{K}^{m\times n}: A[i,i] \neq 0 \land A[i+1,i] \neq 0 \land A[i-1,i] \neq 0\land A[i,j] = 0$
- Matriz **Triangular Superior**: $A \in \mathbb{R}^{n\times n}: A[i,j] = 0, i<j$
- Matriz **Triangular Inferior**: $A \in \mathbb{R}^{n\times n}: A[i,j] = 0, i> j$
- Matriz **Simétrica**: $A \in \mathbb{R}^{n\times n}: A[i,j] = A[j,i]$
- Matriz **Antisimetrica**: $A \in \mathbb{R}^{n\times n}: A[i,j] = -A[j,i]$
- Matriz **Ortogonal**: $B \in \mathbb{R}^{m\times n}: B'B= I_{n\times n}$
- Matriz **Nilpotente** de orden $k: B \in \mathbb{K}^{m\times n} : A\neq 0 \land \forall n \ge k\ A^n = 0$ 
- Matriz **Involutiva**: $A \in \mathbb{K}^{n\times n} : A^2 = I_n$
- Matriz **Idempotente**: $A \in \mathbb{K}^{n\times n} : A^2 = A$

## Matriz Invertible
Si se tiene $A \in \mathbb{R}^{m\times n},$ se puede asegurar que $\exists A^{-1}$ si se cumple con alguna de estos items:
- $m = n \land \det(A) \gt 0$
- $m = n \land \text{ tiene rango máximo}$

## Operaciones
Sea $A \in \mathbb{K}^{m\times n}:$
- **traza**: $tr(A) = \sum_i^n A[i,i]$
- **transpuesta**: $\text{transpose}(A) = A^T  \in \mathbb{K}^{n\times m}/A^T[i,j] = A[j,i]$
- **rango**: $\text{rank}(A)=$ la cantidad de filas no nulas luego de escalonar a la matriz. $A$ es de **rango máximo** si $\text{rank}(A) = \min(m,n)$
- **transpuesta conjugada**: $A' \in \mathbb{k}^{n\times m}/ A'[i,j] = \overline{A[j,i]}$ 
- **espectro**: $\text{spectre}(A) = \{\lambda_1,\dots\}$ es el conjunto de autovalores.
- **radio espectral**: $\text{spectralRatio}(A) = \max(|\lambda_1|,\dots)$ 
- **pseudoinversa**: $A^+ = (A'A)^{-1}A'$

## Factorización
### Factorización PLU
La factorización PLU intenta de factorizar a una matriz de la siguiente forma:
$$
PA = LU 
$$
Donde $U$ es una matriz escalonada y $L$ es una matriz triangular inferior. Si $\exists A^{-1}$ entonces la factorización es única.
Para obtener esta factorización hay dos tipos de operaciones:
- **permutaciones**: cambiar filas de lugar.
- **ejecuciones**: realizar una operación lineal entre dos filas:
$$
F_i = F_i - (b \times F_j)
$$
Para obtener la matriz $U$ simplemente hay que usar eliminación Gaussiana con estos dos métodos para obtener una matriz triangular superior.
Para obtener la matriz $P$ simplemente hay que aplicar las permutaciones que hicimos sobre la matriz identidad en el mismo orden.
Para obtener la matriz $L$ se parte de la matriz identidad y se la completa de la siguiente forma. Por cada ejecución $F_i = F_i - (b \times F_j)$:
$$
L[i,j] = b
$$
==Es muy **importante** nunca hacer permutaciones antes de realizar una ejecución. Se rompe todo y es mejor tener números raros.==

### Factorización QR
La factorización QR consiste en escribir a la matriz $A \in \mathbb{K}^{m\times n}$ como el producto de una matriz ortonormal $Q$ junto a una matriz $R$ escalonada:
$$
A = QR
$$
Sea $A = [a_1,\dots,a_n$] podemos obtener la matriz $Q$ de la siguiente forma:
1. $\hat q_1 = \frac{a_1}{||a_1||}$
2. $\vec q_i = a_i - \sum_{k=1}^{i-1} \langle a_i,\hat q_k\rangle \hat q_k$ 
3. $\hat q_i = \frac{q_i}{||q_i||}$
Y obtenemos $Q = [\hat q_1,\dots,\hat q_n]$
Para obtener $R$ podemos:
$$
R = Q'A
$$
### Factorización SVD
Sea $A \in \mathbb{K}^{n\times m}$ podes descomponerla de la siguiente forma:
$$
A = USV'
$$
Tal que $U \in \mathbb{K}^{n\times n} \text{ ortonormal},V \in \mathbb{K}^{m\times m} \text{ ortonormal}, S \in \mathbb{K}^{n\times m} \text{ diagonal}.$ 
Para obtener esta factorización hay que seguir 3 pasos:
1. **Busco** $V$ :
	1. Defino a la matriz $M=A'\times A$ y busco sus autovalores y autovectores.
	2. Sean los autovalores $\lambda_1,\dots,\lambda_k$ los asociados a los vectores $\vec v_1,\dots,\vec v_k$ tengo que transformar a los vectores en vectores ortonormales. Si la matriz $M$ es simétrica, entonces solo hace falta normalizarlos y obtenemos:
	  $$
		\hat v_1,\dots ,\hat v_k
	  $$
	1. Ordeno a los autovectores según su modulo, de forma que $\lambda_a \ge \lambda_b \ge \dots \lambda_z$ y creo la matriz $V$ de la siguiente forma:
	  $$
	  V = \left[
	  \array{\hat {v_a}, \dots, \hat v_z}
	  \right]
	  $$
1. **Busco** los valores singulares y la matriz $S:$
	1. Usando los autovalores obtenidos anteriormente y ordenados según su modulo, puedo crear la siguiente matriz:
	  $$
		S_{ii} = \sqrt\lambda_i
	  $$
	2. De ser necesario, completo el resto de los campos con $0.$ Si algunos de los autovalores son $0$ entonces puede que no entren en la matriz $S$ y esta bien.
3. **Busco** $U$ :
	1.  Defino a la matriz $B=A\times A'$ y busco sus autovalores y autovectores.
	2. Sean los autovalores $\lambda_1,\dots,\lambda_k$ los asociados a los vectores $\vec u_1,\dots,\vec u_k$ tengo que transformar a los vectores en vectores ortonormales. Si la matriz $B$ es simétrica, entonces solo hace falta normalizarlos y obtenemos:
	  $$
		\hat u_1,\dots ,\hat u_k
	  $$
	3. Ordeno a los autovectores según su modulo, de forma que $\lambda_a \ge \lambda_b \ge \dots \lambda_z$ y creo la matriz $V$ de la siguiente forma:
	  $$
	  U = \left[
	  \array{\hat {u_a}, \dots, \hat u_z}
	  \right]
	  $$
### Diagonalización
Se puede descomponer a una matriz $A\in \mathbb{R}^{n\times n}$ si tiene $n$ autovalores distintos:
$$
A = S^{-1}DS
$$
Tengo que seguir los siguientes pasos:
1. Calcular los autovalores y sus autovectores correspondientes.
2. Ordenar los autovalores $\lambda_1,\dots,\lambda_n$ de forma tal que $|\lambda_1| \ge \dots \ge |\lambda_n|$ 
3. Creo la matriz $D \in \mathbb{K}^{n\times n}$ tal que $D[i,i] = \lambda_i$
4. Creo la matriz $S \in \mathbb{K}^{n\times n} = [\vec v_1,\dots, \vec v_n]$ 

Esta diagonalización es util para calcular potencias de nuestra matiz original:
$$
A^n = S D^n S^{-1}
$$
La matriz $D$ es llamada **matriz de paso**.

# Vectores
Se dice que los vectores son:
- **normales** si $\langle v,v\rangle = 1$  
- **ortogonales** si $\langle v,w\rangle = 0$
- **ortonormales** si cumplen con ambas propiedades.

## Dependencia Lineal
Decimos que un conjunto de vectores $v_i$ es **linealmente dependiente** si:
$$
\exists a_i \neq 0 \in \mathbb{K} / \vec 0= \sum_{j} \alpha_j v_j
$$
Si la única forma de obtener el vector $\vec 0$ es con todos los coeficientes nulos, entonces se dice que es **linealmente independiente**.
## Proyectores
Se define a la función proyector de un vector $\vec u$ de la siguiente forma:
$$
P_{\vec u}(\vec x) = \frac{\langle \vec x, \vec u\rangle}{\langle \vec u,\vec u \rangle} \vec u = \langle \vec x,\hat u\rangle \hat u
$$
## Método Gram-Schmidt
El método Gram-Schmidt sirve para convertir a un conjunto de vectores en un conjunto ortonormal. 
Si tengo a un conjunto de vectores $\{\vec v_1,\dots,\vec v_n\}$ puedo convertirlos en ortonormales aplicando los siguientes pasos a cada vector $\vec v_i:$
$$
\array{
1. & \vec q_i = \vec v_i - \sum_{k=1}^{i-1} P_{\vec v_k}(\vec v_i) \\
2. & \hat q_i = \frac{\vec q_i}{||\vec q_i}
}
$$
El método de **Gram-Schmidt modificado** es ...

# Espacios Vectoriales
$\mathbb V$ es un espacio vectorial si cumple con:
1. $a,b\in \mathbb{V} \implies a+b \in \mathbb{B}$
2. $a,b\in \mathbb{V}: a+b = b+a$
3. $a,b,c\in \mathbb{V}: (a + b) + c = a + (b+c)$
4. $a\in \mathbb{V}, \exists \vec 0\in \mathbb{V}: a + \vec 0 = a$
5. $a,b\in \mathbb{V}: a + b = \vec 0$
6. $a,b\in \mathbb{V}, \alpha \in \mathbb{K}: \alpha(a+b) = \alpha a + \alpha b$

## Subespacios Vectoriales
$\mathbb {W}$ es un subespacio de $V$ si cumple con:
1. $\#\mathbb{W} \ge 1$
2. $a,b\in \mathbb{W} \implies a+b \in \mathbb{W}$
3. $a\in \mathbb{W}, \alpha \in \mathbb{K} \implies \alpha a \in \mathbb{W}$

## Producto Interno
El producto interno es una operación definida sobre un espacio vectorial $\mathbb{V}$ como:
$$
\langle \cdot,\cdot \rangle: \mathbb{V} \times \mathbb{V} \rightarrow\mathbb{K}
$$
Que satisface las siguientes condiciones para todos los $\vec u,\vec v,\vec w \in \mathbb{V}, \alpha \in \mathbb{K}:$
1. $\langle \vec u + \vec v,\vec w\rangle = \langle \vec u,\vec w\rangle + \langle \vec v,\vec w\rangle$
2. $\langle \alpha\vec u,\vec v\rangle = \alpha \langle \vec v,\vec v\rangle$
3. $\langle \vec u,\vec v\rangle = \langle \vec v,\vec u\rangle^*$ donde $*$ denota el conjugado de un número complejo.
4. $\langle \vec u,\vec u\rangle \in \mathbb{R}$ y $\langle \vec u,\vec u\rangle \ge 0$


El producto interno se define de distintas formas según el cuerpo que se este usando. El producto interno más utilizado con los espacios $\mathbb{K}^n$ es:
$$
\langle \vec u,\vec v\rangle = \sum_{i=0}^n u_i v_i
$$
Para espacios funcionales se suele definir de la siguiente forma:
$$
\langle f,g\rangle = \int_{-\infty}^\infty f(x)g(x)dx
$$
## Norma
La norma es una función que se define de la siguiente forma:
$$
||\vec v|| = \sqrt{\langle \vec v,\vec v \rangle}
$$
Aunque también se pueden definir otras normas:
- $||\vec v||_i = \sqrt[i]{\sum_{k=1}^n |u_k|^k}$ 
- $||\vec v||_\infty =\max(v_i)$
- Sea $A\in \mathbb{K}^{n\times m}: ||A||_k = \sqrt[k]{\sum_{j=1}^m\sum_{i=1}^n |A[i,j]|^k}$
- Sea $A \in \mathbb{K}^{m\times n}: ||A||_F = ||A||_2$

## Espacios Normados
Son espacios vectoriales donde esta definida la norma. Tienen que cumplir con 4 condiciones:
1. $||\alpha\vec v|| = \alpha ||\vec v ||$
2. $||\vec v|| = 0 \iff \vec v = \vec 0$
3. $||\vec v || \ge 0$
4. $||\vec v + \vec u || \le ||\vec v || + || \vec u||$

## Espacios de Funciones
Los espacios funcionales están definidos de la siguiente forma 
$$
L^n(\mathbb{K}) = \left\{ f: \mathbb{R} \rightarrow \mathbb{R}/ \int_{-\infty}^\infty |f(x)^n dx \lt \infty \right\}
$$
Especialmente los espacios $L^1,L^2$ son espacios de funciones completos y normados. Para estos campos se define la siguiente norma:
$$
\array{
L^1 :& ||f|| = \int_{-\infty}^\infty |f(x)| dx\\
L^2 :& ||f|| = \sqrt{\int_{-\infty}^\infty |f(x)|^2 dx}\\

}
$$
## Generadores
Dado un conjunto de vectores $B = \{\vec b_j\}^n_1$ definimos al espacio generado por $B:$
$$
\text{gen}(B) = \left\{\array{

\vec u \in \mathbb{V}/\vec u = \sum_j^n \alpha_i\vec b_i

}\right\}
$$
El **rango** de un conjunto es la cantidad de vectores linealmente independientes:
$$
\text{rank}(B)= \dim(B) =\# \text{vectores LI de }B
$$
## Bases
Un conjunto $B$ es una **base** de un espacio $\mathbb{V}$ si tiene la cantidad maxima de vectores linealmente independientes:
$$
B \text{ es base de }\mathbb{V} \iff \text{rank}(B) = \text{rank}(\mathbb{V}) 
$$
Todo vector puede ser representado en distintas bases. Sea $B = \{b_1,\dots,b_n\}$  una base, el vector $\vec v$ se representa de la siguiente forma:
$$
\vec v = \alpha_1 b_1 + \dots +\alpha_n b_n
$$
Y también puede ser representado según sus coordenadas en la base $B:$
$$
[\vec v]_B = (\alpha_1,\dots,\alpha_n)
$$
## Espacios Asociados a una Matriz
Sea $B\in \mathbb{R}^{m\times n} = [b_1,\dots,b_n]$ definimos a:
- El **espacio columna** de $B:\text{col}(B) = \text{gen}(\{b_1,\dots,b_n\})$ 
- El **espacio fila** de $B: \text{row}(B)$ como el subespacio generado por las filas de la misma.
- El **espacio nulo** de $B: \text{nul}(B) = \text{gen}(\{\vec x \in \mathbb{K}^m/B\vec x = \vec 0\})$

# Sistemas de Ecuaciones Lineales
Un sistema de ecuaciones lineales es:
- **compatible determinado** cuando admite una solución única.
- **compatible indeterminado** cuando admite infinitas soluciones.
- **incompatible** cuando no admite soluciones.

Se puede definir el tipo de sistema de ecuaciones lineales según el rango de la matriz $A$ y su matriz ampliada ($A^+$):
- El sistema es **incompatible** si $\text{rank}(A) > \text{rank}(A^+)$
- El sistema es **compatible determinado** si $\text{rank}(A) = \text{rank}(A^+)$
- El sistema es **compatible indeterminado** si $\text{rank}(A) < \text{rank}(A^+)$

## Resolución Mediante Factorización PLU
Como las matrices $L,U$ son escalonadas, la resolución  de un sistema de ecuaciones con esta factorización es rápida. Si queremos resolver el siguiente sistema:
$$
A\vec x = \vec b
$$
Podemos aplicar la factorización:
$$
\array{
(I)&PA\vec x = P\vec b\\
(II) & LU\vec x = P \vec b
}
$$
Y se divide en dos sistemas lineales:
$$
\left\{\array
{
L\vec v = P \vec b\\
U \vec x = \vec v
}\right.
$$
## Resolución  Mediante Factorización QR
Sea el sistema de ecuaciones:
$$
A \vec x = \vec b
$$
Podemos resolverlo de la siguiente forma:
$$
\array{
(I)& QR \vec x = \vec b\\
(II) & R \vec x = Q' \vec b
}
$$
## Sistemas Dinámicos Lineales
Son sistemas de ecuaciones definidos de forma recursiva. Por ejemplo:
$$
\array{
x_{n+1} = x_n + y_n\\
y_{n+1} = x_n - y_n
}
$$
Estos sistemas se pueden representar como:
$$
U_n = A^nU_0
$$
Para resolver este problema problema podemos obtener los autovectores y autovalores de $A$ y plantear la solución como:
$$
[x_1,\dots,x_k] = \alpha_1 \lambda_1^n\vec v_1 + \dots +\alpha_m\lambda_m^n\vec v_m
$$
Ademas, si nos interesa saber que pasa cuando $n\rightarrow \infty$ podemos diagonalizar a la matriz $A:$
$$
A^\infty = S D^\infty S^{-1}
$$
Y los valores en la diagonal nos van a dar las distribuciones estabilizadas.

# Autovalores y Autovectores
Sea $A \in \mathbb{K}^{n\times n}, \vec x \neq \vec 0 \in \mathbb{K}^n,\lambda \in \mathbb{K}$ tal que se cumple:
$$
A\vec x = \lambda \vec x
$$
Entonces $\lambda$ es un autovalor y $\vec x$ es su autovector asociado.
Los autovalores son todos los $\lambda$ tal que:
$$
\det(A-\lambda I_{n\times n}) = 0
$$
Luego, con cada valor $\lambda_i$ encontrado podemos tener sus autovectores asociados:
$$
(A-\lambda_iI_{n\times n})\vec x = 0
$$
La **multiplicidad algebraica** es la cantidad de veces que se repite un autovalor, mientras que la **multiplicidad geométrica** es la cantidad de autovectores asociados que tiene cada autovalor. Se cumple:
$$
1 \le m_g(\lambda) \le m_a(\lambda) \le n
$$
Se llama **autovalor dominante** si cumple con:
- $m_a(\lambda_i) = 1$
- $|\lambda_i| \gt \max(\{|\lambda_1|,\dots\} - \{\lambda_i\})$
## Propiedades
1. Si $(\lambda,\vec v)$ son un autopar de una matriz $A,$ entonces $(\lambda,\alpha\vec v), \alpha \neq 0$ también lo es.
2. Si $\lambda$ es autovalor de $A,$ también lo es de su transpuesta.
3. Si $\lambda$ es un autovalor de $A,$ $\lambda^-1$ es el autovalor de su inversa.
4. Si $\lambda$ es el autovalor de $A,$ $\lambda-\alpha$ lo es de $A - \alpha \mathbb I.$
5. Si $\lambda$ es el autovalor de $A,$ $\lambda^k$ lo es de $A^k.$
6. Si $A$ es una matriz real, es diagonalizable si tiene $n$ autovalores distintos.
7. Si una matriz es triangular superior (o inferior) su determinante es el producto de los elementos de su diagonal y sus autovalores son los elementos de esta diagonal.

## Método de las Potencias
Este método nos permite calcular de manera iterativa el autovector y autovalor dominante de una matriz.
Sea $\vec v_0$ una seed:
$$
\array{
 \hat v_i = \frac{ \vec v_i }{ ||\vec v_i|| } \\
 \vec v_{i+1} = A \hat v_i\\
 \lambda_{i+1} = \langle \vec v_{i+1},\hat v_{i}\rangle
 
}
$$
Este proceso se repite hasta que $|A\hat v_k - \lambda_k \hat v_k| < \text{tol}$ 

## Método de las Potencias Inverso
Este método nos permite calcular de manera iterativa el autovalor de menor modulo y su autovector.
Sea $A \in \mathbb{K}^{n\times n}$ una matriz inversible y $v_0$ una seed:
$$
\array{
 \hat v_i = \frac{ \vec v_i }{ ||\vec v_i|| } \\
 \vec v_{i+1} = A^{-1} \hat v_i\\
 \lambda_{i+1} = \langle \vec v_{i+1},\hat v_{i}\rangle
}
$$
Este proceso se repite hasta que $|A^{-1}\hat v_k - \lambda_k \hat v_k| < \text{tol}$ 
Este método funciona asumiendo que el autovalor de menor modulo de $A$ es a su vez el autovalor de mayor modulo de $A^{-1}.$

## Método QR
Sea $A \in \mathbb{K}^{n\times n}$ definimos a $A_0 = A.$ Cada iteración tiene la siguiente forma:
$$
A_i = Q_iR_i \implies A_{i+1} = R_iQ_i
$$
Cuando la matriz $A_n$ tiene todos los elementos debajo de su diagonal cercanos a $0$ podemos frenar el proceso y los autovalores serán los números en la diagonal de la matriz $A_n.$

# Transformaciones Lineales
Una transformación lineal es una función $T:\mathbb{V} \rightarrow \mathbb{W}$ que cumple con:
$$
\forall \vec u,\vec v \in \mathbb{V}:
T(\vec u + \alpha \vec v) = T(\vec u) + \alpha T(\vec v)
$$
Las transformaciones lineales también se pueden definir en base a su matriz asociada:
$$
T:\mathbb{V} \rightarrow \mathbb{W} / T(\vec x) = M\vec x
$$
La matriz $M$ va a ser formada teniendo en cuenta las dimensiones del dominio y la imagen, así como también las bases de los espacios vectoriales.

## Matriz de Cambio de Base
La matriz de cambio de base es una transformación lineal donde el dominio y la imagen son el mismo espacio vectorial:
$$
T: \mathbb{V}_B \rightarrow \mathbb{V}_{B'}/T(\vec x) = C\vec x
$$
La matriz asociada $C$ tiene como columnas las coordenadas de los vectores de $B'$ expresadas en $B.$ Como la matriz $C_{BB'}$ es de rango máximo, su inversa es la matriz asociada a la transformación:
$$
T: \mathbb{V}_{B'} \rightarrow \mathbb{V}_{B}/T(\vec x) = C^{-1}\vec x
$$
## Espacios Fundamentales de una Transformación Lineal
Existen 3 subespacios fundamentales asociados a una transformación lineal:
$$
T : \mathbb{V} \rightarrow \mathbb{W} /T(\vec x) = M\vec x
$$
- El espacio **columna**: $\text{col}(T) = \text{col}(M)$ es el espacio generado por las columnas de la matriz.
- El espacio **fila**: $\text{row}(T) = \text{row}(M)$ es el espacio generado por las filas de la matriz.
- El espacio **nulo**: $\text{nul}(T) = \left\{\vec x:T(\vec x)= \vec 0\right\}$  
$$
\dim(\mathbb{V}) = \dim(\text{nul}(M)) + \dim(\text{col}(M))
$$
El **núcleo** de una transformación lineal se obtiene a partir del espacio nulo:
$$
\text{nucleo}(T) = \text{gen}(\text{nul}(T))
$$
La **imagen** de una transformación lineal se obtiene a partir del espacio columna:
$$
\text{Im}(T) = \text{gen}(\text{col(M)})
$$

# PageRank
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
Y podemos generar a la matriz de hiperlinks de la siguiente forma:
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
El algoritmo basico se puede aplicar siempre que se cumplan dos condiciones:
- No puede haber **dead ends**. Esto implica que no puede haber un nodo con entradas y sin salidas. Este caso es facil de ver ya que en la matriz de hiperlinks vamos a ver una columna cuyos elementos no suman 1. Si existen dead ends, entonces no se puede aplicar el teorema de Perrone-Frobenius y no se puede garantizar que $1$ sea un autovalor.
- No puede haber **spider traps**. Esto implica que hay al menos un nodo que tiene entradas y una  sola salida, que apunta al mismo nodo. Este caso es similar al anterior, pero se cumple el teorema de Perrone-Frobenius. El problema es que el crawler siempre se va a quedar atrapado en ese nodo y no va a poder seguir escaneando la red.

## Optimizaciones
En el caso de encontrarse en una situación donde hay spider traps, podemos ajustar el algoritmo para que el crawler pueda teletransportarse a otro nodo con cierta probabilidad.

El **método de teletransportación** nos dice que podemos modificar a la matriz de hiper vinculos de la siguiente manera:
$$
\mathbb{H} = \beta H + \text{ones(N,N)}\times\frac{1-\beta}{N} 
$$
Donde $\beta \in (0,1)$ es un factor de amortiguamiento, $\text{ones(a,b)}$ es una función que genera una matriz que contiene $1$s de dimensión $a\times b$ y $N$ es la cantidad total de nodos de la red.

Si nos encontramos con dead ends en nuestra red, podemos mitigar sus efectos reemplazando los valores de la columna del nodo que genera el dead end por $\frac 1 N$ y luego aplicar el metodo de teletransportación. El calculo termina de la siguiente forma:
$$
\mathbb{H} = \beta H + \frac \beta N \text{ones(N,N)} \times e_l'+ \text{ones(N,N)}\times\frac{1-\beta}{N} 
$$
Donde $e_k$ es un vector cuyos valores son 0 excepto por el elemento en la posición $k,$ que es $1$ y $l$ es el nodo que genera el dead end.
# Cuadrados Mínimos
Es un método para aproximar a una función en base a valores conocidos de la misma. En este ejercicio te dan una lista de puntos con el valor de la función y a la vez te dan la función a la cual hay que calcular los coeficientes.
Para los proximos métodos vamos a asumir que tenemos que aproximar la función a una función lineal:
$$
Y = a x + b
$$
Donde no conocemos los valores de $a,b.$
## Método Algebraico
Primero hay que encontrar el error cuadrado:
$$
|Err|^2 = \frac 1 n \sum_{i=1}^n |y_i-(ax_i+b)|^2
$$
Luego, debemos derivar al error cuadrado por cada incognita que queremos encontrar:
$$
\array{
\frac {\partial |Err|^2}{\partial a}=0=|Err|^2 = \frac 2 n \sum_{i=1}^n (y_i-(ax_i+b))(-x_i) \\
\frac {\partial |Err|^2}{\partial b}=0=|Err|^2 = \frac 2 n \sum_{i=1}^n (y_i-(ax_i+b))(-1)
}
$$
Puedo separar a estas funciones en los términos que multiplican a las incognitas y formar un sistema de ecuaciones:
$$
\left[\array{
\sum x_i^2 & \sum x_i\\
\sum x_i  & n
}\right] 
\left[
\array{
a \\ b
}
\right] = 
\left [
\array{
\sum y_ix_i\\
\sum y_i
}
\right]
$$
Podemos resolver este sistema lineal y obtener los valores de nuestros coeficientes.
## Método Numérico
Esta solución es más simple. Tenemos que plantear la función en cada punto conocido. Por ejemplo, si nuestra función es conocida en $[x_1,x_2,x_3]:$
$$
\array{
y(x_1) = a x_1 +b\\
y(x_2) = a x_2 +b\\
y(x_3) = a x_3 +b\\
}
$$
En base a esto podemos plantear el siguiente sistema de ecuaciones:
$$
\left[\array{
x_1 & 1\\
x_2 & 1\\
x_3 & 1\\
}\right] \left[\array{
a \\ b
}\right] = \left[\array{
y(x_1)\\
y(x_2)\\
y(x_3)
}\right]
$$
Al solucionar al sistema este encontramos los coeficientes de nuestra aproximación.
# Funciones Periódicas
Las funciones periódicas son aquellas para las cuales se cumple:
$$
\exists T \gt 0/\forall t:f(t+T) = f(T)
$$
Se denomina **periodo fundamental** al menor $T_0$ que cumple con la condición de función periódica.
Sean $f,g$ funciones periódicas, se dice que 
$$
f+g \text{ es periódica} \iff \frac{T_f}{T_g} \in \mathbb{Q}
$$
Sea $T_f = \frac{p_f}{q_f}, T_g = \frac{p_g}{q_g}$ los periodos de las funciones $f,g,$ el periodo de la suma de ambas es:
$$
T_{f+g} = \frac{\text{mcm}(p_f,p_g)}{\text{mcd}(q_f,q_g)} \pi
$$
## Extensión de Funciones
Si una función no es periódica, se la puede extender de manera par o impar para que lo sea.
Para poder realizar este proceso debemos acotar a nuestra función en un rango $[a,b]$ y extenderla periodicamente con el periodo $|b-a|$
Si quiero hace una **extensión par** de la función $f:\mathbb{R} \rightarrow \mathbb{R}$ debo definir a la nueva función:
$$
g:\mathbb{R} \rightarrow \mathbb{R}/ g(x) = \left\{
\array{
f(x) & x \in [0,b]\\
f(-x) & x \in [-b,0]
}
\right.
$$
Si quiero 
hace una **extensión impar** de la función $f:\mathbb{R} \rightarrow \mathbb{R}$ debo definir a la nueva función:
$$
g:\mathbb{R} \rightarrow \mathbb{R}/ g(x) = \left\{
\array{
f(x) & x \in [0,b]\\
-f(-x) & x \in [-b,0]
}
\right.
$$

# Series de Fourier
Sea $f$ una función con periodo $T$ que cumpla con las **condiciones de Dirichlet**:
1. $f$ tiene un número finito de discontinuidades en $[0,T]$
2. $f$ tiene un número finito de extremos en el intervalo $[0,T]$
3. $f \in L^2$
Se puede reescribir como una serie de Fourier.
En los puntos de discontinuidad $t_i$ la serie converge al promedio de los puntos que lo rodean:
$$
S_f(t_i) = \frac{S_f(t_i^+) + S_f(t_i^-)}{2}
$$
## Serie Trigonométrica
$f$ se puede reescribir usando la formula trigonométrica:
$$
S_f(x) = \frac {a_0} 2 + \sum_{n=1}^\infty a_n cos\left(\frac{2\pi n}{T} x\right) + \sum_{n=1}^\infty b_n \sin\left(\frac{2\pi n}{T} x\right)
$$
$$
a_0 = \frac 2 T \langle 1,f(x)\rangle = \frac 2 T \int_{-\infty}^\infty f(x) dx
$$
$$
a_n = \frac 2 T \left\langle \cos\left(\frac{2\pi n}{T}x\right) f(x) \right\rangle
 = \frac 2 T \int_{-\infty}^\infty f(x) \cos\left(\frac{2\pi n}{T}x\right) dx
$$
$$
b_n = \frac 2 T \left\langle \sin\left(\frac{2\pi n}{T}x\right) f(x) \right\rangle
 = \frac 2 T \int_{-\infty}^\infty f(x) \sin\left(\frac{2\pi n}{T}x\right) dx
$$
Si la función $f$ es par, entonces $\forall n: b_n = 0$
Si la función $f$ es impar, entonces $\forall n: a_n = 0$
## Serie Exponencial
$f$ se puede reescribir usando la formula exponencial:
$$
S_f(x) = \sum_{n=-\infty}^\infty c_n e^{\frac{2\pi n i }{T}x}
$$
$$
c_n = \frac 2 T \left\langle e^{\frac{-2\pi n}{T}xi},f(x) \right\rangle = \frac 2 T \int_{-\infty}^\infty f(x)e^{\frac{-2\pi n}{T}xi} dx
$$
## Serie en Amplitud y Fase
$f$ se puede reescribir usando el desarrollo en amplitud y fase:
$$
S_f(x)= \frac {a_0}{2} + \sum_{k=1}^\infty A_k\cos\left( \frac{2\pi k}{T} x + \phi_k \right)
$$
## Conversiones
Sea $S_f$ una serie trigonométrica con coeficientes $a_0,a_n,b_n$ se puede transformar en una serie exponencial con coeficiente $c_n:$
$$
c_n = \left\{
\array{
\frac{a_n+ib_n}2&n \in (-\infty,0)\\
\frac {a_0} 2 & n = 0 \\
\frac{a_n - i b_n}{2} & n \in (0,\infty)
}
\right.
$$
Sea $Sg$ una serie exponencial con coeficientes $c_n$ se puede transformar en una serie trigonométrica con coeficientes $a_0,a_n,b_n:$
$$
a_0 = 2c_0
$$
$$
a_n = c_n + c_{-n}
$$
$$
b_n = i(c_n - c_{-n})
$$
Sea $S_f$ una serie trigonométrica con coeficientes $a_0,a_n,b_n$ se puede transformar en un desarrollo en amplitud y fase con coeficiente $A_k,\phi_k:$
$$
A_k = \sqrt{a_n^2 + b_n^2}
$$
$$
\cos(\phi_k) = \frac{a_k}{A_k}
$$
$$
\sin(\phi_k) = \frac{b_k}{A_k}
$$
## Fenómeno de Gibbs
El fenómeno de Gibbs consiste en que la aproximación tiende a aproximar por encima o por debajo del valor correcto cerca de las discontinuidades de la función al agregar más términos a la serie de Fourier.
## Propiedades
- **Linealidad**: Sean $f,g$ funciones con el mismo periodo representadas por $c_n,c_n'$ respectivamente, podemos decir que la serie de Fourier de la función $\alpha f(x) + \beta g(x)$ esta representada por $\alpha c_n + \beta c_n'$ 
- **Igualdad de Parseval**: Sea $f$ una función representada por $a_0,a_n,b_n$ o por $c_n$ se verifica que:
$$
\frac 1 T \int_0^T |f(x)|^2 dx = \sum_{n=-\infty}^\infty |c_n|^2 = \left(\frac{a_0}2\right)^2 + \frac 1 2 \sum_{n=1}^\infty a_n^2 + b_n^2
$$
- **Derivación**: Sea $f$ una función representada por una serie de Fourier $S_f$ podemos decir que $g(x) = \frac{\partial f(x)}{\partial x}$ es representada por la serie de Fourier $S_g = \frac{\partial S_f(x)}{\partial x}$
- **Integración**: Sea $f$ una función representada por una serie de Fourier $S_f$ podemos decir que $g(x) = \int f(x)dx$ es representada por la serie de Fourier $S_g(x) = \int S_f(x)dx$

# Transformada de Fourier
La transformada de Fourier nos permite descomponer a una señal en sus frecuencias fundamentales.
## Transformada Continua de Fourier
La transformada continua se usa solo cuando se trabaja con señales finitas o infinitas, pero estas decaen a 0.
La transformada se puede obtener en base a la **frecuencia angular** $(w):$
$$
G(w) = \int_{-\infty}^\infty g(x)e^{-iwx} dx
$$
También se puede obtener en base a la **frecuencia** $(f):$
$$
G(f) = \int_{-\infty}^\infty g(x)e^{-2\pi fix} dx
$$
Ya que $w = 2\pi f.$
## Transformada Inversa de Fourier
Sea $G$ la transformada de Fourier continua en base a la **frecuencia angular** $(w)$ de la función $g:$
$$
g(x) = \frac 1 {2\pi} \int_{-\infty}^\infty G(w)e^{wti}dw
$$
Sea $G$ la transformada de Fourier continua en base a la **frecuencia** $(f)$ de la función $g$:
$$
g(x) = \frac 1 {2\pi} \int_{-\infty}^\infty G(f) e^{2\pi f i x}df
$$
## Transformada Discreta de Fourier
Sea $x[n] = \{x_1,\dots,x_N\}$ una serie de N puntos y $g[n] = \{g(x_1),\dots,g(x_N)\}$ una función evaluada en los puntos mencionados.
La transformada de Fourier discreta de $g$ en base a la **frecuencia angular** $(w)$ es:
$$
G[k] = \sum_{n=0}^{N-1} g[n] e^{-iwnk}
$$
La transformada de Fourier discreta de $g$ en base a la **frecuencia** $(f)$ es:
$$
G[k] = \sum_{n=0}^{N-1} g[n] e^{-i\frac{2\pi n}{N}k}
$$
## Transformada Discreta Inversa de Fourier
Sea $G$ la transformada discreta en base de la **frecuencia** $(f)$ de la función $g$ puedo obtener:
$$
g[n] = \frac 1 N \sum_{k=0}^{N-1} G[k]e^{i\frac{2\pi n}{N} k}
$$
Sea $G$ la transformada discreta en base a la **frecuencia angular** $(w)$ de la función $g$ puedo obtener:
$$
g[n] = \frac 1 N \sum_{k=0}^{N-1}G[k] e^{i wnk}
$$
## Análisis de Frecuencias
A partir de las muestras podemos descubrir las frecuencias presentes en la misma. Para hacerlo tenemos que definir una frecuencia de muestreo. Si queremos que no haya frecuencias fantasma, tenemos que elegir una **frecuencia de muestreo** $(f_M)$ tal que:
$$
f_M \gt 2 \times f_{max}
$$
A esto se lo conoce como el **teorema de Nyquist** y el fenómeno se conoce como frecuencias fantasma o aliasing.
Si conocemos las frecuencias de la señal, podemos analizar donde se presentaria el aliasing:
$$
f_\text{aliasing} = \left| 
f - f_M\times \text{round}\left(
\frac {f}{f_M}
\right)
\right|
$$


# Diferencias Finitas
Este método busca aproximar el valor de una derivada en un punto usando puntos cercanos de la función.
Por ejemplo, queremos aproximar a la $f'(x_i)$ con los puntos $x_{i-1},x_i,x_{i+1}$ 
$$
f'(x_i) = \alpha f(x_{i-1}) + \beta f(x_i) + \gamma f(x_{i+1}) + \text{Err}
$$
Planteamos el polinomio de Taylor para la función en cada punto a analizar:
$$
\array{
f(x_{i-1}) = f(x_i) - hf'(x_i) + \frac {h^2} {2} f''(x_i)  - \dots \\
f(x_{i}) = f(x_i) \\
f(x_{i+1}) = f(x_i) + hf'(x_i) + \frac {h^2} {2} f''(x_i)  + \dots \\
}
$$
Reemplazamos estos valores en nuestra primer ecuación y tenemos:
$$
\array{
f'(x_i) &=&
f(x_i) (\alpha + \beta +\gamma) \\
&+ & hf'(x_i) (-\alpha + \gamma ) \\
&+& \frac{h^2}{2} f''(x_i) (\alpha + \gamma) \\
&+& \dots
}
$$
Resolvemos este sistema de ecuaciones y obtenemos los valores de los coeficientes. La cantidad de términos del polinomio de Taylor depende de la cantidad de puntos. Por lo general, si se tiene 3 puntos se utiliza un polinomio de 4 términos donde el ultimo termino representa al error.
## Error
El **error de truncamiento** se puede acotar de la siguiente forma:
$$
\text{Err}_T \lesssim Mh^{a-b}
$$
Donde $a$ representa a la cantidad de puntos a utilizar $+1$ mientras que $b$ representa a que derivada se quiso aproximar.
El **error de representación** se obtiene puede acotar de la siguiente forma:
$$
\text{Err}_R = \frac{\epsilon_1 - \epsilon_2}{h} \le 2 \frac{\epsilon_M}{h}
$$
El **error total** se calcula de la siguiente forma:
$$
\array{
\text{Err} =& f'(x_0) - \tilde f'(x_0) \\
& f'(x_0) - \frac{f(x_0 + h)+ e_1 - f(x_0)-e_2}{h} \\
& \left[f'(x_0) - \frac{f(x_0+h)-f(x_0)}{h}\right] + \frac{e_1-e_2}{h}\\
\text{Err} \le &\text{Err}_t + \text{Err}_R 
}
$$
## Derivadas Precalculadas
- $y'= \frac{y_{n+1}-y_n}{h}$
- $y' = \frac{y_n - y_{n-1}}{h}$
- $y' = \frac{y_{n+1}-y_{n-1}}{2h}$
- $y''=\frac{y_{n+1}-2y_n+y_{n+1}}{h^2}$
# Ecuaciones Diferenciales
## Metodos de Discretización
Existen 3 métodos de discretización:
- **Método Explicito**:
$$
y' = f(t_n,y_n)
$$
- **Método Implícito**
$$
y' = f(t_{n+1},y_{n+1})
$$
- **Método de Crank-Nicolson**
$$
y' = \frac{f(t_{n+1},y_{n+1}) + f(t_n,y_n)}{2}
$$
El método implícito y explicito son de primer orden, mientras que el método de Crank-Nicolson es de segundo orden.
## Initial Value Problem
Es un método para resolver una ecuación diferencial en un punto especifico.
Sea $y' = f(t,y)$ una EDO y $y(x_i)=a$ puedo resolver la ecuación de la siguiente forma:
1. Discretizo la EDO utilizando uno de los siguientes métodos:
	- Método Explicito
	- Método Implícito
	- Método de Crank-Nicolson
2. Despejo la ecuación para que $y_{n+1}$ quede en función de $y_n, t_n$ 
3. A partir de $x_i$ itero aumentando el valor por $h$ en cada iteración hasta llegar la valor deseado.
## Border Value Problem
Es un método para resolver EDOs en una serie de puntos. Dependiendo del tipo de problema se puede encarar de 3 formas:
- **Condiciones de Dirichlet**: Se conoce el valor de la función al inicio y al final del dominio.
- **Condiciones de Neumann**: Se conoce solo el valor de la derivada en dos puntos.
- **Condiciones Mixtas**: Es una mezcla de ambos métodos.
Para resolver estos problemas hay que seguir los siguientes pasos:
1. **Discretizar el dominio de interés**: Tener nuestro dominio $L = (b-a)$ y la cantidad de puntos internos $N_I$ para calcular la cantidad de nodos totales $N = 2+ N_I$ y el tamaño del paso $h=\frac{L}{N-1}$
2. **Elegir el esquema para representar a las derivadas**: Ya sea explicito, implícito o de Crank-Nicolson.
3. **Escribir la ecuación en diferencias para los nodos internos**
4. **Escribir las ecuaciones correspondientes a las condiciones iniciales o derivadas**
5. **Formar la matriz del problema algebraico**
6. **Resolver con** `linsolve`
7. **Calcular el error de la solución**

## Ecuaciones de Segundo Orden
==Ni idea de esto, suerte==
Las ecuaciones de segundo orden lineales se escriben de la siguiente forma:
$$
A u_{x_1x_1} + Bu_{x_1x_2} + Cu_{x_2x_2} +Du_{x_1} + E u_{x_2} + Fu +D = 0
$$
Dependiendo de los parámetros $A,B,C,D$ se puede determinar el comportamiento de la ecuación. Por ejemplo, se puede saber si la ecuación es **parabólica**, **hiperbólica** o **Elíptica**:
$$
B^2-4AC = \left\{
\array{
>0 & \text{Hiperbólica} \\
=0 & \text{Parabólica}\\
< 0 & \text{Elíptica}
}\right.
$$
Si hay una variable temporal se debe especificar el estado inicial del sistema (problema IVP). Para las variables espaciales se deben especificar las condiciones de Dirichlet, Neumann o Mixtas.

