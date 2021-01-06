# Memory Management

A la hora de implementar un gestor de memoria, hay 3 cuestiones críticas:

- **Reubicación**: Facilitar que un programa pueda residir en cualquier zona de la memoria física
- **Fragmentación**: Ojo a los huecos que van quedando a medida que se asignan y liberan zonas de memoria.
- **Tiempo de Acceso**: Tener en cuenta el impacto de los mecanismos de gestión en el tiempo neto de acceso a memoria.

## Memoria Virtual

También llamado paginación por demanda, implica que en la creación del proceso no se asignan todas las páginas que tiene en memoria, sino solo las partes que necesita. Esto puede causar que partes del código del programa solo se carguen cuando este necesite ejecutarlo. Para agilizar el acceso a estas páginas de memoria, el sistema operativo intenta de "adivinar" cuales son las páginas que tiene que traer a memoria antes de que las pida mediante una excepción del tipo `page fault`.

Históricamente, el problema de memoria virtual fue solucionado con swapping y librerías linkeadas dinámicamente, entre otras. 

En caso de no tener mas páginas disponibles y no de pueden robar páginas a otros procesos, el sistema operativo se encarga de elegir a un proceso y congelarlo, mandando todas sus páginas a disco hasta que sea ejecutado.

### Localidad

La mayoría de los programas exhibe una fuerte localidad. En cada momento, los accesos a código y a datos se concentra sobre áreas pequeñas del espacio de memoria, esta es la base para que funcione la memoria virtual, ya que si conseguimos traer solo esas pequeñas porciones de memoria cuando necesitamos, los accesos a disco serán mínimos. El problema surge a la hora de adivinar cuales son las zonas de memoria a traer.

Una localidad débil o mala tendría un programa que acceda a muchas páginas distintas en un periodo corto de tiempo.

### Paginado virtual

La memoria virtual va a apuntar a un mapa de memoria, donde este mapa de memoria apunta a la memoria fisca, siendo esta la memoria RAM o el disco duro.

Al robar una pagina, tengo que fijarme si esta fue modificada de su versión del disco (y podemos ver esto por el bit de modificación de la pagina). Si fue modificada, tengo que guardar esta pagina en disco, pero si no lo fue puedo simplemente robar la pagina.

Esto permite que el sistema operativo pueda decidir robar páginas no modificadas, ya que no hay que sincronizarlas con el disco y ahorrarse una cantidad considerable de tiempo.

TLB es un mecanismo de memoria cache para reducir el tiempo de acceso a la memoria del usuario que esta almacenado en el MMU. Esta memoria cache almacena traducciones recientes del MMU para que en caso de tratar de acceder a la misma pagina, se evita accesos a disco.

### Paginación por demanda

La paginación por demanda es una solución a que páginas hay que cargar inicialmente. Con esta solución, al iniciar un proceso no se carga ninguna pagina, y a medida que se necesitan las va trayendo mediante interrupciones de `page fault`.

Otras alternativas a este proceso serian precargar las primeras páginas de código o mediante una heurística poder calcular cuales son las páginas mas accedidas.

## Gestión de Memoria Virtual

### Robado de Páginas

A la hora de robar páginas, nuestro sistema operativo tiene que establecer un criterio para definir que páginas va a robar. Entre las soluciones posibles se encuentran robar la pagina mas nueva o mas vieja, elegir una pagina del proceso que esta pidiendo mas páginas o agarrar la primera pagina no modificada que encuentro.

### Reemplazo de páginas

El objetivo del manejo de memoria virtual es minimizar la frecuencia de fallos de pagina, por esto al reemplazar páginas tenemos que pensar en que páginas no se van a utilizar mucho en el futuro, además de otras consideraciones como el *dirty* bit, que no indica si la pagina esta sincronizada con el disco o no.

Algunos algoritmos canónicos son:

- ***Least Recently Used (LRU)***: Mediante un timestamp se puede identificar cuando fue la ultima vez que se utilizo la pagina. Gracias a esto podemos buscar y elegir la pagina que se haya usado hace mas tiempo y reemplazarla por la pagina que necesitamos.
- ***Least Frequently Used (LFU)***: Podemos asignar un valor a cada pagina donde se indiquen la cantidad de veces que se utilizo una pagina. Con esta información podemos implementar un algoritmo que reemplace la pagina que menos se haya usado.
- ***First in First out (FIFO)***: es un algoritmo simple y no requiere hardware adicional ya que se puede implementar mediante el sistema operativo, pero como no tiene en cuenta el uso real de las páginas, puede destruir pagina que se utilizan todo el tiempo como partes de código del kernel. Otro motivo en contra de FIFO es la anomalía de Belady, esta anomalía surgen en algunos momentos y causa que cuanto mas se aumenta la cantidad de páginas disponibles, mas aumenta la cantidad de interrupciones del tipo `page fault` se generan.

La información para poder utilizar cualquiera de estos métodos están almacenados en la MMU. Por ejemplo podemos pedirle a la MMU que deje un timestamp en la entrada de cada tabla de cuando fue utilizado. Para frecuentemente usado se puede tener un contador, indicando cuantas veces se utilizo la pagina. FIFO se puede implementar de forma similar al LRU.

En la realidad se suelen utilizar alternativas mas simples y que consumen menos recursos como los siguientes:

- ***Not Recently Used (NRU)***: Se crea un bit de referencia en la entrada de la tabla. Este bit de referencia es llevado a 0 cada cierto tiempo y cuando una pagina es utilizada se pone en uno a este valor. Utilizando el bit de modificado,tengo cuatro opciones y puedo elegir el tipo de pagina que preferiría robar, como lo es una pagina no referenciada y no modificada.

### Asignación de Marcos

Es conveniente definir un sistema de reparto de los marcos a los procesos en ejecución. Todos los procesos deben tener una mínima cantidad de marcos asignados, y luego se pueden asignar mas de forma heurística, en base al tamaño, cantidad de marcos que utilizo históricamente, etc.

