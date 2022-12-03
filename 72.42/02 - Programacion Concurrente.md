# Programación Concurrente

Un **programa** es una secuencia de instrucciones escrita para ealizar una tarea especifica en una computadora. Es un elemento estático. Un  **proceso** es un programa en ejecución que tiene asignado cierto procesamiento y recursos.

Existen 4 modelos de programación:

- **Modelo Secuencial**: Hay un unico procesador y los procesos se corren de forma intermitente utilizando a un scheduler. Hay varias formas de implementar al scheduler, puede ser first-come first-server, intercalar procesos, round robbin, etc.
- **Modelo Concurrente**: Se separa a la logica en diferentes threads y estos corren en paralelo, aunque comparten al mismo proceso. Para ejecutar distintos threads en un programa de Java se tiene que usar la interfaz `ExecutorService`.
- **Modelo Distribuido**

## Modelo Secuencial

## Modelo Concurrente

Al utilizar el modelo concurrente, hay que tener en cuenta la sincronización, disponibilidad y coordinación.

Podemos evitar la sincronización si usamos objetos inmutables o coordinamos mediante el patron PubSub.

### Sincronización 

Los threads viven en la misma zona de memora, por lo que se pueden dar condiciones de carrera. Para evitar esto, los programadores pueden usar acciones atómicas. En Java se consideran atómicas:

- Las lecturas y escrituras de referencias a variables y la mayoria de las primitivas (excepto `long` y `double`)
- Lecturas y escrituras de variables declaradas como `volatile`.

En los casos que se require más de una acción en el mismo contexto, podemos utilizar la keyword `syncrhonized`. Esta palabra permite que lo bloquee el acceso a memoria de otros threads hasta que termine. Esta impementado con semaforos, por lo que puede dar lugar a deadlock.

### Coordinación

Para resolver ciertos problemas de threading se requiere que estos se coordinen. La forma nativa de coordinar seria mediante el uso del método `wait` para el que espera y `notifyAll` para el que notifica que termino.

Los distintos métodos de coordinación se implementan con la clase `Condition`. Existen los siguientes tipos de condiciones:

- `Semaphore` Se inicia con una serie de elementos y al pedir el lock te da uno de esos elementos.
- `CountDownLatch`: Se inicia con un contador que se puede decremento. El thread se va a bloquear hasta que el contador llegue a 0. Es util cuando tenemos procesos en paralelo y necesitamos instanciar un thread cuando otro termina de ser ejecutado.
- `Phaser`: Permite que 2 threads puedan pasarse un objeto.

## Modelo Distribuido

