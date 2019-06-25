# Estadística Descriptiva

Una **muestra** es una pequeña cantidad de elementos de una población, elegidos al azar, para que esta sea represente bien a todos los individuos. Si la muestra no es representativa, se dice que tiene **sesgo**. La muestra tiene que ser lo mas grande posible.

La **Estadística Descriptiva** describe a una muestra.

## Operaciones

### Promedio

El promedio $(\overline x)$ es la media muestral o valor medio. Se ve muy afectado por los valores individuales extremos, en este caso utilizo la **mediana**.

### Mediana

La mediana se obtiene ordenando a todos los valores de la muestra, de mayor a menor, y se elije al valor que esta en el medio. Es un caso particular del **cuartil**.

### Cuartil

Los cuartiles se obtienen ordenando la muestra y dividiéndola en 2 partes, de las cuales se toma la mediana de la primer mitad (**$q_1$**) y de la segunda mitad (**$q_2$**).

## Variabilidad

### Definiciones

- Rango: es la diferencia entre el primer valor y el segundo.
- Rango Intercuartil: es la diferencia entre el primer cuartil ($q_1$) y el segundo cuartil ($q_2$).
- Desvío Estándar Muestral $(std)(\sigma)$: Indica que tan separados están los datos.
- Varianza Muestral: es el cuadrado del desvío estándar muestral ${(std)}^2$.
- Curtosis $(k)$: Mide que tan distribuidos están los valores a lo largo de la selección de valores, funciona bien si $n$ es grande.

$$
k=\frac{1}{n\ .\ s^4} \times \sum_{i=1}^{n}{(x_i-\overline x)}
$$