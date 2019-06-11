# Relaciones de Recurrencia

## Relaciones de Recurrencia Lineales  (RRL)

Relación de Recurrencia Lineal de orden $k$  ($k\geq 1$)
$$
x_n+\alpha_1x_{n-1}+\alpha_2x_{n-2}+\dots+\alpha_kx_{n-k}=f_n	~~~~~	n\geq k
$$
Con $\alpha_1,\alpha_2,\dots,\alpha_k \in \mathbb K$  y $\alpha_k \neq 0$

La Relación es **homogénea** si $f_n = 0 ~~~\forall n$. Si la Relación no es homogénea, se la denomina **no homogénea** o **heterogénea**.

La sucesion $\{a_n\}$ es solucion de la RRL 
$$
x_n+\alpha_1x_{n-1}+\alpha_2x_{n-2}+\dots+\alpha_kx_{n-k}=f_n	~~~~~	n\geq k
$$
si cumple con:
$$
a_n+\alpha_1a_{n-1}+\alpha_2a_{n-2}+\dots+\alpha_ka_{n-k}=f_n	~~~~~	n\geq k
$$

Las soluciones de las relaciones de recurrencia suelen ser infinitas, por eso se aplican restricciones, conocidas como **condiciones iniciales**.

### Solución Homogénea

Sea la RRL:
$$
x_n+\alpha_1x_{n-1}+\alpha_2x_{n-2}+\dots+\alpha_kx_{n-k}=0	~~~~~	n\geq k
$$

#### $1^{er} $ Paso : Búsqueda del Polinomio Característico

Proponemos la solución $x_n = r^n$ y despejamos
$$
r^{n-k}\ .\ (\alpha_1r^k + \dots + \alpha_{k-1} r + \alpha_k) = 0
$$
Como $r \neq 0$ entonces podemos eliminarlo:
$$
P(r)=\alpha_1r^k + \dots + \alpha_{k-1} r + \alpha_k = 0
$$

#### $2^{do}$ Paso: Proponemos Soluciones

Luego de encontrar el polinomio característico, llamemos $q$ a las raíces del mismo, las solución propuesta es:
$$
x_n^h=\beta_1\ .\ q_1^n +\beta_2\ .\ q_2^n +\dots+\beta_k\ .\ q_k^n
$$
Si las hay $q$ raíces iguales, entonces a esas raíces particulares se las transforma como:
$$
\sum_{k=0}^{t}\beta_k\ .\ q^n\ .\ n^k
$$
siendo $t$ la cantidad de veces que ser repite. (cada raíz aporta tantas soluciones como su multiplicidad)

Si tenemos [raices imaginarias conjugadas](#Numeros-Complejos), se puede expresar como:
$$
x_n^h=  |q|^n\ .\ (\beta\ .\ cos(n\ .\ \phi) + \gamma\ .\ sen(n\ .\ \phi))
$$

#### $3^{er}$ Paso: Aplicamos las condiciones iniciales

Tenemos que reemplazar nuestra solución propuesta en las condiciones iniciales y conseguir los valores $\beta_i$.

### Solución Particular

Sea la relación de recurrencia:
$$
x_n+\alpha_1x_{n-1}+\alpha_2x_{n-2}+\dots+\alpha_kx_{n-k}=f_n
$$
Propongo la solución particular:
$$
x_n^p=\psi\ .\ f_n
$$
y reemplazando esta solución particular en la relación de recurrencia, podemos averiguar el parámetro $\psi$.

### Solución General

La solución general es la combinación lineal de la [solucion homogenea](#Solucion-Homogenea) y la [solucion particular](#solucion-particular) .
$$
x_n = x_n^h + x_n^p
$$

- Que pasa si la solución homogénea ya incluye a la particular?

En ese caso, se multiplica a la solución particular por $n$. 

### Aplicación

#### Interés Financiero

Se suele utilizar este tipo de relaciones para plantear problemas de **interés financiero**. Estos casos suelen darse como:
$$
\left\{
	\begin{array}{}
		x_n= x_{n-1} + x_{n-1}\ .\ interes \\
		x_0 = plata
	\end{array}
\right.
$$
Donde $n$ suele ser cantidad de meses, trimestres o años, según diga el enunciado.

#### Subconjuntos 

No me acuerdo bien el caso. Básicamente era contar la cantidad de subconjuntos que se pueden crear a partir de un conjunto de $n$ elementos.
$$
\left\{
	\begin{array}{}
		x_n= \#P(A_n) \\
		x_1 =\#P(A_1) = 2
	\end{array}
\right.
$$
Por lo que la solución es:
$$
x_n=\#P(A_n)= 2^n
$$

### Método de Determinación de Constantes

Sea
$$
x_n+\alpha_1x_{n-1}+\dots+\alpha_kx_{n-k} = Q(n)\lambda^n
$$
Con $Q(n)$ un polinomio de grado $m$ y $\lambda \in \C-\{0\} $

Se propone la solucion particular
$$
x_n^p=n^s\ .\ \hat Q(n)\ .\ \lambda^n  
$$
Con $\hat Q(n)$ un polinomio del mismo grado que $Q(n)$ y $s$ la multiplicidad de $\lambda$ como raiz del polinomio caracteristico de la relacion.



___

## Anexo

### Números Complejos

Si $q_1, q_2$ son raíces complejas del polinomio característico, podemos reescribir a la solución como:
$$
x_n= \beta_1\ .\ |q_1|^n\ .\ (cos(n\ .\ \phi_1) + i\ .\ sen(n\ .\ \phi_1)) + \beta_1\ .\ |q_1|^n\ .\ (cos(n\ .\ \phi_1) + i\ .\ sen(n\ .\ \phi_1))
$$
con $\phi_i  = arg(q_i)$

Como queremos sacarnos de encima a la parte imaginaria, sumamos ambas partes y llamamos $\beta = \beta_1 + \beta_2$, $\gamma = (\beta_1 - \beta_2)i$, $|q |= |q_1| = |q_2|$, $\phi = \phi_1 = \phi_2$
$$
x_n=  |q|^n\ .\ (\beta\ .\ cos(n\ .\ \phi) + \gamma\ .\ sen(n\ .\ \phi))
$$


