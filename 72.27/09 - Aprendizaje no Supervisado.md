# Aprendizaje No Supervisado

Para lograr un sistema de aprendizaje no supervisado es necesario construir modelos de predicción cuando la respuesta no esta disponible. Esta solución debe resolver 3 problemas:

- **Agrupamiento**: Agrupan observaciones de forma tal que el grado de similitud entre los miembros de un grupo sea lo mas fuerte posible.
- **Asociaciones**: Consiste en el almacenamiento y recuperación de información por asociación con otras informaciones.
- **Reducción de la dimensionalidad**

## Redes de Kohonen

Las redes de kohonen descubren por si mismas las regularidades de los datos de entrada. A este concepto también se lo conoce como **Self-Organized Maps**.

En este modelo, las neuronas están conectadas entre si. Las conexiones de una neurona en si misma están conectadas con un valor positivo y con el resto de las neuronas con un valor negativo.

<img src="Resources/09 - Aprendizaje no Supervisado/image-20220518182352314.jpg" alt="image-20220518182352314" style="zoom:25%;" />

Este sistema produce que a lo largo del tiempo algunas unidades tengan un novel de activación mayor, mientras que otras tengan una activación nula. Dada la unidad de entrada $x$, la neurona que tenga el vector de pesos $w$ mas parecido a $x$ sera la ganadora.

Formalmente, una **red de kohonen** es una red de una sola capa, en forma de grilla bidimensional ($k\times k$) y en la que cada neurona esta conectada a todas las componentes de un vector de entrada $n-$dimensional. Esto significa que pasa la información de un estado multidimensional a uno bidimensional:

<img src="Resources/09 - Aprendizaje no Supervisado/Screen Shot 2022-05-18 at 18.30.08.jpg" alt="Screen Shot 2022-05-18 at 18.30.08" style="zoom:50%;" />

Podemos definir una sere de unidades vecinas, y con esto el concepto de **vecindario**. Un vecindario se define con un radio $R$:
$$
\text{4-vecinos} \rarr R=1\\
\text{4-vecinos} \rarr R=\sqrt 2
$$
Las neuronas vecinas tienen un grado de similitud entre sí.

Este tipo de redes puede ser más rápidas que el perceptron multicapa y ademas puede ser aplicado en casos donde el conjunto de entrada no esta etiquetado.

Por otro lado, si el conjunto de variables es muy grande, puede ser difícil asociarlo con un conjunto bidimensional. Otro problema es que solo se pueden utilizar variables numéricas y ademas hay que definir el tamaño de la grilla desde un principio.

### Aprendizaje Competitivo

Este modelo se basa en el aprendizaje competitivo, esto implica que las neuronas compiten unas con otras con el objetivo de que finalmente solo una de las neuronas de salida se activen y las demás sean forzadas a valores de respuesta mínimos.

El objetivo de este aprendizaje es agrupar los datos que se introducen en la red y la información similar es clasificada formando parte de la misma categoría o grupo y deben activar la misma neurona de salida.

### Algoritmo

El algoritmo sigue los siguientes pasos:

1. Obtener $X^p=\{x_1^p,\dots,x_n^p\}$, siendo $p=1,\dots,P$ los registros de entrada normalizados.

2. Definir la cantidad de neuronas de salida $k\times k$

3. Inicializar los pesos $W_j,i-1,\dots,k^2$, compuestos de la siguiente forma:
   $$
   W_j = (w_{j1},\dots,w_{jn})
   $$
   Estos valores puede estar inicializados de forma aleatoria con una distribución uniforme o con ejemplos del conjunto de entrenamiento elegidos al azar. Esta ultima opción es preferida.

4. Seleccionar un tamaño de entorno inicial $R(0)$. Una sugerencia para este valor es utilizar el tamaño total de la red.

5. Seleccionar la tasa de aprendizaje inicial $\eta(0)<1$

Luego, por cada iteración $t$ debemos hacer:

1. Seleccionar un registro de la entrada $X^p$

2. Encontrar la neurona ganadora $\hat k$ utilizando distancia euclidiana:
   $$
   W_{\hat k} = \arg\min_{1 \le j\le N} \{||X^p - W_j ||\} \\
   $$
   O con otros métodos:
   $$
   W_{\hat k} = \arg \max_{1 \le j \le N} \{e^{-||X^p-W_j||^2}\}
   $$

3. Calculo el grupo $N_{\hat k}$:
   $$
   N_{\hat k}(t) = \{\text{neurona } / ||\text{neurona} - \text{neurona}_{\hat k}|| < R(t)\}
   $$
   Donde la función $R:\lim_{t\rarr \inf} R(t) = 1$.

4. Actualizar los pesos de las neuronas vecinas según la regla de Kohonen:
   $$
   \array{
   w \in N_{\hat k}(t)& \rarr  & W_j^{t+1} = W^t_j + \eta(t) \times(X^p -W_j^t)\\
   w \not\in N_{\hat k}(t)& \rarr  & W_j^{t+1} = W^t_j 
   }
   $$
   Donde la función $\eta: \lim_{t\rarr\inf} \eta(t) = 0$ , por ejemplo $\eta(t) = \frac 1 t$

La cantidad de iteraciones a utilizar suele estar relacionada con la cantidad de neuronas de entrada:
$$
\text{iteraciones} = \text{neuronas de entrada} \times 500
$$

### Preprocesamiento de datos

El conjunto de datos de entrenamiento debe ser normalizado para las variables del conjunto de prueba y de entrenamiento. Sea $\overline X_i$ la media y $s_i$ la desviación estándar de $X_i$:
$$
\tilde X_i = \frac{X_i - \overline X_i }{s_i}
$$




























