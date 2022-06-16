# Autoencoders

Es una red neuronal no supervisada con una gran reducción de dimensionalidad. Son la base de algunos modelos de redes neuronales generativas.

Estas compuestas por dos perceptron multicapa, donde la salida de la primer red se conecta con la entrada de la segunda. La idea es que la segunda red tiene la distribución invertida de neuronas en las capas, y como salida tiene la misma dimensión que la primer red:
$$
\array{
z = f(x) = h(x\times w b)\\
x' =g(z) = h(z \times v + p)
}
$$
Tal que se cumple:
$$
L(x,x') = ||x-x'||^2
$$
<img src="Resources/12 - Autoencoders/Screen Shot 2022-06-15 at 19.41.51.jpg" alt="Screen Shot 2022-06-15 at 19.41.51" style="zoom:50%;" />

La idea es que se puede agregar restricciones que fuercen al autoencoder a aprender algo útil de la distribución del set de datos. Naturalmente, estas redes presentan una arquitectura que fuerza a las capas centrales a tener menos neuronas. Esto fuerza a encontrar una codificación más eficiente. 

## Autoencoder Lineal

<img src="Resources/12 - Autoencoders/Screen Shot 2022-06-15 at 19.46.15.jpg" alt="Screen Shot 2022-06-15 at 19.46.15" style="zoom:50%;" />

Una vez que el autoencoder aprende, minimiza:
$$
\array{
J = || X-XV^T || \\
X \sim ZV^T
}
$$
Donde:

- $X$ : Es la matriz de datos, de tamaño $n\times d$ . ( $n$ datos de dimensión $d$ )
- $Z$ : Es la salida de la capa interna del autoencoder, del codificador $n \times k$
- $V$ : Es la matriz de pesos sinápticos asociada al decodificador de $k \times d$ 

Si $V^T$ es ortonormal, entonces $X \sim ZV^T$ del autoencoder puede verse como la descomposición en valores singulares:
$$
X \sim \text{SVD}(X) = \tilde Z \Sigma V^T = ZV^T
$$
A su vez, la descomposición espectral, con los autovectores de la matriz de covarianza $\frac{X^TX}{n-1}$ se puede obtener como:
$$
\frac{X^TX}{n-1} = ELE^T
$$
Donde $E$ es la matriz de transformación de PCA con los autovectores.

Entonces, reemplazando $X$ como la factorización por $X \sim \text{SVD(X)} = \tilde Z\Sigma V^T$:
$$
\frac{X^TX}{n-1} = ELE^T = V \left(\frac{\Sigma^2}{n-1}\right) V^T
$$
Si $X$ tiene media cero:

- $\lambda_i = \frac{S_i^2} {n-1}$ con $S_i$ los valores singulares de $\Sigma$
- $V=E$

Entonces puedo transformar los datos con PCA:
$$
T_{\text{PCA}}(X) = XE = Z
$$
Que corresponde a la salida del espacio latente.

###  Lemma PCA

> La salida del código interno $Z$ del autoencoder lineal son las salidas de las proyecciones de los datos en los componentes principales:
> $$
> T_{\text{PCA}}(X) = XE  =Z
> $$

### Reducción No Lineal

También se puede plantear a este problema con funciones no lineales, por lo que podemos pensar al autoencoder cómo una extension no lineal de la descomposición en componentes principales.

No es una forma muy eficiente de realizar a este proceso, pero es una asumpción muy fuerte. 

## Denoising Autoencoders

Denoising es un método que permite eliminar el ruido. Como los autoencoders generan una aproximación de la matriz de dato, entonces esto puede utilizarse para dos tareas:

- **Identificación de Outliers**: Se entrena al autoencoder con el conjunto de entrenamiento y luego se somete a nuevas muestras que no necesariamente se encuentran dentro del conjunto. Se mide con alguna medida la diferencia entre cada valor de entrada del autoencoder y los valores de salida.

- **Eliminación de Ruido**: El ruido son las perturbaciones sobre los datos que contaminan al contenido. Los DAE pueden utilizarse para eliminar al ruido ya que intentan de preservar el contenido de la información más importante en el conjunto de datos.

  La idea es que una vez aprendido un conjunto de datos, cuando aparecen nuevas muestras que pueden estar contaminadas, reemplazar la muestra ruidosa por la muestra obtenida en la salida del decodificador.

  Para esto, en vez de entrenar con los elementos obtenidos por el conjunto de datos, se modela al ruido, ya sea numéricamente o con una distribución de probabilidad. Este modelo luego es agregado a los datos  generando un nuevo dataset.

## Regularización 

Regularizar implica agregar una condición extra $R$ sobre la función objetivo $L$ que limite al espacio de búsqueda de soluciones:
$$
J = L + \lambda R = \min_\phi \frac 1 N ||Y - X\phi|| + \lambda ||f(\phi)||
$$
Esto evita las soluciones complejas o extremas en un problema de optimización. El parámetro de regularización $\lambda$ se usa para ajustar la importancia que se le da al termino regulador ( $ \lambda ||f(\phi)||$ ).

## Contractive Autoencoder

Los CAE agregan un termino regularizador a las funciones de costo, que le resta sensibilidad a la entrada, intentando de aprender representaciones más simples y crudas de los datos. Esto sirve, por ejemplo, para reducir la dimensionalidad de los datos.

<img src="Resources/12 - Autoencoders/Screen Shot 2022-06-15 at 20.15.10.jpg" alt="Screen Shot 2022-06-15 at 20.15.10" style="zoom:50%;" />

## Sparse Autoencoder

Los SAE utilizan una arquitectura donde **el espacio latente tiene más dimensiones que la entrada**. También imponen condiciones regularizadoras, pero para adquirir información sobre la estructura. Estos métodos suelen favorecer la presencia de esparcidad.

Este tipo de autoencoder se puede utilizar para realizar Feature Learning, es decir, identificar características en los datos.

## Generative Autoencoder

Los modelos pueden ser:

- **Generativos**: Establece cierta relación causal e hipnotiza como se generan los datos en si.
- **Discriminativo**: Es crudo sobre los datos.

Estos autoencoders nos permiten obtener muestras que comparten características representativas del conjunto de datos. El algoritmo es el siguiente:

1. Utilizamos un autoencoder para codificar en el espacio latente todos los patrones.
2. Dentro del vector de representación, generamos muestras sucesivas especificando de manera directa los valores de $z_1,z_2$ .
3. Para cada tupla de valores $z_i$ obtenemos una muestra generada por el decodificador.

### Teoria de la Información 

La **entropía** es mínima (cero) cuando la situación es de total certeza, y es máxima cuando todos los eventos son equiprobables.

La **entropía binaria cruzada** sirve como una función para estimular cual es la efectividad de un clasificador que asigna el label y a cada elemento de $1\dots N$ con probabilidad $p(y_k)$ . Un clasificador perfecto que estima $y_i$ con probabilidad 1 genera un valor de entropía binaria cruzada de cero.

La **entropia relativa** es una norma que permite ver la distancia entre distribuciones de probabilidad:
$$
\text{KL}(q||p) = - \sum_{x_i} q(x) \log \frac{q(x)}{p(x)}
$$
Propiedades:

- $\text{KL}(p||q) \neq \text{KL}(q||p)$
- $\text{KL}(q||q) = 0$
- $\text{KL}(p||q) \ge 0$
- $\text{KL}(q||p) = H_p(q) - H(q) \ge 0$

### Variational Autoencoder

Los VAE son la convergencia de dos ideas:

- Una estimación variacional de un modelo generativo
- Una solución a esa estimación basada en dos redes neuronales feedforward acopladas.

<img src="Resources/12 - Autoencoders/Screen Shot 2022-06-15 at 21.23.42.jpg" alt="Screen Shot 2022-06-15 at 21.23.42" style="zoom:50%;" />

La idea es tomar un valor $x$  y lo ponemos como entrada de la red. Con este valor obtenemos luego $\Sigma, \mu$ . Luego realizamos un sampleamos un $z$ de $p(z)= N(0,I)$ . Con este valor podemos decodificarlo y obtener $\hat x$ .

Entrenamos al autoencoder para que minimice $L$ actualizando los primeros pesos del decoder, luego pasando por la función $h(x)$ y de ahí retropropagando el error obtenido en $\mu,\Sigma$ hacia los pesos del encoder.

El **parametrization trick** de la capa estocástica de la red permite retropropagar el error manejando esa capa que tiene una entrada que es una variable aleatoria:

<img src="Resources/12 - Autoencoders/Screen Shot 2022-06-15 at 21.28.29.jpg" alt="Screen Shot 2022-06-15 at 21.28.29" style="zoom:50%;" />

### Redes Bayesianas

El teorema de Bayes nos permite calcular una probabilidad condicional en base a su probabilidad conjugada. Con esto se puede construir un clasificador simple, basado en evaluar esa probabilidad condicional. Entonces cuando se realiza una observación, se puede clasificar.

### Inferencia

Inferencia es notar características no observables de un elemento a partir de sus características observables.



























