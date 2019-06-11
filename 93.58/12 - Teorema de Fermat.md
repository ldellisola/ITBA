# Teorema de Fermat

Sea $p\in P$, entonces:

1. $a^p\equiv a~~~~(mod~p)~~~\forall a\in\Z$
2. $a^{p-1}\equiv 1~~~ (mod~p)~~~\forall a\in\Z/~a\bot p$ 

### Demostracion

#### $1^{er}$ Paso:

$$
(a+b)^p\equiv a^p+b^p~~~(p)~~\forall a,b
$$

Por el Binomio de Newton
$$
(a+b)^p \equiv
a^p + 
\sum_{i=1}^{p}
\begin{pmatrix}
	p\\i
\end{pmatrix}
\times a^{p-1}\times b +
\sum_{i=1}^{p}
\begin{pmatrix}
	p\\i
\end{pmatrix}
\times b^{p-1}\times a 
+b^p
$$
Pero como [probamos](#Calculo-Auxiliar), $p|\begin{pmatrix} p\\k\end{pmatrix} \Rightarrow \begin{pmatrix} p\\k\end{pmatrix} \equiv 0~~~(p)$

Entonces queda:
$$
(a+b)^p\equiv a^p+b^p~~~(p)
$$

#### $2^{do}$ Paso:

(Se prueba por induccion)
$$
0^p \equiv 0\\
1^p \equiv 1\\
2^p \equiv 2\\
\vdots\\

a^p \equiv a~~~~(p)~~~a\geq 0\\
$$

#### $3^{er}$ Paso:

$$
a^p \equiv a~~~~(p)~~~ a\leq-1
$$

Como $-a<0$, por el paso 2:
$$
\Rightarrow~~ (-a)^p \equiv -a
$$
Separando el producto queda:
$$
\Rightarrow~~ (-1)^p\ .\ (a)^p \equiv -1\ .\ a
$$
Si $p\neq 2$ , $(-1)^p \equiv -1$:
$$
\Rightarrow~~ (a)^p \equiv a
$$
Si $p=2$, $-1 \equiv 1~~(2)$: 
$$
\Rightarrow~~ (a)^2 \equiv a
$$
Por lo tanto, queda probado que $a^p \equiv a~~~(mod~p)~~\forall a\in\Z$ 

#### $4^{to}$ Paso:

$$
a^{p-1} \equiv 1~~~~(p)~~a\bot p
$$

Supongo que $a\bot p$:
$$
a^p \equiv a~~~~(p)\\
a^{(p-1)}\ .\ a \equiv a~~~~(p)
$$
Como $a \bot p$ puedo cancelar la $a$:
$$
a^{p-1} \equiv 1~~~~(p)
$$


### Observación

Si $n\geq 3$ entonces no existen soluciones enteras para la ecuación:
$$
x^n+y^n=z^n
$$

____

### Calculo Auxiliar

Si $p\in P$ y $1\leq k \leq p-1 \Rightarrow p|\begin{pmatrix} p\\k\end{pmatrix}$

 **Demostración**:
$$
\begin{pmatrix}
	p\\
	k
\end{pmatrix}
=
\frac{p!}{k!(p-k)!}
\Rightarrow
p! = \begin{pmatrix}
	p\\
	k
\end{pmatrix}
k!(p-k)!
$$
Entonces podemos decir que:
$$
p|p! \Rightarrow
p|\begin{pmatrix}
	p\\
	k
\end{pmatrix}
k!(p-k)!

\Rightarrow

(1)~~~p|k! ~~~o~~~
(2)~~~p|(p-k)!~~~o~~~
(3)~~~p|\begin{pmatrix}
	p\\
	k
\end{pmatrix}
$$
Yo quiero probar que $(3)$ es verdadero, entonces tengo que probar que $(1)$ y $(2)$ son falsos.

Pruebo que $(1)$ es falso:
$$
Si~p|k! \Rightarrow p|1\ .\ 2\ .\ \dots\ .\ k \Rightarrow
p|j~~~para~algun~j~/~1\leq j\leq k\lt p ~~~~~ABS!
$$
Pruebo que $(2)$ es falso:
$$
Si~p|(p-k)! \Rightarrow
p|1\ .\ 2\ .\ \dots\ .\ j\ .\ \dots\ .\ k \Rightarrow
p|j~~~para~algun~j~/~1\leq j\leq p-k\lt p ~~~ABS!
$$
Entonces $(3)$ es verdadera.



























