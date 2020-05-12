# Gestion de Procesos

## Criterios y Tipos de Planificación

El objetivo de la multiprogramacion es tener siempre un proyecto en ejecucion para aprovechar mejor los recursos del CPU. Esto genera problemas cuando estamos ejecutando mas programas que nucleos, ya que solo puede haber un programa en ejecucion en un determinado momento por nucleo. Para solucionar esto, el sistema operativo mantiene en memoria a varios procesos a la vez y se los va a entregar al procesador cuando sea su turno de ser procesados.

#### Ciclos de rafagas de CPU y E/S

La ejecucion de un proceso consiste en un ciclo de ejecucion alternando de manera sucesiva:

- **Rafgas de CPU**: son los ciclos del CPU durante los cuales el proceso ejecuta instrucciones.
- **Rafagas de E/S**: son los ciclos de CPU durante los cuales el proceso utiliza o espera a la E/S.

Las rafagas de CPU varian considerablemente entre un proceso y otro, pero mantienen una curva de frecuencia bien tipificada. Esta curva se representa en el siguente grafico:

<img src="Resources/image-20200407205656351.png" alt="image-20200407205656351" style="zoom:50%;" />

Si un proceso tiene rafagas de CPU cortas significa que esta limitado por la E/S, mientras que si son largas entonces esta limitado por el CPU.

#### Planificacion Expropiativa

Las planificaciones de CPU se toman segun cuatro situaciones:

1. Cuando un proceso pasa del estado en ejecucion a en espera.
2. Cuando un proceso pasa del estado en ejecucion a listo.
3. Cuando un proceso pasa del estado en espera al estado listo.
4. Cuando un proceso termina.

Los casos 1 y 4 corresponden a una planificacion no expropiativa, es decir que a la fuerza hay que escoger un nuevo proceso. Los casos 2 y 3 corresponden a una planificacion expropiativa.

#### Criterios de Planificación

La planificacion se hace en base a los siguentes criterios:

- **Utilizacion de CPU**: Es el porcentaje de tiempo que le CPU esta ocupado.
- **Rendimiento**: Es el numero de procesos (trabajos) que se completan por unidad de tiempo.
- **Tiempo de Retorno**: Tiempo transcurrido entre la llegada de un proceso y su finalizacion.
- **Tiempo de Espera**: Tiempo que un proceso permanece en la cola de preparados.
- **Tiempo de Respuesta**: Tiempo que un proceso bloqueado tarda en entrar en el CPU desde que ocurre el suceso hasta que lo bloquea.

En base a esto se puede empezar a planear nuestro gestor de procesos. Nuestros objetivos suelen ser:

- Minimizar el tiempo de medio espera o de retorno
- Maximizar la utilizacion de CPU
- Mantener el tiempo de respuesta por debajo de un valor maximo.

Si desarrollamos sistemas interactivos, como los sistemas operativos actuales (comparten tiempo de procesamiento entre varios procesos), se consideran tambien los valores medios de estas medidas. Pero la verdad es que ninguna estrategia es perfecta y siempre terminamos dependiendo del tipo de procesos o de un criterio.

## Algoritmos de Planificación

#### First Come, First Served (FCFS)

Es un algoritmo de planeacion de servicio por orden de llegada, el primer proceso que solicita acceso al CPU lo obtiene. El problema esta en el tiempo de espera promedio que suele ser bastante largo.

#### Shortest Job First (SJF)

Este algoritmo permite que los trabajos mas cortos se ejecuten primero. Calcula cual es el proceso mas corto en base a las rafagas del CPU y minimiza el tiempo de espera medio.

Este algoritmono es implementable ya que solo se pueden estimar las duraciones de los procesos en base a su historial, ademas es probable que los procesos mas largos nunca se ejecuten.

#### Planificacion por Prioridad

Cada proceso tiene una prioridad asignada y entra al CPU el proceso con mayor prioridad. Esta prioridad puede ser definida porel usuario o por el sistema operativo. Este algoritmo tiene un problema similar al anterior: los procesos con menor prioriadad pueden no ejecutarse nunca. Este problema es resuelto haciendo que los procesos mas viejos tengan mas prioridad.

#### Round Robin (RR)

Es una implementacion adecuada para sistemas operativos de tiempo compartido y posee un comportamiento similar al del FCFS, con la diferencia que cada proceso dispone de un tiempo maximo.  La cola de procesos es gestiona como FIFO.

Este algoritmo se comporta de distinas formas dependiendo del tiempo de ejecucion de cada proceso:

- Si el tiempo es muy grande, entones los procesos terminan sus rafagas antes de que lo corte el sistema operativo, entonces se comporta como un FCFS.
- Si el tiempo es de una magnitud normal, entonces se tiene a un sistema enell que cada proceso dispone de un procesador de $\frac 1 n$ de la velocidad del procesador real.
- Si el tiempo es muy pequeño, entonces suceden cambios de contexto constantemente y el rendimiento disminuye.

#### Colas de Multiples Niveles

En este algoritmo se distingue entre procesos que pueden tener distintas necesadades en cuanto al tiempo de respuesta y por lo tanto distintas necesidades de planificacion. Estos procesos se suelen dividir entre:

- Procesos que se ejecutan en primer plano o **interactivos**.
- Procesos que se ejecutan en segundo plano o **por lotes**.

Este algoritmo divide a la cola de procesos listos en varias colas, y cada una de ellas tiene su propio algoritmo de planificacion, y el tiempo de ejecucion se puede dividir entre las colas de forma igualitaria o por prioridades.

#### Colas de Multiples Niveles y Retroalimentación

Es una variacion del metodo anterior donde los procesos que pertenecen a una cola pueden moverse a otra cola. De esta forma si un proceso gasta demasiado tiempo de CPU, se pasa a una cola de menor prioridad, mientras que si un proceso tiene que esperar mucho, se mueve a uno de mayor prioridad.

### Implementacion en Multiprocesadores

Para implementar cualquiera de estos algortimos tenemos que tener en cuenta que si tenemos mas CPUs, se va a complejizar mas el problema. Por esto vamos a asumir que cualqueir procesador puede ejecutar cualquier proceso de la cola y que la cola va a ser comun para todos los procesos, es decir que no va a haber procesadores al pedo ni procesadores trabajando a full.

Para encarar a esto hay dos estrategias, podemos hacer que cada procesador se autoplanifique, asegurandose que todos los procesos tengan tiempo de procesador y que nunca haya dos procesadores que elijan el mismo procesos. Tambien podemos designar a un nucleo como planificador, y este le indica a los demas nucleos que procesos correr.

## Evaluacion de Politicas de Planificación

Hay dos formas principales de elegir a un algoritmo de planificacion. Se deben evaluar los criterios de evaluacion del algoritmos y se deben evaluar las politicas del algoritmo.

Para evaluar los criterios de evaluacion de un algoritmo utilizamos el grado de utilizacion del CPU, el tiempo de respuesta y el rendimiento. 

Por otro lado, para evaluar las politicas del algoritmo hay distintas formas:

- **Modelado Determinista**: Es una evaluacion analitica del algoritmo, se calcula el desempeño de un algoritmo teniendo en cuenta la carga de trabajo del sistema. Este modelado es comodo de realizar y proporciona magnitudes exactas para comparar algoritmos, pero limita su validez a un tipo especifico de trabajos.
- **Modelado de Colas**: Se evalua a partir de una distribucion estadistica de rafagas de CPU y de E/S, se hace una distribucion de los tiempos de llegada al sistema
- **Simulaciones**: Consiste en la programacion de un modelo del sistema de computacion. En ese modelo se utilizan generadores aleatorios para generar procesos, rafagas, llegadas, etc. Estas tareas suelen ser simulaciones costosas que requieren tiempo y recursos, ademas de ser complicados de diseñar y analizar.
- **Implementación**: Es el metodo mas confiable, ya que consiste en programar al algoritmo y probarlo dentro de nustro sistema operativo. Esto mismo causa problemas ya que estamos modificando el sistema operativo.

La solucion a estos problemas es encararlo con distintos analisis del algoritmo. Primero se debe hacer un analisis preliminar de las politicas candidatas mediante modelos deterministas, luego simulaciones y por ultimo implementar las opcion optima, para probarlo en el sistema operativo y decidir si se envia a produccion.













