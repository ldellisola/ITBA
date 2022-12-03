# Store Distribuido

## Hadoop

Hadoop es una herramienta para procesar muchos datos que están guardados en algun lado y los procesa utilizando el paradigma *map-reduce*.

El Hadoop File System (HDFS) esta modelado sobre un paper llamado Google File System creado para guardar archivos de gran volumen y con replicación. HDFS esta diseñado para correr en hardware accesible y escala horizontalmente.

Los **bloques** de hadoop son de 128MB por defecto. El **Namenode** es quien maneja el file system.

### Problemas

- El Name Node es un single point of failure.
- Problemas con el acceso random a la información de los archivos.
- Muchos archivos pequeños degradan la performance.

## Hazelcast

Es un grid de datos en memoria distribuido que permite ejecutar acciones con la estructura map-reduce.

Tiene 3 tipos de nodos:

- **Node Member**: Es el nodo por default. Tiene datos distribuidos y ademas realizan tareas distribuidas.
- **Lite Member**: Son nodos que no guardan información pero pueden ejecutar tareas.
- **Native Client**: Son clientes que se conectan a la red para subir información y ejecutar tareas.

La coordinación de los nodos se realiza *peer-to-peer* por lo que no hay ningún nodo master. El nodo más antiguo se considera coordinador y decide que hacer. Si el nodo coordinador se cae, el proximo nodo más viejo toma su lugar.

La información se divide en 271 particiones y ademas se pueden crear replicas para cada nodo. Las replicas se sincronizan de manera sincronica con la particion oficial, pero se puede garantizar para que esto sea de forma asincrónica. Este cambio garantiza consistencia eventual.

### Split Brain

Cuando 2 o más nodos comparten la antiguedad en la red, la red se parte. Esto genera que ambos clusters sigan funcionando pero recibiendo información incorrecta. Para solucionarlo se siguien estos pasos:

1. Elige un líder entre los dos lideres.
2. Se decide cual de los dos clusters debe mergearse.
3. Por cada miembro del clusters debo:
   1. Pausar su operación.
   2. Cerrar la conexion al cluster anterior.
   3. Unir al cluster actual.
   4. Mergear los valores de los mapas del cual es dueño.
   5. Reiniciar su operación.

