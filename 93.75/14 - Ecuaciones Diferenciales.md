# Ecuaciones Diferenciales

## Diferencias Finitas

El método de diferencias finitas se utiliza para obtener soluciones de ecuaciones diferenciales ordinarias o en derivadas parciales.

### El Grillado del Dominio

La idea consiste en discretizar el espacio de las variables independientes y aceptar que se conocerá la solución en los mencionados puntos.

Los puntos en los que se conocerá la función se denominan **nodos** y la distancia en una de la direcciones cartesianas establecidas se denomina **paso**. Aunque el paso puede ser variable, siempre vamos a suponer que el paso es constante.

Cada nodo representa una posición espacio-temporal $n_j^k=(x_j,t_k).$ Asumiendo que el paso es constante, se puede obtener el nodo de la siguiente forma:
$$
\array{
x_j = x_0 + j\times h_x\\
t_k = t_0 + k \times h_y
}
$$
<img src="Resources/14 - Ecuaciones Diferenciales/Screenshot 2022-10-29 at 15.51.25.jpg" alt="Screenshot 2022-10-29 at 15.51.25" style="zoom:75%;" />

Dada una función $u(x,t)$ el valor que toma el nodo $n_j^k$ lo notamos como:
$$
u(x_j,t_k) \equiv u_j^k
$$
A las cantidades $x_j,t_k$ se las denomina coordenadas físicas del nodo, mientras que al par $j,k$ coordenadas lógicas. Este proceso se lo conoce como discretización. El próximo paso es aproximar a las derivadas mediante la evaluación de la función en los nodos de la grilla.

### El Método de las Diferencias Finitas

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
u_x' = \alpha \times u_{j+1} + \beta \times u_{j-1} + e
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

#### Esquemas de Mayor Orden

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

#### Derivadas de Orden Superior

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

## Resolución  de EDOs

Para explicar esta sección vamos a tener una diferencial:
$$
y' = t + y
$$
Podemos redefinir a la ecuación diferencial como la siguiente función de dos parámetros:
$$
y' = f(t,y) = t + y
$$
Existen 3 métodos para discretizar ecuaciones diferenciales:

- **Método Explicito**: Este método es inestable y no provee los mejores resultados. Para aplicarlo hay que realizar el siguiente reemplazo:
  $$
  y' = f(t_n,y_n)
  $$
  Este método es de orden 1, por lo que al reducir el paso a la mitad, el error global se reduce a la mitad (es linear).

- **Método Implícito**: Este método es preferible para la resolución de BVP. Para aplicarlo hay que realizar el siguiente reemplazo:
  $$
  y' = f(t_{n+1},y_{n+1})
  $$
  Este método es de orden 1, por lo que al reducir el paso a la mitad, el error global se reduce a la mitad (es linear).

- **Método de Crank-Nicolson**: Este método es preferible para la resolución  de IVP. Para aplicarlo hay que realizar el siguiente reemplazo:
  $$
  y' = \frac{f(t_{n+1},y_{n+1}) + f(t_n,y_n)}{2}
  $$
  Este método es de orden 2 ==??==, por lo que al reducir el paso a la mitad, el error global se reduce al cuarto (es cuadrático).

En todos los casos, $y_i$ representa la función $y$ discretizada y evaluada en el elemento $i.$ $t_i$ también representa la variable $t$ discretizada y evaluada en el elemento $i.$

### Initial Value Problem (IVP)

El Initial Value Problem o IVP es una situación al resolver una ecuación diferencial donde se conoce el valor inicial de la función y se debe, mediante pasos de tamaño fijo, llegar al valor en el que se quiere evaluar la función.

Este método discretiza a la ecuación diferencial para poder resolverla.

Antes de resolver este problema, debemos conocer un valor cercano al valor que queremos. Por ejemplo:

Sabemos que $y(x_j) = a$ donde $x_j$ es un valor del dominio y $a$ un valor de la imagen de la función. Ademas tenemos la ecuación a resolver:
$$
y' = f(t,y)
$$
Donde $f$ es la función definida al inicio de la sección anterior. La ecuación puede no estar ordenada, en ese caso debemos hacerlo.

Primero tenemos que obtener una aproximación de $y’,$ para esto vamos a usar el método de diferencias finitas. Utilizando el método preferido, podemos discretizar a la ecuación:

- **Método Explicito**

$$
\frac{y_{n+1}-y_n}{h} = y' = f(t_n,y_n)
$$

- **Método Implicito**
  $$
  \frac{y_{n+1}-y_n}{h} = y' = f(t_{n+1},y_{n+1})
  $$

- **Método de Crank-Nicolson**
  $$
  \frac{y_{n+1}-y_n}{h} = y' = \frac{f(t_{n+1},y_{n+1}) + f(t_n,y_n)}{2}
  $$

Donde $h$ es el paso elegido.

Para resolver la EDO simplemente hay que despejar y dejar a la ecuación definida en termino de $t_i$ y $y_i.$ Partiendo del valor inicial que conocemos, tenemos que iterar de por los valores de $y_i$ hasta llegar a aquel que evalúa al valor del dominio del cual queremos saber.

### Border Value Problem (BVP)

El método BVP sirve para obtener una aproximación de la función en varios puntos, dentro de el dominio especificado.

Dependiendo del tipo de problema, se puede encarar de 3 formas:

- **Condiciones de Dirichlet**: En este caso, se conoce el valor de la función al inicio y al final del dominio especificado:

  <img src="Resources/14 - Ecuaciones Diferenciales/Screenshot 2022-11-09 at 12.39.47.jpg" alt="Screenshot 2022-11-09 at 12.39.47" style="zoom:50%;" />

- **Condiciones de Neumann**: En este caso no se conoce ningún valor de la función, aunque se pueden conocer valores de la derivada de la función.

  <img src="Resources/14 - Ecuaciones Diferenciales/Screenshot 2022-11-09 at 12.41.21.jpg" alt="Screenshot 2022-11-09 at 12.41.21" style="zoom:50%;" />

- **Mixto**: Es una combinación de ambos métodos, donde se pueden conocer los valores de inicio o fin de la función, o información sobre su derivada:

  <img src="Resources/14 - Ecuaciones Diferenciales/Screenshot 2022-11-09 at 12.42.43.jpg" alt="Screenshot 2022-11-09 at 12.42.43" style="zoom:50%;" />

Para resolver este tipo de problemas podemos seguir los siguientes pasos:

1. **Discretizar el dominio de interés**: Tomemos nuestro dominio $L = (b-a)$ y la cantidad de nodos internos que nos interesan tener $N_I.$ A partir de estos datos podemos tener la cantidad total de nodos que necesitamos:
   $$
   N = N_I + 2
   $$
    Ademas de poder saber el tamaño de nuestro paso:
   $$
   h = \frac{L}{N-1}
   $$

2. **Elegir el esquema para representar a las derivadas**: Debemos elegir si vamos a usar el esquema explicito, implícito o de Crank-Nicolson, y aplicarlo.

3. **Escribir la ecuación en diferencias para los nodos interiores**: Una vez que esta discretizada la ecuación, podemos plantar la ecuación para cada valor de $n$ de los nodos internos.

   Si uno de los datos es una primer o segunda derivada, podemos utilizar su aproximación mediante diferencias finitas y reemplazar a la ecuación encontrada por la aproximación en ese punto.

4. **Formar la matriz del problema algebraico**: Convertir el sistema de ecuaciones a una matriz para ser resuelto en una computadora.

5. **Resolver de manera eficiente**: `linsolve` de octave.

6. **Calcular el error de la solución encontrada si se conoce la solución exacta**.

