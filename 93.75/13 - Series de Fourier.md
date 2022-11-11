# Series de Fourier

Si $f$ es una función periódica con periodo $T$ y se cumple:

1. $f(t)$ tiene un numero finito de discontinuidades en el intervalo $[0,T].$
2. $f(t)$ tiene un numero finito de extremos en el intervalo $[0,T].$
3. $\int_0^T |f(t)|^2dt < \infty$

Entonces, se podrá escribir como:
$$
f(t) = \frac {a_0} 2 + \sum_{n=1}^\infty a_n\cos\left(\frac{2n\pi} T t\right)
+ \sum_{n=1}^\infty b_n\sin\left(\frac{2n\pi} T t\right)
$$
Estas 3 condiciones se conocen como las **condiciones de Dirichlet** y son suficientes para que la serie planteada converja al valor de la función $f$ en los puntos donde esta sea continua y en los puntos de discontinuidad $t_j$ convergera a:
$$
f(t_j) = \frac{f_j^+ +  f_j^-}{2}
$$

### Calculo de los Coeficientes de Fourier

Los coeficientes de Fourier se calculan rápidamente proyectando la función en la dirección de cada vector de la base $B:$
$$
\array{
\left<f ;\cos \left(\frac{2n\pi t} T \right)\right> &=&  
\frac{a_0} 2 \left<1;\cos\left( \frac{2n\pi t}{T} \right)\right> \\
&+& \sum_{n=1}^\infty a_n \left<\cos\left(\frac{2n\pi t}{T}\right);\cos\left(\frac{2n\pi t}{T}\right) \right>\\
&+&
\sum_{n=1}^\infty b_n \left<\sin\left(\frac{2n\pi t}{T}\right);\cos\left(\frac{2n\pi t}{T}\right) \right>
}
$$

Si $n=0$ tendremos:
$$
a_0 = \frac 2 T \left<f;1\right> = \frac 2 T \int_0^Tf(t)dt
$$
Si $n \neq 0:$
$$
a_n = \frac 2 T \left<f,\cos\left(\frac{2 n \pi t}{T}\right)\right> = \frac 2T \int_0^Tf(t)\cos\left(\frac{2 n \pi t}{T}\right)dt
$$
Tomando el producto escalar con $\sin(\frac{2m\pi t}{T})$ tendremos:
$$
b_n = \frac 2T \left<f;\sin\left(\frac{2 n \pi t}{T}\right)\right> = \frac 2 T \int_0^Tf(t) \sin\left(\frac{2 n \pi t}{T}\right)dt
$$

## Propiedades

Los coeficientes del desarrollo de Fourier cumplen con las siguientes propiedades:

1. Están acotados:
   $$
   |a_n|,|b_n| < \frac 2 T \int_0^T |f(t)| dt
   $$

2. Los coeficientes $a_n,b_n$ tienen a $0$ cuando $n$ tiene a infinito:
   $$
   \lim_{n\rarr\infty}a_n = \lim_{n\rarr \infty}b_n = 0
   $$

3. Si notamos $a_n(h),b_n(h)$ a los n-esimos coeficientes del desarrollo en serie de Fourier de la función $h,$ entonces se cumple la propiedad de linealidad:
   $$
   \array{
   a_n (f+g) = a_n(f) + a_n(g) & a_n(c\times f) = c \times a_n(f) \\
   b_n (f+g) = b_n(f) + b_n(g) & b_n(c\times f) = c \times b_n(f) \\
   }
   $$

4. Si $f$ es par, entonces $\forall n:b_n = 0$

5. Si $f$ es impar, entonces $\forall n: a_n = 0$

## Suma Finita de Fourier

Si en lugar de considerar los infinitos términos del desarrollo de Fourier de una función, nos quedamos con un numero finito $N$ podemos definir a una **suma finita de Fourier**:
$$
S_N(f) = \frac {a_0} 2 + \sum_{n=1}^Na_n\cos(\frac{2n\pi}{T}t) + \sum_{n=1}^Nb_n\sin(\frac{2n\pi}{T} t)
$$
El polinomio resultante es de grado $N$ cuando contiene $N$ sumandos de la serie infinita.

>  **Proposición 8.3.1**
>
> El polinomio trigonométrico de grado $N$ que mejor aproxima a una función $f$ de cuadrado integrable en el sentido de los cuadrados mínimos es el que tiene como coeficientes a los coeficientes de Fourier de $f$.

A la hora de trabajar con Fourier, nunca se utiliza la serie infinita, sino que se utiliza la suma finita hasta cierto $N.$ 

La forma de cuantificar el error no puede ser local, por lo que debe ser global. Para ello se utiliza el concepto de distancia:
$$
||f(t) - S_N(t)|| = \sqrt{\int_0^T |f(t) - S_N(t)|^2dt}
$$
También conocido como **error cuadrático medio**.

## Fenómeno de Gibbs

Analicemos la serie de Fourier de la función discontinua:
$$
f(t) = \left\{
\array {
0 & -1 < t < -\frac 1 2\\
- \frac 1 2 & -\frac 1 2 < t < 0\\
1 & 0 < t < \frac 1 2\\
0 & \frac 1 2 < t < 1
}
\right.
$$
Como la función es impar:

- $\forall n:a_n = 0$
- $\forall n: b_n = \frac 2 {n\pi} ( 1 - \cos\left(\frac {n \pi} 2\right))$

Viendo la función estimada con distinta cantidad de términos:

<img src="Resources/13 - Series de Fourier/Screen Shot 2022-09-22 at 18.41.23.jpg" alt="Screen Shot 2022-09-22 at 18.41.23" style="zoom: 33%;" />

Nos damos cuenta que parece que cuanto más términos tenemos, obtendríamos una aproximación mejor cerca de los puntos de discontinuidad. Esto no siempre sucede, y se lo conoce como el **fenómeno de Gibbs**. Este fenómeno consiste en un over/under shot en los puntos de discontinuidad de la función a ajustar. Se puede demostrar que la diferencia en estos casos es del 9%.

## Variantes de la Serie de Fourier

La serie de Fourier se puede escribir de otras maneras:

### Función Extendida de Manera Impar

Si $f(t)$ es una función definida en el intervalo $L$ que cumple las condiciones de Dirichlet, construiremos su extensión impar al intervalo $(-L,L]$ como:
$$
F_{\text{imp}}(t) = \left\{
\array{
f(t) & 0 < t < L\\
-f(-t) & -L < t < 0
}
\right.
$$
<img src="Resources/13 - Series de Fourier/Screen Shot 2022-10-25 at 20.50.21.jpg" alt="Screen Shot 2022-10-25 at 20.50.21" style="zoom: 33%;" />

Como la función es impar, podemos saber que los coeficientes $\forall n \in \N a+0 = a_n = 0.$ Esto nos da el siguiente desarrollo:
$$
f(t) = \sum_{n=1}^\infty b_n \sin(\frac{2n\pi}{T}t)
$$

### Función Extendida de Manera Par

Una función se extiende de manera par como:
$$
F_{\text{par}}(t) = \left\{
\array{
f(t) & 0 < t < L\\
f(-t) & -L < t < 0
}
\right.
$$
<img src="Resources/13 - Series de Fourier/Screen Shot 2022-10-25 at 20.57.17.jpg" alt="Screen Shot 2022-10-25 at 20.57.17" style="zoom: 33%;" />

Como la función es par, los coeficientes $\forall n \in \N: b_n = 0.$ Entonces el desarrollo de Fourier es:
$$
f(t) = a_0 + \sum_{n=1}^\infty a_n \cos\left(\frac{2n\pi}{T}t\right)
$$

### Desarrollo en Amplitud y Fase

Dado el desarrollo de Fourier con la siguiente forma:
$$
f(t) = \frac {a_0} 2 + \sum_{n=1}^\infty a_n\cos\left(\frac{2n\pi} T t\right)
+ \sum_{n=1}^\infty b_n\sin\left(\frac{2n\pi} T t\right)
$$
Se puede reescribir de la siguiente forma:
$$
f(t) = \frac {a_0}2 + \sum_{k=1}^\infty A_k \cos(\frac{2k\pi}{T}t + \phi_k)
$$
Donde la amplitud se calcula:
$$
\array{
\forall n = 1,2,...: A_n=\sqrt{a_n^2+b_n^2}  \\
\cos (\phi_n)=\frac{a_n}{A_n} \\
\sin(\phi_n)=\frac{b_n}{A_n}
}
$$

### Desarrollo en Exponenciales Complejas

Se pueden convertir las series trigonométricas en series de exponenciales complejas:
$$
f(t) = \sum_{n=-\infty}^{\infty} c_n e^{\frac{2n\pi}{T}ti}
$$
Donde los coeficientes son:
$$
\array{
c_{-n} = \frac{a_n + ib_n}{2}\\
c_0 = \frac{a_0} 2\\
c_n = \frac{a_n-ib_n} 2
}
$$
Aunque no hace falta encontrar los coeficientes $a_n,b_n$ para obtener a $c_n.$ Este se puede calcular directamente:
$$
c_n = \frac 1 T \int_0^T f(t) e^{-\frac{2n\pi}{T}it} dt
$$

## Dominio Tiempo y Dominio de las Frecuencias

A cada uno de los términos que componen a la serie de Fourier se los puede pensar como una onda de frecuencia $\frac{2\pi}T n = n w_0$ y amplitud $A=\sqrt{a_n^2 + b_n^2} = |c_n|.$ A todas estas ondas las llamaremos **modo de Fourier** o **armónico**.

Las frecuencias $w_0$ se llama **frecuencia armónica fundamental**. La **n-esima armónica** $(w_n)$ se obtiene:
$$
w_n = n \times w_0
$$

## Propiedades de las Series de Fourier

Sea $f$ una función continua en el dominio de las frecuencias:

- **Linealidad**: Sean $f(t),g(t)$ dos funciones periódicas con el mismo periodo. $f(t)$ estara representada por el par $\{c_n,w_n\}$ y $g(t)$ por el par $\{c_n',w_n\}$ entonces la serie asociada con la función $\alpha f(t) + \beta g(t)$ estara representada por $\{\alpha c_n + \beta c_n', w_n\}.$

- **Desplazamiento en el dominio tiempo**: Si $f(t)$ esta representada por $\{c_n,w_n\},$ entonces la función desplazada $f(t-a)$ estara representada por $\{c_n e^{iw_na},w_n\}.$ Las funciones periódicas mantienen su periodo al desplazarse en el tiempo.

- **Desplazo en el dominio de frecuencias**: Si $f(t)$ viene representada por $\{c_n,w_n\}$ y desplazamos los coeficientes $c_n$ en $m\in \Z$ unidades, obtenemos la representación $\{c_{n-m},w_n\}$ de la función $f(t) e^{-imw_0t}.$

- **Escalado Temporal**: Si $f(t)$ esta representada por $\{c_n,w_n\}$ y escalamos el tiempo $(t\rarr a\times t,a\in \R),$ la representación de $f(at)$ sera $\{c_n,\frac{w_n}{a}\}.$ La frecuencia fundamental se comprime si $|a| > 1$ y se dilata en el caso opuesto. $a=-1$ es un caso particular, donde $w_n$ para a ser $w_{-n}$ y $a_n$ para a ser $a_{-n},$ por lo que solo se invierte la fase.

- **Igualdad de Parserval**: Si la función $f$ esta representada por $\{c_n,w_n\}$ se verifica que:
  $$
  \frac 1 T \int_o^T |f(t)|^2 dt = \sum_{n=-\infty}^\infty |c_n|^2 = \left(\frac{a_0}{2}\right)^2 + \frac 1 2 \sum_{n=1}^\infty (a_n^2 + b_n^2)
  $$

- **Desigualdad de Bessel**: Si en la igualdad de Parserval nos quedamos con un numero finito de términos $N$ en la suma de Fourier, la igualdad se transforma en:
  $$
  \frac 1 T \int_o^T |f(t)|^2 dt > \sum_{n=-\infty}^\infty |c_n|^2 = \frac{a_0^2}2 + \frac 1 2 \sum_{n=1}^N (a_n^2 + b_n^2)
  $$

## Resolución de Ecuaciones Diferenciales Ordinarias

Ver ejemplos en el libro

## Series de Fourier en Varias Variables

Las series de Fourier de una variable independiente se pueden extender fácilmente a $d$ variables independientes, pero generalizar esto es complicado. Por esto nos concentraremos en plantearlo para $d=2.$

Consideremos una función de dos variables:
$$
f:\R \rarr\C
$$
Decimos que es $(T_x,T_y)\text{-periodica}$ si:
$$
f(x+T_x, y + T_y) = f(x,y)
$$
Donde $(T_x,T_y)$ son los menores reales que verifican con la igualdad anterior y se los denominara **periodos fundamentales**. Las **frecuencias fundamentales** se obtienen realizando la inversa del periodo fundamental y multiplicando por $2\pi.$

El desarrollo en serie trigonométrica se escribe de la siguiente forma:
$$
\array{
f(x,y) = & \sum_{n,m=0}^\infty A_{nm}\cos(\frac{2\pi n}{T_x}x)\cos(\frac{2\pi m}{T_y}y)  +\\
& \sum_{n,m=0}^\infty B_{nm}\sin(\frac{2\pi n}{T_x}x)\cos(\frac{2\pi m}{T_y}y)  +\\
&\sum_{n,m=0}^\infty C_{nm}\cos(\frac{2\pi n}{T_x}x)\sin(\frac{2\pi m}{T_y}y)  +\\
&\sum_{n,m=0}^\infty D_{nm}\sin(\frac{2\pi n}{T_x}x)\sin(\frac{2\pi m}{T_y}y)
}
$$
Los coeficientes se calculan de la siguiente forma:
$$
\array{
A_{nm} = \frac{K}{T_xT_y} \int_0^{T_x}\int_0^{T_y} f(x,y)\cos(\frac{2\pi n}{T_x}x)\cos(\frac{2\pi m}{T_y}y) dy dx\\

B_{nm} = \frac{K}{T_xT_y} \int_0^{T_x}\int_0^{T_y}f(x,y)\sin(\frac{2\pi n}{T_x}x)\cos(\frac{2\pi m}{T_y}y) dy dx\\

C_{nm} = \frac{K}{T_xT_y} \int_0^{T_x}\int_0^{T_y} f(x,y)\cos(\frac{2\pi n}{T_x}x)\sin(\frac{2\pi m}{T_y}y) dy dx\\

D_{nm} = \frac{K}{T_xT_y} \int_0^{T_x}\int_0^{T_y} f(x,y)\sin(\frac{2\pi n}{T_x}x)\sin(\frac{2\pi m}{T_y}y) dy dx\\
}
$$
Donde:
$$
K = \left\{
\array{
1 & n = m = 0\\
2 & n = 0 \lor m=0\\
4 & n>0 \land m>0
}
\right.
$$
Se puede escribir de forma compacta utilizando la serie de exponenciales complejas:
$$
f(x,y) = \sum_{n,m=-\infty}^\infty C_{nm} e^{i\frac{2n\pi}{T_x}x + i \frac{2n\pi}{T_y}y}
$$
Donde el coeficiente se obtiene:
$$
C_{nm} = \frac 1{T_xT_y} \int_0^{T_x}\int_o^{T_y}  f(x,y) e^{-\frac{2m\pi n}{T_x}xi - \frac{wn\pi m}{T_y}yi}dydx
$$

