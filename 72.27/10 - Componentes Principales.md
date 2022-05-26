# Componentes Principales

Las componentes principales sirven cuando tenemos un conjunto de datos con muchas variables y queremos ver como estas variables se relacionan entre si.

Este metodo obtiene la covarianza entre las variables. La covarianza nos permite ver que tan correlacionadas dos métricas están:

- covarianza > 0: Estan correlacionadas de forma positiva.
- covarianza = 0: No están correlacionadas.
- covarianza < 0: Están correlacionadas de forma negativa.

Para poder calcular las componentes principales, debemos normalizar a todas nuestros datos:
$$
\tilde X_1 = \frac{x_1 - \overline x_1}{s_1}
$$
Donde $\overline x$ indica el valor medio y $s$ la desviación estándar.

Otra medida importante es la **correlacion muestral**. Esta es otra medida de asociación lineal, para los datos de la i-esima y k-esima variable se lo define como:
$$
r_{ij} = \frac{s_{ik}}{\sqrt s_{ii}\sqrt s_{kk}}
$$
La correlation va a estar acotada entre $-1,1$.

## Análisis

Si dos variables están muy correlacionadas, entonces poseen información redundante. El objetivo de este método es eliminar la redundancia. Nuestro objetivo es transformar la conjunto original de variables en otro conjunto, compuesto por las combinaciones lineales de las anteriores, pero que no este correlacionados entre si. A este conjunto se lo llama **componentes principales**.

Dadas $p$ variables originales, se buscan $q<p$ variables que sean combinaciones lineales de las $p$ originales, recogiendo la mayor parte de la información, o variabilidad de los datos.

### Transformación PCA

Supongamos que se dispone de los valores de p-variables en $n$ elementos de una población dispuestos en una matriz $X$ de dimensiones $n\times p$ , donde las columnas contienen las variables y las filas a los elementos.

PCA realiza una transformación de datos del conjunto de datos $X$ qué consiste de una translación y una rotación, definidas de manera tal que la varianza del nuevo conjunto de variables sea maxima.

Para reducir la dimensionalidad de un dataset, debemos requerir que la proyección cubra la mayoría de los detalles. Siempre esta bueno utilizar una variabilidad de al menos $95\%$. El procentaje de variabilidad que poseen las primeras $q$ componentes es:
$$
\frac{\sum_{i=1}^q \lambda_i}{\sum_{i=1}^n \lambda_i}
$$

### Algoritmo

1. Tomar un conjunto de datos $X$ donde las variables están en las columnas.

2. Restar la medida de cada conjunto de variables. Calcular $X-\overline X$ y obtener un conjunto de datos con media 0.

3. Calcular la matriz de covarianzas.

4. Calculas los autovalores y autovectores de la matriz de covarianzas y ordenar los autovalores de mayor a menor.

5. Formar la matriz $E$ tomando los autovectores correspondiente a los mayores autovalores.

6. Calcular las nuevas variables:
   $$
   Y = (X - \overline X) E
   $$

































