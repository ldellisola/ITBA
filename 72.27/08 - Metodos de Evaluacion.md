# Metodos de Evaluación

Tenemos distintas métricas para evaluar la performance de un algoritmo o red neuronal:

- Podemos evaluar un metodo de clasificación con métricas estándar.
- Comparar varios metodos de clasificación aplicados a a un mismo conjunto de datos.
- Comprar un mismo metodo de clasificación aplicado a diferentes conjuntos de datos.
- Evaluar el efecto que produce le cambio de parámetros en un método.

## Evaluación de Métodos de Clasificación

Hay que dividir el conjunto de datos disponibles en dos subsets:

- **Conjunto de Entrenamiento**
- **Conjunto de Prueba**

Luego, para entrenar a la red seguimos los siguientes pasos:

1. Entrenar a la red con el conjunto de entrenamiento
2. Evaluar el método con el conjunto de entrenamiento
3. Evaluar el método con el conjunto de prueba

Dentro de estas métricas, hay varias opciones:

- Matriz de Confusión
- Métricas para la evaluación del rendimiento:

- Diseño del experimento para la evaluación: Validación cruzada


### Matriz de Confusión

Es una tabla que permite evaluar el desempeño de un algoritmo de clasificación. Cada columna representa la cantidad de instancias en la clase dada por el metodo y cada fila representa la cantidad de instancias en la clase verdadera.

Esta matriz nos muestra si el sistema se esta confundiendo las clases. Dentro de esta matriz se muestran los verdaderos positivos y negativos, junto a los falsos negativos y positivos:

<img src="Resources/08 - Metodos de Evaluacion/Screen Shot 2022-04-26 at 09.56.23.jpg" alt="Screen Shot 2022-04-26 at 09.56.23" style="zoom:50%;" />

### Evaluacion del Rendimiento

- **Accuracy**: Los que están bien clasificados sobre todos
  $$
  \frac{\text{TP} + \text{TN}}{\text{TP} + \text{TN} + \text{FP} + \text{FN}}
  $$

- **Precision**: Mide los positivos verdaderos sobre todos los que dieron positivos
  $$
  \frac{\text{TP}}{\text{TP} + \text{FP}}
  $$

- **Recall**: Mide los positivos verdaderos sobre todos los que son positivos
  $$
  \frac{\text{TP}}{\text{TP} + \text{FN}}
  $$

- **F1 Score**: 
  $$
  \frac{2 \times \text{Precision} \times \text{Recall}}{\text{Precision} + \text{Recall}}
  $$

- **Tasa de Verdaderos Positivos**:
  $$
  \frac{\text{TP}}{\text{TP} + \text{FN}}
  $$

- **Tasa de Falsos Positivos**:
  $$
  \frac{\text{FP}}{\text{FP} + \text{TN}}
  $$

Para aplicar cualquiera de estos métodos tenemos seguir los siguientes pasos:

1. Calcular los $w$ Utilizando el conjunto de entrenamiento.
2. Clasificar los datos del conjunto de prueba utilizando el $w$ obtenido en el paso anterior.
3. Calcular las métricas para los ejemplos del conjunto de entrenamiento y del conjunto de prueba.

Luego, para poder ajustar a estos valores podemos cambiar parámetros como el learning rate y los epochs.

<img src="Resources/08 - Metodos de Evaluacion/Screen Shot 2022-04-26 at 10.07.17.jpg" alt="Screen Shot 2022-04-26 at 10.07.17" style="zoom:67%;" />

Al modificar estos parámetros, nos podemos encontrar en la situación de que estamos **sobre ajustando** a nuestra red neuronal. Esto significa que la red esta **sobre entrenada** sobre un dataset especifico y los resultados de este dataset no se ven reflejados en otros. De estar en este caso, se vería en un grafico similar a este:

<img src="Resources/08 - Metodos de Evaluacion/Screen Shot 2022-04-26 at 10.11.41.jpg" alt="Screen Shot 2022-04-26 at 10.11.41" style="zoom:67%;" />

### Validación Cruzada

Este proceso divide aleatoriamente al conjunto de entrenamiento en $k$ partes de igual tamaño. A partir de esto se realizan $k$ Entrenamientos con sus correspondientes evaluaciones, en cada paso, se usa como test a una de las partes y cómo entrenamiento al resto.

<img src="Resources/08 - Metodos de Evaluacion/Screen Shot 2022-04-28 at 10.45.50.jpg" alt="Screen Shot 2022-04-28 at 10.45.50" style="zoom:50%;" />

Luego puede continuar con el algoritmo:

Para $j = 1,\dots,k:$

1. Se realiza el entrenamiento con el $j$-esimo conjunto.
2. Se realiza la evaluación del metodo usando como conjunto de prueba la parte separada para tal efecto.
3. Se calcula alcuna medida de precision del metodo.

Finalmente se eligen los valores de $w$ que proveen el resultado mas preciso para alguna métrica.

















