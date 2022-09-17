# Recursión Primitiva

Una función $f:\N^k\rightarrow\N$ es RP (Recursivamente primitiva) si es una <u>función inicial</u> o se obtiene aplicando finitas veces operaciones permitidas como la <u>composición ERI</u> y <u>ERII</u> con funciones iniciales.

## Definiciones

- **Funciones Iniciales**: Hay tres funciones iniciales:

  1. $cero:\N\rightarrow\N/cero(n)=0$
  2. $suc:\N\rightarrow\N/suc(n)=n+1$
  3. $\pi_j:\N^k\rightarrow\N/\pi_j(x_1,\dots,x_k)=x_j$

- **Predicados RP**: Un predicado $P^k$ es una relacion $k-$aria tal que $P^k \subset \N^k$. A cada predicado se le asigna de forma univoca una función característica de la siguiente forma:
  $$
  C_P:\N^k\rightarrow\{0,1\}/C_P(x_1,\dots,x_k)= 
  \left\{
  	\array{
  		1	&&	(x_1,\dots,x_k)\in P^k\\
  		0	&&	else
  	}
  \right.
  $$
  Decimos que $P^k$ es RP si $C_P$ es una función RP.

  De la misma forma decimos que $P^k$ es computable si $C_P$ es una función computable.

## Teoremas

- Las funciones RP son computables

   [Demostración](Demos\16 - Recursion Primitiva\Teorema - 01.html) 

- La composición de funciones RP  es RP

   [Demostración](Demos\16 - Recursion Primitiva\Teorema - 02.html) 

- Una función obtenida a partir de una operación ERI de otra función RP es RP.

   [Demostración](Demos\16 - Recursion Primitiva\Teorema - 03.html) 

- Una función obtenida a partir de una operación ERII de otra función RP es RP. 

   La demo es analoga a la anterior.

- Existen funciones computables que no son RP

- $P^k,Q^k$ son RP $\Rightarrow \neg P^k$ y $P^k \land Q^k$ son RP

   [Demostración](Demos\16 - Recursion Primitiva\Teorema - 05.html) 
  
- $P^k,Q^k$ son computables $\Rightarrow \neg P^k$ y $P^k \land Q^k$ son computables

   [Demostracion](Demostraciones\16 - Recursion Primitiva\Teorema - 06.html)

- $P^k,Q^k$ son RP $\Rightarrow  P^k\rightarrow Q^k$ y $P^k \lor Q^k$ son RP

   [Demostracion](Demostraciones\16 - Recursion Primitiva\Teorema - 07.html) ==??==

- $P^k,Q^k$ son computables $\Rightarrow P^k \rightarrow Q^k$ y $P^k \lor Q^k$ son computables

   [Demostracion]() ==??==

- Sean $h,g:\N^k\rightarrow\N$ funciones RP y $P^m$ un predicado RP
   $$
   f:\N^m\rightarrow\N/f(\vec x ) = 
   \left\{
   	\array{
       q(\vec x)	&&	\vec x \in P^m \\
       h(\vec x)	&& 	else
   	}
   \right.
   $$
   $f$ es RP.

    [Demostración](Demostraciones\16 - Recursion Primitiva\Teorema - 08.html) 

- Sean $h,g:\N^k\rightarrow\N$ funciones computables y $P^m$ un predicado computable
   $$
   f:\N^m\rightarrow\N/f(\vec x ) = \left\{	\array{    q(\vec x)	&&	\vec x \in P^m \\    h(\vec x)	&& 	else	}\right.
   $$
   $f$ es computable.

   [Demo]()

- Sean $h,g_1,\dots,g_n: \N^m\rightarrow\N$ funciones RP y sean $P_1^m,\dots,P_n^m$ predicados disjuntos, entonces $f$ es RP
   $$
   f:\N^m\rightarrow\N/f(\vec x)=
   \left\{
   	\array{
   			g_1(\vec x)		&&		\vec x \in P_1\\
   			&\vdots&\\
   			g_n(\vec x)		&&		\vec c \in P_n\\
               h(\vec x)		&&		else
   	}
   \right.
   $$

- **Suma acotada**:

   Sea $f:\N^{n+1}\rightarrow\N$ RP :
   $$
   SA_f:\N^{n+1}\rightarrow\N/SA_f(\vec x,y)= \sum_{k=0}^yf(\vec x, k)
   $$
   Es RP

   [Demo]()

- **Productoria acotada**

   Sea $f:\N^{n+1}\rightarrow\N$ RP :
   $$
   PA_f:\N^{n+1}\rightarrow\N/PA_f(\vec x,y)= \prod_{k=0}^yf(\vec x, k)
   $$
   Es RP

   [Demo]()

- **Existencial acotado**:
   $$
   EA_P:\N^{k+}\rightarrow \N / EA_P(\vec x, y)= \exist_{t\le y} C_P(\vec x,t)
   $$
   Si $P$ es RP, entonces $EA_P$ es RP

   [Demo]()

- **Existencial acotado con $<$**:
   $$
   EA_P:\N^{k+}\rightarrow \N / EA_P(\vec x, y)= \exist_{t < y} C_P(\vec x,t)
   $$
   Si $P$ es RP, entonces $EA_P$ es RP

   [Demo]()

- **Universal acotado**:
   $$
   UA_P:\N^{k+}\rightarrow \N / UA_P(\vec x, y)= \forall_{t\le y} C_P(\vec x,t)
   $$
   Si $P$ es RP, entonces $UA_P$ es RP.

   [Demo]()

- **Universal acotado con $<$**:
   $$
   UA_P:\N^{k+}\rightarrow \N / UA_P(\vec x, y)= \forall_{t< y} C_P(\vec x,t)
   $$
   Si $P$ es RP, entonces $UA_P$ es RP.

   [Demo]()

- **Minimización acotada**:

  Sea $P$ RP, entonces:
  $$
  MA_P:\N^{k+1}\rightarrow\N/MA_P(\vec x, y)=
  \left\{
  	\array{
  		min\{t \le y/ C_P(\vec x, t) = 1\} && A\neq\empty\\
  		0		&&	A=\empty
  	}
  \right.
  $$
  $MA_P$ es RP.

  [Demo]()







