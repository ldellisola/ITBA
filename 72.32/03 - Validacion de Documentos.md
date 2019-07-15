# Validacion de Documentos 

El **modelo de datos** es una forma de estructurar la informacion. Un **esquema** para un modelo de datos es una estructura particular. Una **instancia** de un esquema son los datos compatibles con ese esquema. 

## Comparacion con una Base de Datos Relacional

En las bases de datos relacionales, el **modelo** es relacional, el **esquema** son las tablas con sus campos y las **instancias** son los valores concretos de las filas de las tablas.

En los documentos XML, el **modelo** es jerarquico, el **esquema** es una jerarquia en particular y la **instancia** son los valores concretos para esa jerarquia.

Otra diferencia importante es que para las bases de datos es imposible tener instancias sin tener un esquema predefinido, pero en el caso de los documentos XML, el esquema es totalmente opcional, por lo que se denomina a los documentos XML como **semi-estructurados**.

## Validacion

Si se pretende que un documento sea valido, se debera proveer un esquema conformado por distintas reglas (jerarquia) y su vocabulario (tags).

Esta validacion se puede hacer de dos formas distintas:

- [DTD](04 - DTD.html)
- [XML Scheme](05 - XSD.html)

