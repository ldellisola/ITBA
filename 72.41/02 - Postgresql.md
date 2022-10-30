# Postgresql

Postgresql es una base de datos relacional que cumple con ACID. La información esta almacenada de forma bidimensional (columnas y filas) en tablas. 

Las tablas definen un esquema, que puede presentar restricciones sobre el tipo de dato a almacenar. Ademas, estas tablas se puede relacionar entre si con el uso de claves primarias y claves externas.

## Indices

Para optimizar la velocidad de búsqueda en las bases de datos relacionales, se utilizan **indices**. Un indice es una estructura especial que permite realizar una query sin leer las tablas involucradas. El indice funciona de dos formas:

- Si se realiza una búsqueda especifica, el indice genera hashes para podes buscar de forma rápida.
- Si se quiere realizar una comparación (mayor/menor que), el indice tiene que ser más flexible. Por esto se implementa un B-tree.

## Funciones de Ventana

Las funciones de ventana cumplen una función similar a las operaciones de `group-by` pero con una diferencia muy importante: puede agregar utilizando todos los campos, no solo los de `group-by`.

Esto funciona ya la función de ventana devuelve todos los registros en vez de juntarlos como lo hace `group-by`.

## Transacciones

Las transacciones son la base de la consistencia en las bases de datos relacionales. Estas nos garantizan que todas las operaciones indicadas se van a ejecutar de forma satisfactoria, y si hay un error revierten todos los cambios. Las transacciones de Postgres son cumplen con los requisitos de ACID.

## Stored Procedures

Los stored procedures nos permiten agregar lógica de validación u otros cambios dentro de nuestra base de datos, en vez del cliente. 

## Triggers

Los triggers son acciones que se ejecutan cuando sucede algún evento, como un `insert` o un `update`. Cuando sucede esto, se ejecuta un stored procedure que nos permite realizar acciones sobre los datos del evento, como validar datos o realizar logs.

## Views

Las vistas nos permiten acceder a queries complejas de una forma simple. A diferencia de los stored procedures, estos no son funciones sino queries guardadas. Por si solas no ofrecen ninguna ventaja frente a `select`, pero si utilizamos materialized views, podemos guardar las como tablas en la base de datos.



