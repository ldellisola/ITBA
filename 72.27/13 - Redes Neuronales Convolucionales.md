# Redes Neuronales Convolucionales

Las CNNs están basadas alrededor de la operación de convolución y suelen ser aplicadas al procesamiento de imágenes.

## Convoluciones

Una **convolucion matemática** es una operación lineal. Suponiendo que $x(t)$ es una señal unidimensional en función del tiempo y $w(t)$ es un núcleo de convolución:
$$
s(t) = (x * w)(t) = <x(k),w^*(t-k)>
$$
Donde $*$ es el conjugado.

Una **convolución discreta** se define como:
$$
s[n] = \sum_k x[k] \times w[n-k]
$$
La convolución matemática cumple un rol muy importante en el procesamiento de señales digitales. 

Una **convolución bidimensional** se define como:
$$
\array{
S(i,j) = (l * k) (i,j)\\
S(i,j) =\sum_m\sum_n l(i-m,j-n) \times K(m,n)
}
$$
La operación de filtrado básica  en visión por computadora es mediante la aplicación de una operación de convolución con diferentes kernels ( $K()$ ) de convolución.

## CNN

En el análisis de imágenes, es necesario aplicar filtros a las imágenes para resaltar ciertas características, como detectar bordes horizontales y verticales. Estos filtros son las distintas funciones de kernel.

<img src="Resources/13 - Redes Neuronales Convolucionales/Screen Shot 2022-06-15 at 21.50.28.jpg" alt="Screen Shot 2022-06-15 at 21.50.28" style="zoom:50%;" />

La idea es modificar un perceptron multicapa de forma que realice una operación de convolución, de una capa a la otra.

<img src="Resources/13 - Redes Neuronales Convolucionales/Screen Shot 2022-06-15 at 21.52.51.jpg" alt="Screen Shot 2022-06-15 at 21.52.51" style="zoom:50%;" />

### Capas

- **Pooling**: Es similar a un downsampling. La version más usada es **MaxPooling**, que reduce una region de $2\times 2$ a su valor máximo. 

  <img src="Resources/13 - Redes Neuronales Convolucionales/Screen Shot 2022-06-15 at 21.57.14.jpg" alt="Screen Shot 2022-06-15 at 21.57.14" style="zoom:50%;" />

- **Fully Connected Layer**: Al final de la red hay una o más capas que se encargan de hacer la clasificación final. Para hacer esto se suele utilizar softmax:
  $$
  \sigma(V)_i = \frac{e^{V_i}}{\sum_{j=1}^K e^{V_i}}
  $$

- 

#### BackPropagation

En las capas de convolución, como los pesos son compartidos, es necesario acumular todas las variaciones a la hora de actualizar los pesos.

Supongamos una red para identificar perros y gatos:

1. Se inicializa la red al azar.
2. Calculamos los valores de salida, capa a capa.
3. En las capas fully-connected, back propagation funciona igual que en el perceptron multicapa.
4. En las capas de pooling, solo se actualizan la contribución de los pesos de la salida ganadora.
5. En las capas convolucionales hay que mantener los pesos de los filtros en la relación espacial.

#### Arquitectura

Las diferentes combinaciones de capas de convolución, reLU, pooling y fully connected nos permiten armar arquitecturas profundas y complejas que intentan de solucionar diferentes problemas.

## Aplicaciones

Dependiendo de la dimension de una CNN y si es de un solo canal o de varios canales, podemos definir aplicaciones especificas:

<img src="Resources/13 - Redes Neuronales Convolucionales/Screen Shot 2022-06-15 at 22.28.49.jpg" alt="Screen Shot 2022-06-15 at 22.28.49" style="zoom:50%;" />



























