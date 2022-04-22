# Metodos de Optimización no Lineal

Hay varios métodos de resolución, estos pueden ser:

- **Exactos**, donde se calculan a partir de una formula cerrada.
- **Aproximaciones**, donde tratan de acercarse a la solución:
  - Metodos basados en derivadas primeras o el gradiente
  - Metodos basados en derivadas segundas o el el hessiano
  - Metodos sin derivadas
  - Metodos estocásticos.

Una **matriz es definida positiva** cuando:

- $\forall x \neq 0, x^tAt>0$
- Si todos sus autovalores son positivos

En el caso de que $\forall x \neq 0, x^tAt \geq0$, entonces se la llama **semidefinida positiva**.

Sea $f$ una función diferenciadle con primera y segunda derivadas positivas, entonces:

- $x^*$ es un minimo global si 
  $$
  \forall x, f(x^*) \leq f(x)
  $$

- $x^*$ es un máximo local si:
  $$
  \forall x, f(x^*) \leq f(x) , || x-x^* || < \epsilon
  $$

### Condiciones de Optimalidad

**Condición necesaria de primer orden**: Si $x^*$ es un minimo local de $f$, entonces:
$$
\grad f(x^*) = 0
$$
**Condición necesaria de segundo orden**: Si $x^*$ es un minimo local de $f$, entonces:
$$
\grad f(x^*) = 0
$$
Y $H_f(x^*)$ es una matriz semidefinida positiva.

**Condición suficiente de primer orden**: Si $x^*$ es tal que $\grad f(x^*) = 0 \land  H_f(x^*)$ es definida positiva, entonces es un minimo local de $f$.

## Procedimiento General de Optimización

La idea es elegir el nuevo punto de manera que le valor de la función disminuya:
$$
f(x_{k+1}) < f(x_k)
$$
<img src="Resources/07 - Optimizacion no Lineal/Screen Shot 2022-04-21 at 10.25.15.jpg" alt="Screen Shot 2022-04-21 at 10.25.15" style="zoom:50%;" />

Iterativamente, en el paso $k$:

-  El punto inicial $x_k$ es el dato de entrada.
- Busco una dirección de movimiento $d_k$.
- Calculo o decido la longitud del paso $\alpha_k$.
- Actualizo al nuevo punto $x_{k+1} = x_k + \alpha_k \times d_k$.

### Busqueda Unidimensional

Para minimizar el valor de la función $f$ sobre la recta en la que se esta haciendo la búsqueda:
$$
\alpha_k = \arg\min_{\alpha>0}g(\alpha) = f(x_k + \alpha d_k)
$$
Donde $\alpha_k$ es la tasa de aprendizaje optima. Si ponemos este valor fijo vemos que si es muy grande puede no converger, pero si es muy chico va a tardar mucho en hacerlo.

### Gradiente Descendiente

<img src="Resources/07 - Optimizacion no Lineal/Screen Shot 2022-04-21 at 10.32.05.jpg" alt="Screen Shot 2022-04-21 at 10.32.05" style="zoom:50%;" />

La dirección de búsqueda para minimizar la función es:
$$
d_k = -\grad f(x_k)
$$

### Gradiente Descendiente con Momentum

Consiste en tomar la dirección de descenso como una combinación lineal de direcciones de descenso calculadas en pasos anteriores:
$$
x_{k+1} = x_k = \alpha_k\grad f(x_k) = \beta \alpha_{k-1}\grad f(x_{k-1})\\
0< \beta < 1
$$
Este promedio ponderado entre direcciones suaviza el zig zag del método del gradiente

### Metodo de Newton

Aproximamos la función con el polinomio de Taylor de segundo orden:
$$
\grad f(x_{k+1}) = \grad f(x_k + \alpha_k d_k) = \grad f(x_k) + \alpha_k H(h_k)d_k
$$
Entonces, si $x_{k+1}$ fuera minimo, entonces $\grad f(x_{k+1}) = 0$ y por lo tanto:
$$
\grad f(x_k) + \alpha_k H(h_k)d_k = 0
$$
De donde resulta:
$$
d_k = -H^{-1}(x_k) \grad f(x_k)
$$

### Metodo Quasi Newton

La idea es disminuir el costo computacional asociado a calcular el hessiano y su inversa. Se basan en aproximar la matriz $H^{-1}(x_k)$ y es reemplazada por una matriz aproximada, definida positiva $B_k$.

Este metodo no puede ser utilizado en problemas de redes neuronales por su alto costo computacional.

### Metodo de Direcciones Conjugadas

Sea el conjunto de direcciones $d_1,\dots,d_n$ y $A$ una matriz simétrica definida positiva, entonces:

-  Si $\forall i \neq j, d_j^tAd_j = 0$ entonces se dice que $d_1,\dots,d_n$ son direcciones $A-$conjugadas.
- Si un conjunto de vectores es $A-$conjugados, con $A$ simetrica, definida positiva entonces es también un conjunto linealmente independiente.

Dada una función cuadrática:
$$
f: \R^n \rarr \R: f(x) = x^tHx + b^tx
$$
Si un metodo de minimizaron no lineal realiza las búsquedas unidimensionales sobre direcciones $H-$conjugadas, entonces el metodo converge en $n$ pasos.

### Metodos de Gradientes Conjugados

En cada paso $k$ se calcula una nueva dirección $d_{k+1}$ que es $H(x_k)-$conjugada con todas las direcciones anteriores $d_1,\dots,d_k$



















