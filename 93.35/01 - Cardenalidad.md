# Cardinalidad

## Coordinabilidad

### Definición

Sean $A,B$ conjuntos, $A\sim B$ si $\exist f :A \rightarrow B/f$ sea una función biyectiva.

### Notación

Si $A$ es coordinable con $B$, entonces se lo nota como:
$$
A \sim B
$$

### Observaciones

- La relación de coordinabilidad es de equivalencia

  - Demostración:

    - La relación es reflexiva, por que si planteo la función identidad $f(x)=x$ (biyectiva)
      $$
        f(A)=A \Rightarrow ARA
      $$

    - La relación es Simétrica, por que como $f$ es biyectiva, entonces existe $f^{-1}$
      $$
      ARB \Rightarrow f(A)=B \Rightarrow A = f^{-1}(B) \rightarrow BRA
      $$

    - La relación es Transitiva, por que la composición de funciones biyectivas resulta en una función biyectiva
      $$
      ARB\and BRC \Rightarrow f(A) = b \and g(B) = C \\\
      \text{Si defino } h:A \rightarrow C/ h(x) = g(f(x))\\
      \therefore h(A) = C \Rightarrow ARC
      $$

## Sección Inicial

### Definición

Son todos los conjuntos  de la forma:
$$
I_n=\{1,2,3,\dots, n\}
$$

### Observación

- $I_n \sim I_k \Leftrightarrow n = k$

   [Demostración](Demostraciones\01 - Cardenalidad\Observacion - 01.html) 

## Conjuntos Finitos e Infinitos

### Definición

$A$ es un conjunto <u>finito</u> si $A= \empty$ o $\exist n \in \N / A \sim I_n$

Si el conjunto $A$ no es finito, entonces se dice que es <u>infinito</u>

### Ejemplos

1. $A=\{\empty,\&,@\}$ es finito

   Definimos $f$ tal que:
   $$
   f:A \rightarrow I_3 / 
   \left\{
   	\array{
   		f(\empty)=1\\
   		f(\&) = 2 \\
   		f(@) = 3
   	}
   \right.
   $$
   Se puede ver que $f$ es biyectiva $\Rightarrow A \sim I_3 \Rightarrow A$ es finito.

2. $A=\N$ es infinito

   Supongo que es finito, entonces hay 2 opciones y solo hace falta que cumpla con una:

   - $\N = \empty ~~~~~(1)$

     <u>Falso</u>, por que 1 pertenece a $\N$

   - $\exist k / N \sim I_k~~~~~(2)$

     <u>Falso</u>, demuestro por absurdo

     Supongo que:
     $$
     \exist f:I_k \rightarrow \N \text{ biyectiva}
     $$
     Y su imagen es:
     $$
     Im(f) = \{f(1), f(2),\dots,f(k)\}
     $$
     Tomo el máximo valor de la imagen
     $$
     M = Max(Im(f)) 
     $$
     Pero podemos observar que:
     $$
     M+1 \in\N \and M+1 \notin Im(f)
     $$
     Entonces $f$ no es sobreyectiva y es <u>Absurdo</u>

## Cardenal

### Definición

- $Card(\empty) = 0$
- $Card(I_k) = k$
- $Card(\N) = \chi_o$

### Notación

Se lo nota de la siguiente forma:
$$
Card(A) = |A| = \#A
$$

### Relaciones entre Cardinales

Sean $a,b$ Cardinales. Sean $A,B$ conjuntos$/ \#A = a,~\#B=b$

1. $a\leq b$ si $\exist f:A\rightarrow B$ inyectiva
2. $a\geq b$ si $\exist f:A\rightarrow B$ sobreyectiva
3. $a = b $ si $\exist f:A\rightarrow B$ biyectiva
4. $a \lt b$ si $a\leq b$ y $a\neq b$
5. $a\gt b$ si $a \geq b$ y $a \neq b$

#### Ejemplo

1. Hallar $\# A / A =\{x \in \N/ x \text{ es par} \}$

   Defino $f:\N \rightarrow A / f(x)= 2 \cdot x$ y verifico que sea biyectiva

   Inyectividad: 
   $$
   f(x) = f(y) \Rightarrow2 \cdot x = 2 \cdot y \Rightarrow x = y
   $$
   Sobreyectividad:
   $$
   \text{Sea } a\in A \Rightarrow \exist k \in \N/ a = 2 \cdot k 
   $$
   Entonces podemos ver que $f$ es biyectiva.
   $$
   \therefore \#A=\#\N = \chi_o
   $$

2. $\#(\N \times \N) = ?= \chi_o$ por las diagonales de Cantor

   Vamos a usar el [Teorema de Bernstein](#Teorema de Bernstein), por lo que tenemos que buscar una función de $\N^2$ a $\N$ y otra de  $\N$ a $\N^2$, ambas inyectivas.

   - Busco $f:\N \rightarrow \N^2$

     Defino $f$ tal que:
     $$
     f:\N\rightarrow \N^2/f(x)=(x,x)
     $$
     Verifico que $f$ es inyectiva:
     $$
     f(x) = f(y)\\
     (x,x)=(y,y)\\
     x=y
     $$
     Y como es inyectiva, puedo decir que:
     $$
     \array{\#\N \leq \#\N^2 & (1)} 
     $$
     
- Busco $g:\N^2 \rightarrow \N$
  
  Defino $g$ tal que:
  $$
     g:\N^2 \rightarrow \N/ g(x,y)= 2^x\cdot 3^y
  $$
     Verifico que $g$ es inyectiva:
  $$
     g(a,b)=g(x,y)\\
     2^a \cdot3^b = 2 ^ x \cdot 3 ^y\\
     \text{Por el Teorema Fundamental de la Aritmetica }\\
     a = x \and b = y
  $$
     Y como es inyectiva, puedo decir que:
  $$
     \array{\#\N^2 \leq \#\N&(2)}
  $$
  

Entonces, por $(1)$ y $(2)$, mediante el teorema de Bernstein, puedo decir que:
$$
   \#\N^2 = \# \N = \chi_o
$$

### Teorema de Bernstein

Sean $a,b$ cardinales, si $a\leq b$ y $b \leq a \Rightarrow a = b$

Esto es sinónimo a decir:

Sea $A/\#A=a$, $B/\#B=b$, entonces:

Si existe $f:A\rightarrow B$ inyectiva y $g:B\rightarrow A$ inyectiva, entonces existe $h:A\rightarrow B$ biyectiva

#### Ejercicios

1. Demostrar que: Sea $A \sim \N,~B \sim \N \Rightarrow A\times B \sim \N$

   Como $A \sim \N \Rightarrow \exist f:A\rightarrow \N$ biyectiva

   Como $B \sim \N \Rightarrow \exist g:B\rightarrow\N$ biyectiva

   Entonces puedo definir una función $h$ de la siguiente forma:
   $$
   h:A\times B \rightarrow \N^2/h(x,y)=(f(x),g(y))
   $$
   Verifico que sea inyectiva:
   $$
   h(a,b)=h(x,y)\\
   (f(a),g(b))=(f(x),g(y))\\
   \array{f(a)=f(x) &~y~& g(b)=g(y)}\\
   $$
   ​		Como $f$ y $g$ son funciones inyectivas:
   $$
   \array{a=x&&b=y}
   $$
   Verifico que sea sobreyectiva:

   ​		Sean $(y_1,y_2) \in \N^2$:

   ​		Como $f$ es sobreyectiva, $\exist a / f(a) = y_1$

   ​		Como $g$ es sobreyectiva, $\exist b/g(b) = y_2$
   $$
   \therefore h(a,b)= (f(a),g(b))= (y_1,y_2)
   $$
   Como $h$ es inyectiva y sobreyectiva, podemos decir que es biyectiva, entonces tambien podemos decir que $A\times B \sim \N^2$.

   Además, ya sabíamos que $\N^2 \sim \N$

   Entonces, por transitividad podemos decir:
   $$
   A\times B \sim \N
   $$

#### Observaciones

1. Cualquier subconjunto de una sección inicial es finito:
$$
A\subseteq I_k \Rightarrow A \text{ es finito}
$$
​		  [Demostración](Demostraciones\01 - Cardenalidad\Observacion - 02.html)

1. $A\sub B$ y $A$ es infinito $\Rightarrow B$ es infinito

    [Demostración](Demostraciones\01 - Cardenalidad\Observacion - 03.html) 

2. $X$ es infinito, entonces $\exist f:\N \rightarrow X\text{ inyectiva}$

    [Demostración](Demostraciones\01 - Cardenalidad\Observacion - 04.html) 

3. $\geq$ es una relación de orden.

    La demostración es análoga a la de  $\le$

4. $\leq$ es una relación de orden.

     [Demostración](Demostraciones\01 - Cardenalidad\Observacion - 06.html) 

5. $\exist f:A \rightarrow B$ inyectiva $\Leftrightarrow \exist g:B \rightarrow A$ sobreyectiva

   De forma similar $\#A \leq \#B \Leftrightarrow \#B \geq \#A$

    [Demostración](Demostraciones\01 - Cardenalidad\Observacion - 05.html) 



#### Ejemplos

1. Demostrar que $\N \sim \Q$, es decir que $\#\N = \#\Q$

   Ayuda: Armar una tabla de diagonales de Cantor, pero con $\frac x y$. Como hay resultados repetidos, no se puede encontrar una función biyectiva, pero se puede buscar una inyectiva, por lo que tengo que usar el teorema de Bernstein.



## Conjunto Numerable

$A$ es numerable si $A$ es finito o $A \sim \N$.

### Teoremas

1. $\#[0,1] \gt \chi_o$

    [Demostración](Demostraciones\01 - Cardenalidad\Teorema - 01.html) 

### Definición

$$
C=\#[0,1]
$$

#### Propiedades

- Sea $X$ infinito no numerable ($\#X \gt \chi_o$) y $A$ numerable, entonces:
  $$
  X\cup A \sim X
  $$

   [Demostración](Demostraciones\01 - Cardenalidad\Propiedad - 01.html) 
  
  
  
- Sea $X$ infinito no numerable, $A$ numerable, entonces:
  $$
  X-A \sim X
  $$

   [Demostración](Demostraciones\01 - Cardenalidad\Propiedad - 02.html) 


## Teorema de Cantor

$$
\#X \lt \rho(X)
$$

Hay infinitos cardinales infinitos:
$$
\#\N \lt \#\rho(\N) \lt \#\rho(\rho(\N)) \lt \dots 
$$

 [Demostración](Demostraciones\01 - Cardenalidad\Teorema - 02.html) 




# Anexo

## Demostraciones

### 1

Todos los números terminados en $,\dot 9 $ pueden ser escritos como el siguiente entero con cola de $,\dot0$
$$
a = 0.\dot9\\
10 \cdot a - 9 = 9 \cdot a\\
9\cdot a = 9\\
a =1
$$
