# Map Reduce

Es una manera de procesar información distribuida. Todos los datos están separados en dos partes: clave y valor. El proceso tiene 3 etapas:

1. **Map**: Recibe una clave/valor y devuelve otra.
2. **Sort**: Agarra todo lo que emite map y lo ordena de tal forma que todos los valores que comparten clave esten juntos.
3. **Reduce**: Trabaja por clave y va generando resultados.

También existe la etapa del **combiner** que sucede localmente despues de que la computadora ejecuto el mapper. El objetivo es hacer un pre-reduce para evitar mandar muchos datos por la red.

## Hazelcast

El punto de entrada es la clase `JobTracker`. A partir de esta clase debemos implementar las interfaces `Mapper` y `Reducer` para poder ejecutar un trabajo.