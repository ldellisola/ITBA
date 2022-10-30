# Diferencias Finitas

El método de diferencias finitas se utiliza para obtener soluciones de ecuaciones diferenciales ordinarias o en derivadas parciales.

## El Grillado del Dominio

La idea consiste en discretizar el espacio de las variables independientes y aceptar que se conocerá la solución en los mencionados puntos.

Los puntos en los que se conocerá la función se denominan **nodos** y la distancia en una de la direcciones cartesianas establecidas se denomina **paso**. Aunque el paso puede ser variable, siempre vamos a suponer que el paso es constante.

Cada nodo representa una posición espacio-temporal $n_j^k=(x_j,t_k).$ Asumiendo que el paso es constante, se puede obtener el nodo de la siguiente forma:
$$
\array{
x_j = x_0 + j\times h_x\\
t_k = t_0 + k \times h_y
}
$$
<img src="Resources/14 - Diferencias Finitas/Screenshot 2022-10-29 at 15.51.25.jpg" alt="Screenshot 2022-10-29 at 15.51.25" style="zoom:75%;" />

Dada una función $u(x,t)$ el valor que toma el nodo $n_j^k$ lo notamos como:
$$
u(x_j,t_k) \equiv u_j^k
$$
A las cantidades $x_j,t_k$ se las denomina coordenadas físicas del nodo, mientras que al par $j,k$ coordenadas lógicas. Este proceso se lo conoce como discretización. El próximo paso es aproximar a las derivadas mediante la evaluación de la función en los nodos de la grilla.

## El Método de las Diferencias Finitas

La approximation buscada se logra mediante la utilización del desarrollo en serie de Taylor de una función. A partir de ahora vamos a asumir que la función a estudiar $u$ tiene una sola variable independiente llamada $x.$

Data una función $C^\infty$ y un punto cualquiera $x_0$ de su dominio, entonces:
$$
f(x_j+h_x) = f(x_j) + h_x\frac{f'(x_j)}{1!} + h_x^2\frac{f''(x_j)}{2!} + h_x^3\frac{f'''(x_j)}{3!} + h_x^4\frac{f^{IV}(x_j)}{4!}
$$
Que vamos a notar como:
$$
f_{j+1} = f_j  + h_x \frac{f'_j}{1!} + h_x^2\frac{f_j''}{2!} + h_x^3 \frac{f'''_j}{3!} + h_x^4\frac{f^{IV}_j}{4!}
$$
La idea es aproximar a las derivadas de la función en un punto, como combinación lineal de los valores que toma la función en puntos “vecinos”. Por ejemplo, a la primera derivada de la función $u(x)$ la escribimos como:
$$
u_x = \alpha \times u_{j+1} + \beta \times u_{j-1} + e
$$
Donde $e$ es el error que se obtiene al aproximar la derivada por combinación lineal. Para obtener $\alpha,\beta:$

1. Desarrollamos en serie de Taylor cada uno de los valores que intervienen en la aproximación $(u_j,u_{j-1})$
   $$
   \left\{
   \array{
   u_{j-1} = u_j -hu'_j + h^2\frac{u''_j}2 + h^3 \frac {u'''_j}6 + \dots\\
   u_{j+1} = u_j +hu'_j + h^2\frac{u''_j}2 + h^3 \frac {u'''_j}6 + \dots\\
   }
   \right.
   $$
   

2. Armamos la combinación lineal.
   $$
   \alpha\times u_{j-1} + \beta u_{j+1} = (\alpha + \beta) u_j + h(\alpha -\beta) u'_j + \frac{h^2}2(\alpha + \beta) u''_j + \frac{h^3}{6} (\alpha + \beta)u^{IV}_j
   $$

3. Anulamos todos los sumandos salvo el de la derivada que nos interesa. Queda entonces un sistema lineal de ecuaciones que nos permite calcular el valor de los coeficientes involucrados.
   $$
   \left\{
   \array{
   \alpha + \beta = 0\\
   h\times(\alpha -\beta) = 1
   }
   \right.
   $$
   

4. Evaluamos el orden del esquema.
   $$
   \alpha = -\beta = \frac 1 {2h}
   $$

Reemplazando estos valores obtenemos:
$$
\frac{u_{j+1}-u_{j-1}}{2h} = u'_j + \frac{h^2}{3!} u''_j
$$
La aproximación a la primera derivada utilizando el punto anterior y posterior de la grilla viene dada por:
$$
u_j' \approx \frac{u_{j+1}-u_{j-1}}{2h}
$$
Y tiene el siguiente error de truncamiento:
$$
e = -\frac{h^2}{3!}u_j''' \lesssim - M h^2
$$
Como el error de truncamiento escala con $h^2$ se dice que la aproximación es de segundo orden y se lo nota como $O(h^2).$ 

En este calculo se utilizaron a los nodos vecinos a un nodo dado, este tipo de aproximación se llama **aproximación centrada**. Ademas se pueden plantear **aproximaciones progresivas** o **regresivas**:
$$
\array{
u_j' \approx \frac{u_{j+1}-u_j}{h} + O(h) & \text{progresiva}\\
u_j' \approx \frac{u_{j}-u_{j-1}}{h} + O(h) & \text{regresiva}
}
$$
Si tomamos el límite para $h \rarr 0,$ el error de truncamiento también tiende a $0.$ Por esto decimos que el esquema es consistente.

Dependiendo de la función a utilizar, una de las aproximaciones va a ser mejor que otras. Con métodos analíticos podríamos utilizar cualquier aproximación y disminuir el paso para poder reducir al error. Esto no sucede con métodos numéricos, ya que los números no tienen precisión infinita.

Para obtener el menor error posible entonces, es necesario poder encontrar el valor óptimo de $h.$ Para obtenerlo debemos definir:

- $u'(x_0):$ es el valor exacto de la derivada en la función $u$ en $x=x_0$
- $\hat u(x_1):$ es el valor representado en la computadora para la función $u$ evaluada en $x_1$
- $\hat u'_s(x_1):$ es el valor aproximado de la derivada de la función evaluada en $x_1$ en la computadora.

El error total sera:
$$
\text{Err} = u'(x_0) - u_s'(x_0)
$$
Para el caso de un esquema progresivo, tenderemos:
$$
\text{Err} = u'(x_0) -\frac{\hat u(x_0+h) + \hat u(x_0) }h
$$
Sabemos que en la computadora, el valor representado difiere del real en una cantidad $\varepsilon  \le \varepsilon_M,$ por lo tanto:
$$
\text{Err} = u'(x_0) - \frac{u(x_0 + h) + \varepsilon_1 - u(x_0) - \varepsilon _2}{h}
$$

$$
\text{Err} = \left[
u'(x_0) - \frac{u(x_0+h) - u(x_0)}{h}\right] + \frac{\varepsilon_1 - \varepsilon_2}{h}
$$

El primer sumando corresponde al error del orden de la aproximación y el segundo corresponde al error de representación que tendremos:
$$
\left[
u'(x_0) - \frac{u(x_0+h) - u(x_0)}{h}\right] \sim \frac{Mh}2
$$

$$
\frac{\varepsilon_1 - \varepsilon_2}{h} \le \frac{2\varepsilon_M}h
$$

Donde $M$ es una cota para $u''(c), x_0 \le c \le x_0+h.$

Luego, $\text{Err}(h) \le \frac{Mh}2 + \frac{2\varepsilon_M}h.$ Para obtener el valor optimo de $h$ buscamos los extremos de $\text{Err}(h)$ y obtenemos:
$$
\text{Err}'(h)= \left. \frac 2 M - \frac {2\varepsilon}{h^2} \right|_{h=h^*}
$$

 ### Esquemas de Mayor Orden

Si en la aproximación de la derivada intervienen una mayor cantidad de nodos, se alcanzan aproximaciones de mayor orden. Por ejemplo, siguen el procedimiento anterior llegamos a que con los nodos $n_{j+1}, n_{j+2},n_j,n_{j-1}, n_{j-2}$ se puede armar un esquema:
$$
u'=\alpha + u_{j+2} + \beta u_{j+1} + \gamma u_j + \delta u_{j-1} + \varepsilon u_{j-2}
$$
Resolviendo resulta que $\alpha = -1, \beta = 8, \gamma = 0, \delta = 8, \varepsilon = 1$ y
$$
\array{
e = -\frac 2 3 u^{IV}(c) h^3 & x-2h\le c \le x+2h
}
$$
Por lo que el esquema es de orden 3.

### Derivadas de Orden Superior

Para encontrar una aproximación a una derivada con orden mayor a uno se debe seguir el procedimiento descripto anteriormente.

Por ejemplo, tratemos de encontrar una expresión para la derivada tercera de una función con los puntos $u_{j-1},u_{j},u_{j+1},u_{j+2}$ de manera tal que:
$$
u'''(x) = \alpha u_{j-1} + \beta u_{j} + \gamma u_{j+1} + \delta u_{j+2}
$$
Resolviendo el sistema tenemos que:
$$
\array{
\alpha = -\frac 1 {h^3}&\beta = \frac 3 {h^3} &\gamma = -\frac 3{h^3} & \delta = \frac{1}{h^3}
}
$$
Por lo que nuestra aproximación será:
$$
u''' \approx \frac{-u_{j-1} + 3 u_{j} - 3 u_{j+1} + u_{j+2}}{h^3} + e
$$
Donde:
$$
e = \frac h 2 u^{IV}
$$
