# HBase

HBase es una base de datos orientada a columnas que ofrece tanto consistencia como la habilidad de escalar masivamente.

Aunque es parecida a una base de datos relacional, no lo es. La información se almacena en buckets llamados *tablas*, que estas a su vez contienen celdas que aparecen en la intersección de filas y columnas.

El problema es que, aunque se parece a una base de datos relacional, las tablas no tienen relaciones, las filas no funcionan como entradas de una tabla y las columnas son variables sin forzar ningún esquema.

Otra diferencia es que esta base de datos esta diseñada para escalar hacia arriba y no puede escalar hacia abajo.

Los motivos para usar HBase son:

- Tiene funciones más funciones que otras bases de datos, como versionado, compresión y garbage collection, ademas de tablas en memoria.
- Tiene fuerte garantias de consistencia.
- Garantiza operaciones atómicas a nivel de las filas.

También es importante remarcar que HBase no soporta:

- Indexing
- Sorting
- Tipos de Datos