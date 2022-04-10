# Algoritmos Genéticos

La idea detrás de los algoritmos genéticos es que combinando buenos estados es posible encontrar mejores.

### Requerimientos

Para que problema sea posible que se resuelva mediante estos algoritmos, se deben cumplir con lo siguientes requerimientos:

- El espacio de las posibles soluciones debe estar delimitado dentro de un rango y debe ser finito. Si no ocurre se puede aplicar algún criterio de parada.
- Se debe definir una función de aptitud (o costo) que nos indique que tan buena o mala es una solución.

### Ventajas

- Son menos afectados por los máximos locales que las técnicas tradicionales.
- Es posible ejecutarlos de forma paralizada.

### Desventajas

- Pueden tardar mucho en converger o no converger.
- Pueden converger prematuramente.

## Algoritmo

<img src="Resources/03 - Algoritmos Geneticos/Screen Shot 2022-03-22 at 09.15.54.png" alt="Screen Shot 2022-03-22 at 09.15.54" style="zoom:50%;" />

### Genotipo

El genotipo es la estructura que se utiliza para codificar el cromosoma de un individuo. Se pueden representar de distintas formas, entre otras:

- **Representación Binaria**: Los individuos pueden codificarse con 0s y 1s. El largo del vector depende de la precisión requerida. En un genotipo $E=[1010110]$, el **locus** es el i-esimo gen que se encuentra en la posición i. El valor $E(i)$ es llamado **Alelo**.
- **Representación con Números Reales**: Similar a la forma anterior pero se guardan los números reales a optimizar.

Tenemos dos operadores:

- **Cruza**: Sirve para mezclar los genotipos de dos individuos.
- **Mutación**: Agrega aleatoriedad al proceso de generación de nuevos individuos, para evitar que el algoritmo se caiga en un máximo local.

Para **seleccionar a los individuos**, tenemos que evaluar a toda la población en cuanto a su función de fitness y debemos elegir a los individuos que serán padres de la próxima generación.

### Población Inicial

La población, grupo de individuos, inicial es elegida aleatoriamente con un tamaño $P$. Solo hay que tener en cuenta las restricciones en caso de que las hubiera.

### Algoritmos Basico

```pseudocode
List population = CreateRandomPopulation(size=1000);
do 
  population.SortBy(p => p.CalculateFitness());
  List nextPopulation = new Set();

  while nextPopulation.Lenght != 1000:
    (a, b) = population.PickTwoProportionalTo(p => p.Fitness);
    (newA, newB) = Breed(a,b);
    ApplyMutation(newA, newB);
   
  population = SelectBest(population,nextPopulation);
  
while !population.HasToStop();

```

### Fitness

**La función fitness** se utiliza para medir qué tan bueno es cada solución (individuo). Es el valor que define si el individuo va a sobrevivir otra generación o no.

### Cruzamiento

A partir de dos cromosomas se pueden obtener otros dos, utilizando los siguientes métodos:

- **Cruza Simple**: Se utiliza un punto en el cromosoma, donde un hijo obtiene la primera parte del padre A y la segunda del padre B, mientras que le otro hijo obtiene el cromosoma opuesto.
  $$
  \text{Sean cromosomas } X_1=\{s_1,\dots,s_n\}, X_2=\{t_1,\dots,t_n\}\\
  \text{se elige un punto al azar }p\in\{1,\dots,n\} \text{ y se intercambian} \\
  \text{los aleolos a partir del locus $p$ y se producen dos hijos}: \\
  Y_1 = \{s_1,\dots,s_p,t_{p+1},\dots,t_n\}, Y=\{t_1,\dots,t_p,s_{p+1},\dots,s_n\}
  $$

- **Cruza multiple**: Es similar al anterior, pero en vez de utilizar un solo punto, se utiliza una cantidad aribitraria de puntos. El intercambio se realiza de la siguiente forma: uno se deja igual, otro se cambia, se deja igual, se cambia, etc.

  <img src="Resources/03 - Algoritmos Geneticos/Screen Shot 2022-03-22 at 10.06.26.png" alt="Screen Shot 2022-03-22 at 10.06.26" style="zoom:30%;" />

- **Cruza Uniforme**: En cada elemento del cromosoma, se intercambian los alelos con una probabilidad de $0.5$.

### Mutación

 La mutación proporciona un elemento de aleatoriedad en los individuos de la población.

- En representación binaria, cada alelo tiene probabilidad $p$ de cambiar.
- En representación real, se le agrega un pequeño porcentaje del valor actual, usando una distribución normal centrada en $0$ y con un pequeño desvio. Esta desviación solo se realiza en base a la probabilidad $p$.

### Selección

 Una vez obtenidos los individuos descendientes de una población en una generación, hay que elegir $P$ Individuos entre los $2P$ Individuos que forma a la población actual.

- **Muestreo Directo (Elite)**: Selecciona a los individuos con mayor aptitud. Este metodo suele resultar en poca diversidad.

- **Muestreo Estocástico**: Selecciona los individuos combinando el fitness y el azar.

- **Metodo de Ruleta**: La probabilidad de que un individuo sea seleccionado es proporcional a su fitness relativo:
  $$
  P(\text{seleccionar}-i) = p_i=\frac{f(i)}{\sum_{i=1}^Pf(i)}i= 1,\dots,P
  $$
  Pero, si la función de fitness se unos pocos individuos mucho mas grande que el resto, entonces solo esos serán elegidos.

- **Método Rank**: La probabilidad de selección de un individuo es inversamente proporcional a la posición que ocupa luego de ordenar a todos los individuos de mayor a menor fitness:
  $$
  P(\text{seleccion}-i) = p_i = \frac{P-\text{rank}(f(i))}{P}
  $$
  Siendo $\text{rank}$ la función que ordena de mayor a menor, mientras que la selección se realiza de la misma forma que antes.

- **Selección Competitiva**:

  <img src="Resources/03 - Algoritmos Geneticos/Screen Shot 2022-03-22 at 11.01.28.png" alt="Screen Shot 2022-03-22 at 11.01.28" style="zoom:50%;" />

- **Selección de Boltzmann**: Usa una función de variación de temperatura que controla que la selección de individuos no sea entre los mejores todo el tiempo. Se pretende mantener que la selección sea uniforme al comienzo, y elitista al final.

  Al principio se utiliza un valor alto de temperatura $T$, y con el transcurso de las generaciones, se va reduciendo:
  $$
  \text{VE}(i,t) = \frac{e^{f(i,t)/T}}{\sum_{i=1}^P e^{f(i,t)/T}}
  $$
  Donde $f(i,t)$ Es la función de aptitud para la generación $t$, luego se utiliza esta función de pseudo-aptitud $\text{VE}$ Como aptitud para seleccionar con el método de selección de ruleta.

  <img src="Resources/03 - Algoritmos Geneticos/Screen Shot 2022-03-22 at 11.08.29.png" alt="Screen Shot 2022-03-22 at 11.08.29" style="zoom:50%;" />

- **Selección Truncada**: Elijo un $k$ arbitrario y elimino los primeros $k$ individuos con menor fitness de la población.

### Convergencia Prematura

Se dice que llegamos a una convergencia prematura si se llega a una solución sin presentar mas variedad de la que introduce la mutación y sin haber llegado a una aptitud aceptable. Algunas de las causas son:

- Una selección muy estricta.
- Una probabilidad de mutación muy baja.
- Un tamaño muy escaso.

### Criterios de Corte

Se puede parar a una solución dependiendo de varios factores:

- **Tiempo**
- **Cantidad de generaciones**: minimo 500.
- **Solución aceptable**
- **Estructura**: Que una parte relevante de la población no cambie en una cantidad de generaciones.
- **Contenido**: El mejor fitness no cambia en una cantidad dad de generaciones.

