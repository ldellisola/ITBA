# Ecuaciones

## Ecuación Diofantica

### Definición

$$
ax+by = c~~~~~~~~a,b\in \Z-\{0\}~~c\in\Z
$$

- La ecuación tiene solución $\Leftrightarrow (a:b)|c$

Sea $(x_0,y_0)\in \Z^2$ una solución de la ecuación y  $a'=\frac a {(a:b)}~,~b'=\frac b {(a:b)}$ , entonces la solución general de la ecuación es:
$$
(x,y) = (x_0,y_0) + k\ .\ (-b',a') ~~~k\in\Z
$$

### Demostración

1. La ecuación tiene solucion $\Leftrightarrow (a:b)|c$

**IDA: La ecuación tiene solución $\Rightarrow (a:b)|c$**

Llamemos $d=(a:b)~~(1)$ y por hipótesis decimos que $ax_0+by_0 = c~~(2)$, entonces:

Por $(1)$:
$$
d|a~~y~~d|b
$$
Por propiedad:
$$
d|ax_0~~y~~d|by_0
$$
Por propiedad:
$$
d|ax_0+by_0
$$
Por $(2)$:
$$
d|c \Rightarrow (a:b)|c
$$
**VUELTA: $(a:b)|c \Rightarrow$ La ecuación tiene solución**

Como $d=(a:b)\Rightarrow d|a$ y $d|b \Rightarrow a = a'\ .\ d$ y $b = b'\ .\ d$. Además $a' \bot~b'$ y, por hipótesis $c=c'\ .\ d$

Entonces:
$$
a'dx+b'dy = dc' \Leftrightarrow a'x+b'y=c'~~~~(1)
$$
Como $a'\bot~b' \Rightarrow \exist r,s\in \Z /$ 
$$
~ r a'+sb'=1
$$
Multiplico por $c'$ a ambos lados:
$$
a'(rc') + b'(sc') = c' 
$$
Cambio de variable $x_0 = rc'$ y $y_0 = sc'$:
$$
a'x_0 + b'y_o=c'
$$
Por lo que $(x_0,y_0) =(rc',sc')$ es solución de la ecuación.

2. Forma General de la ecuación:

Suponemos que $(x_0,y_0)\in \Z^2$ es una solución de la ecuación Diofantica, entonces:
$$
(1)~~~~a'x_0+b'y_0=c'
$$
Y sea $(x,y)\in\Z^2$ otra solución de la ecuación:
$$
(2)~~~~a'x+b'y=c'
$$
Igualando $(1)$ y $(2)$ obtengo:
$$
(3)~~~~a'(x-x_0)=b'(y_0-y)
$$
Por $(3)~~~a'|b'(y_0-y)$ y como $a'\bot~b'$ 
$$
a'|(y_0-y) \Rightarrow a'=k(y_o-y)~~~~k\in \Z
$$
Reemplazando en $(3)$ para obtener $x$, llegamos a:
$$
(x,y) = (x_0,y_0)+k\ .\ (-b',a')~~~~k\in\Z
$$

### Como resolver

Para resolver se divide en 2 pasos, primero buscamos la solución particular $(x_0,y_0)$ por tanteo y luego lo reemplazamos en la formula para obtener todas las soluciones posibles.

## Ecuación en Congruencia

### Definición

$$
ax\equiv c~~~~(mod~b)
$$

con $a\in\Z=\{0\}, ~~c\in\Z,~~b\in\N$

Entonces:

1. La ecuación tiene solución $\Leftrightarrow (a:b)|c$ 
2. Si $x_0$ es una solución particular, entonces la solución general es:

$$
x\equiv x_0~~~(mod~b')~~~~~~~b'=\frac b {(a:b)}
$$

### Demostración

1. La ecuación tiene solución $\Leftrightarrow (a:b)|c$ 

Sea:
$$
(1)~~~~ax\equiv c~~~~(mod~b)
$$
$x\in\Z$ es solución de  $(1) \Leftrightarrow ax = c+kb$

Si llamo $k=-y$:
$$
ax+by=c
$$
Y como se cumple el $\Leftrightarrow$ para la Diofantica, se cumple para la congruencia.

2. Solucion General

Suponemos que $x_0$ es solución de $ax\equiv c~~(b)$, entonces $\exist y_0\in \Z /~ (x_0,y_0)$ es solución de $ax+by=c$.

Luego, todas las soluciones de la Diofantica son:
$$
(x,y) = (x_0,y_0)+k\ .\ (-b',a')~~~~a'=\frac a {(a:b)}~~b'=\frac b {(a:b)}
$$
Entonces, $x = x_0 + kb'$ son todas las soluciones de $ax \equiv c~~(b)$, por lo que $x\equiv x_0 ~~~mod(b')$.