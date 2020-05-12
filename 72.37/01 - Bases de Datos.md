# Bases de datos

Las bases de datos relacionales son una colección de datos relacionados que cumplen con las siguientes características:

- Representa algún aspecto del mundo real
- Tiene coherencia lógica con algún significado inherente
- Se diseña, construye y se completa con datos para un propósito especifico
- .
- .
- .==FALTA==

Las bases de datos ofrecen **abstracción** sobre los datos que almacena, ocultando donde y como se guardan. Teóricamente las bases de datos no tienen limite de la cantidad de informacion que pueden manejar.

**Como se diferencia de otras formas como una planilla de Excel?**

- Excel no tiene un lenguaje potente de consulta, como lo es en el caso de SQL.
- Excel no tiene concepto de roles y permisos.
- Excel tiene un limite de tamaño por archivo (4Gb)

## Sistema de manejo de base de datos

Son una colección de programas que permiten crear y mantener a una base de datos. Tambien son llamados **motores** de bases de datos. Estos programas permiten hacer dos cosas:

- **Crear** una base de datos, es decir, <u>definir los tipos de datos, estructura y restricciones</u> de los datos que se almacenan.
- **Mantener** a la base de datos, <u>actualizando a sus datos, generando reportes y permitiendo realizar consultas</u> sobre la informacion almacenada.

**Como se diferencia un DMBS de un sistema de procesamiento de archivos?**

- Auto descripción:
- Hay independencia entre los datos y programas
- Ofrece vistas a distintos grupos de usuarios: ofrece permisos y roles a los usuarios.
- Integridad de datos:  Evita que haya datos inválidos.
- Manejo de la concurrencia: Permite que se realicen operaciones al mismo tiempo.
- Procesamiento transaccional: Cada operación es una unidad ínfima e inseparable.

Los últimos dos puntos son los que producen mayor diferencia con respecto al sistema de procesamiento de archivos.

## Modelos de Datos

El modelo es un conjunto de conceptos que se utilizan para describir la estructura  de una base de datos.

Los modelos de datos ofrecen un conjunto de operaciones básicas para el recupero y actualización de la base de datos, e inclusive algunas permiten especificar el comportamiento o sea operaciones definidas por el usuario.

### Categorias de modelos

Las categorias se hacen por el nivel de abstraccion de los datos: Es el modelo para interactuar con el cliente, es simple y no esta en una base de datos real.

- Conceptual, alto nivel o semantico:
  - Basado en entidades: Hay
  - Basados en objetos
- De representacion o implementacion: Este nivel comienza con la implementacion de las tablas en la base de datos. Ya se puede consultar mediante querys SQL.
  - Modelo de Red
  - Modelo jerarquico
  - Modelo relacional: Es el modelo actual.
- Fisico, de bajo niveo o interno: Este modelo busca optimizar a todos los procesos.

A las bases de datos se las puede dividir en dos partes:

- **Descripcion**: Son las reglas y el esquema de la base de datos
- **Datos**: Son los datos almacenados propiamente.

## ANSI

ANSI especifica que la estrucutra de las bases de datos tienen que tener los siguentes niveles:

- Nivel interno: Posee un esquema interno que describe la estrucura del almacenamiento fisico
- Nivel Conveptual: Posee un esquema 
- Nivel 3>???

Estos tres esquemas son descripciones de los datos, donde los datos solo estan almacenados en el nivel fisico. Los sistemas de manejo de bases de datos deben realizar un mapeo entre los niveles segun corresponda.

