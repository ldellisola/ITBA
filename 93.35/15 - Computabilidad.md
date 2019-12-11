# Computabilidad

## Definiciones

- **Estado**: El estado de un programa $P$ es una lista de igualdades `V = m`, una por cada variable que aparece en el programa.

  Por ejemplo, si tengo el siguiente programa:

  ```
  [A1]	X1 <- X1 + 1
  		Y <- Y + 1
  ```

  Podemos decir que `(X1 = 8, Y = 6)` es un estado valido.

- **Snapshot**: Dado un programa $P$ con instrucciones `I1, ...,In`, se define a una snapshot como un par ordenado `(i,G)` donde $i \in \{1,\dots,n+1\}$ y `G` es un estado del programa.

  `i` apunta a que instrucción que próximamente será ejecutada, mientras que `G` es el estado en el programa antes de ejecutar a esa instrucción. 

- **Computo**: Un computo de un programa $P$ a partir de `d1 = (i,G)` es una sucesión finita de snapshots `d1, d2, ..., dk` donde `dj+1` es la instrucción siguiente a `dj` y `dk` es terminal (ultimo del programa).

- **Estado Inicial**: Dado un programa $P$ y números naturales $\mu_1, \mu_2, \dots, \mu_m$, se define al estado inicial como:
  $$
  \tau = (X_1 = \mu_1, X_2 = \mu_2, \dots, X_m = \mu_m, Z_1 = 0, Z_2 = 0, \dots, Z_n = 0, Y=0,X_{n+j}=0)
  $$

- **Función $\psi_P$**: Dado un programa $P$ y un estado inicial $\tau$, existen dos posibles definiciones de esta función:

  1. Si a partir de `d1 = (1,G)` se obtiene un computo, se define como:
     $$
     \psi_P= (\mu_1,\mu_2,\dots,\mu_k) = Y
     $$

  2. Si a partir de `d1 = (1,G)` no se obtiene un computo (la secuencia es infinita), se define como:
     $$
     \psi_P=(\mu_1,\mu_2,\dots,\mu_k) =~ \uparrow
     $$

- **Función Parcialmente Computable**: Sea $f:A\subset\N^k\rightarrow\N$ una función, $f$ es parcialmente computable si existe un programa $P$ tal que:
  $$
  \psi_P(X_1,\dots,X_k)=
  \left\{
  \array{
  		f(X_1,\dots,X_k) && (X_1,\dots,X_k) \in A=dom(f)\\
  		\uparrow		&&	(X_1,\dots,X_k) \notin A = dom(f)
  }
  \right.
  $$

- **Función Computable**: una función es computable si es parcialmente computable y su dominio es $\N^k$

- **Recursión Primitiva de tipo I (ERI)**: Sea $f:\N\rightarrow\N$ una función, decimos que se obtiene por un esquema recursivo de tipo I a partir de:
  $$
  g:\N^2\rightarrow\N\left/
  \array{
  f(0)=k\\
  f(n+1)=g(n,f(n))
  }
  \right.
  $$
  
- **Recursión Primitiva de tipo II (ERII)**: Sea $f:\N^{k+1}\rightarrow\N$, $g:\N^{k+2}\rightarrow\N$, $h:\N^k\rightarrow\N$, se obtiene $f$ por un ERII a partir de $g$ y $h$ si:	
  $$
  f(x_1,\dots,x_k,0) = f(x_1,\dots,x_k)\\
  f(x_1,\dots,x_k,n+1) = g(x_1,\dots,x_k,n,f(x_1,\dots,x_k,n))
  $$

## Teoremas

- **Composición de funciones computables es computable**:

  Sean $f:\N^k\rightarrow\N$, $g_1,\dots,g_k:\N^m\rightarrow \N$ todas funciones computables

  Entonces $h:\N^m\rightarrow\N/h(x_1,x_2,\dots,x_m)=f_o(g_1,g_2,\dots,g_k)$ es computable

  [Demostración](Demos\15 - Computabilidad\Teorema - 01.html) 

- A partir de la definición de **ERI**, podemos decir que si $g$ es computable, entonces $f$ es computable.

  [Demostración](Demos\15 - Computabilidad\Teorema - 02.html)

- A partir de la definición de **ERII**, podemos decir que $g$ y $h$ son computables, entonces $f$ es computable. 

  [Demostración](Demos\15 - Computabilidad\Teorema - 03.html) 