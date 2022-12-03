# Procesamiento Distribuido

A medida que los requerimientos de procesamiento se volvieron demasiado complejos para las bases de datos SQL, se paso al modelo de Data Wharehouse donde el procesamiento es en batches.

Opciones:

- **Spark**
- **Flume**
- **Pig**
- **Apache Hive**

Cuando se trabaja con tanta cantidad de datos, es importante el concepto de **streaming**, es decir un flujo de datos constante que no termina y no se interrumpe. Sobre este flujo se pueden realizar operaciones como filter y join.

Para poder observar los resultados, puedo hacer uso de **windowing**. Esta tecnica particiona al stream en batches discretos. Estos pueden ser:

- **Fixed**: tienen un tiempo de inicio y fin, con una duración constante
- **Sliding**: Los ultimos $n$ minutos.
- **Sessions**: No es temporal, puede ser por la sesion de un usuario.

