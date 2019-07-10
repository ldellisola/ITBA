# Números Primos y Compuestos

- $q \in \Z$ es primo si tiene exactamente 4 divisores$/~ div(q)=\{\pm1 , \pm q \}$.
- $a\in\Z$ es compuesto si no es primo y $|a|\neq1$.

Si $a \in \N$ y $a$ es compuesto $\Rightarrow \exists a_1,a_2 \in \N ~/~ a = a_1\ .\ a_2~~,~~2\leq a_i\leq a-1$ 

### Propiedades

- Si $p\in P$ (primos) y $a\in\Z \Rightarrow$

$$
(a:p)=
\left\{
	\begin{array}{}
		1	~~~~	p\cancel{|}a	\\
        p	~~~~	p | a
	\end{array}
\right.
$$

- Si $p\in P $ y $p\cancel{|}a \Rightarrow  a\bot p$
- Si $p\in P$ y $p|(a\ .\ b)~~~,~~~ a,b\in\Z\Rightarrow p|a \or p|b$

## Teorema Fundamental Algebraico (TFA)

### Hipótesis

Sea:

- $a\in \Z-\{0,\pm1\}$

### Tesis

$$
a=Signo(a)\ .\ p_1\ .\ p_2\ .\ p_n~~~~~~,~~~~~~ p_1\lt p_2\lt \dots \lt p_n
$$

y la factorización es unica.

### Demostración

La demostración se divide en varios casos:

1. $a \geq 2 \Rightarrow~a$ puede ser expresado como el producto de uno o mas factores primos.

**Pruebo por el Absurdo**: Supongo que $a\geq 2$ no puede expresarse como el producto de números primos.

Sea $A=\{b\in\N:b\geq 2$ y $b$ no puede expresarse como el producto de primos$\}$

Podemos decir que $A\neq \empty$ por que suponemos que al menos 1 numero puede expresarse como factor de primos.

$A\sub\N$. Sea $a=min(A),~m\geq2$ y $a$ no es primo, entonces es compuesto:
$$
(1)~~~~~~~~~~a = a_1\ .\ a_2~~~~~~~~~~2\leq a_i\leq a-1
$$
Entonces $a_1$ y $a_2$ son mayores o iguales a $2$ y no pertenecen a $A$ , por ser menores a $a=min(A)$.

Entonces $a_1$ y $a_2$ se puede expresar como un producto de primos. $(2)$

Entonces, como $a$ es el producto de $a_1$ y $a_2$ $(1)$, por lo que es el producto de primos. **ABS!**

2. $a\geq 2 \Rightarrow \exist p_1,p_2,\dots,p_i~/~~~~p_i\in P~,~p_i\lt p_{i+1}~,~ a = p_1\ .\ p_2\ .\ p_i~~\forall i  $

Este caso es valido.

3. $a\leq -2 \Rightarrow |a|\geq 2$

Es análogo al segundo punto.

4. Unicidad de la Factorización

$$
a =Sg(a)\ .\ p_1\ .\ p_2\ .\ p_i = Sg(a)\ .\ q_1\ .\ q_2\ .\ q_j
$$

Siendo:  $p_i<p_{i+1}~~,~~q_j<q_{j+1}~~,~~p_i,q_i\in P$

Supongo que $i\leq j \Rightarrow p_1\ .\ p_2\ .\ p_i = q_1\ .\ q_2\ .\ q_j \Rightarrow p_1 | q_1\ .\ q_2\ .\ q_j    $

Como $p_1\in P$, $p_1$ debe ser divisor de al menos un $q_j$.

- Sea $j' /~~p_1|q_{j'}$ como $q_{j'}$,$p_1 \in P$ y $p_1\in P$ y $p_1>0$ y $q_{j'} > 0 \Rightarrow p_1=q_{j'}\geq q_1$

$$
\therefore p_1 \geq q_1~~~~(1)
$$

- De forma análoga se obtiene $q_1\geq p_1~~~(2)$

Entonces por $(1)$ y $(2)$ , $p_1 = q_1$.

Se puede repetir este proceso hasta que se obtenga:
$$
1 = q_{i+1}\ .\ \dots\  .\ q_j
$$
Que es absurdo, por lo que llegamos a que $i=j$

### Teorema

Si $a\in\Z-\{0,1,-1\}$, entonces podemos expresar a $a$ como:
$$
a= Signo(a)\ .\ p_1^{n_1}\ .\ p_2^{n_2}\ .\ \dots \ \ .\ p_k^{n_k} ~~~~,~~~k \in \N
$$
Siendo: $p_i \in P~~,~~n_i\in\N~~,~~p_i<p_{i+1}$.

## Consecuencias del TFA

### Cantidad de Divisores

Sea $a= Signo(a)\ .\ p_1^{n_1}\ .\ p_2^{n_2}\ .\ \dots \ \ .\ p_k^{n_k}$, la cantidad de divisores es:
$$
\#div(a) = 2\ .\ (\prod_{j=1}^i(n_i+1))
$$

### Máximo Común Divisor (MCD)

Sea:

- $a= Signo(a)\ .\ p_1^{n_1}\ .\ p_2^{n_2}\ .\ \dots \ \ .\ p_k^{n_k}$
- $b= Signo(b)\ .\ p_1^{m_1}\ .\ p_2^{m_2}\ .\ \dots \ \ .\ p_k^{m_j}$ 

Entonces $(a:b) = a=  p_1^{min(n_1,m_1)}\ .\ p_2^{min(n_2,m_2)}\ .\ \dots \ \ .\ p_k^{min(n_k,m_k)}$

### Mínimo Común Múltiplo (MCM)

Dados $a$ y $b~\in \Z-\{0\}$  el mínimo común múltiplo es el menor múltiplo positivo de $a$ y $b$.
$$
m=[a:b] = \frac{|a|\ .\ |b|}{(a:b)}
$$

### Función $v_p$

Es una función que devuelve el exponente $p$ en la factorización de $a$.

Si $p \in P$
$$
v_p:\Z-{0}\rightarrow \N_0
$$
**Definición equivalente**: 
$$
v_p(a)=k \Leftrightarrow p^k|a~~y~~p^{k+1}\cancel{|}a
$$


#### Ejemplo

$$
v_3(9) = 2, por~que~9=3^2
$$

#### Propiedades

1. $v_p(a\ .\ b) =v_p(a)+ v_p(b)$
2. $v_p(a^n)= n\ .\ v_p(a)$
3. Si $d|a\Rightarrow v_p(d) \leq v_p(a)$

#### Aplicaciones

1. Si $p\in P \Rightarrow \root{n}\of{p} \notin \Q \forall n\geq2$

**Demostración**:
$$
\root n \of p = \frac a b~~~~,~~a,b\in\N	\\
p = \frac{a^n}{b^n}	\\
v_p(p\ .\ b^n)=v_p(a^n)\\
1 + n\ .\ v_p(b) = v_p(a)\\
1 = n(v_p(a)-v_p(b))\\
\Rightarrow n|1 \Rightarrow n = 1 ~~ABS!
$$














