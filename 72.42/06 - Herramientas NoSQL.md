# Herramientas NoSQL

Las bases de datos NoSQL tienen que cumplir con las siguientes caracteristicas:

- No usan un modelo relacional.
- No usan SQL.
- No fuerzan un esquema.
- Escalan horizontalmente por diseño.

Para elegir la base de datos usamos el teorema CAP:

- **Consistency**: Indica que todos los nodos devuelven el ultimo dato escrito.
- **Availability**: Garantiza que todo request sera respondido inmediatamente.
- **Partition Tolerance**: El sistema sigue funcionando a pesar de que esta particionado y algun nodo falla.

Hay 4 estilos de bases de datos no relacionales:

- **Key-Value**: La clave es un valor arbitrario y el valor puede ser cualquier cosa. No tienen un lenguaje sino que tienen operaciones simples.
- **Columnar**: Esta optimizada para leer columnas de la información y se usan mucho en las queries analiticas. Reducen los accesos de IO y la cantidad de información a utilizar.
- **Document**: Es un key-value store pero donde el value es un documento. Estas bases de datos suelen tener un esquema semi estructurado.
- **Graph**: Permite modelar a las entidades como un grafo y realizar operaciones sobre los mismos.

