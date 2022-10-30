# Transacciones

## ADC

Ideado por Jim Gray, es un concepto de transaccional que surge con las siguientes propiedades:

- **Atomicity**: La acción sucede o no.
- **Durability**: Una vez que una transacción se efectúa, no se puede revertir.

- **Consistency**: La transacción debe cumplir con los protocolos legales.

## ACID

Estas 4 propiedades definen las características del paradigma transaccional:

- **Atomicity**: La acción sucede o no.
- **Consistency**: La transacción debe cumplir con los protocolos legales.
- **Isolation**: Las transacciones se pueden ejecutar de forma concurrente.
- **Durability**: Una vez que una transacción se efectúa, no se puede revertir.

## CAP

El teorema CAP, también llamado *conjetura de Brewer*, enuncia que es imposible para un sistema de computo distribuido garantizar simultáneamente:

- **Consistency**: Que todos los nodos vean la misma información al mismo tiempo.
- **Availability**: Garantizar que cada petición a un nodo reciba una confirmación de si ha sido o no resulta satisfactoriamente.
- **Partition Tolerance**: El sistema sigue funcionando incluso si algunos nodos fallan.

<img src="Resources/01 - Transacciones/Screen Shot 2022-08-02 at 16.15.34.jpg" alt="Screen Shot 2022-08-02 at 16.15.34" style="zoom: 33%;" />

Podemos clasificar a las siguientes bases de datos:

- **CA**: Redis, Postgresql, Neo4J.
- **CP**: MongoDB, HBase
- **AP**: CouchDb, DynamoDb

Ademas, según la configuración elegida, MongoDB puede ser **CA** y CouchDb puede ser **CP**.

## BASE

Es una alternativa a ACID utilizada para servicios eventualmente consistentes:

- **B**asically **A**valiable: Las operaciones de lectura y escritura básicas están disponibles en todos los nodos, pero sin garantizar consistencia.
- **S**oft State: Sin garantizar consistencia, después de un periodo de tiempo tenemos alguna chance de saber el estado de la información.
- **E**ventual Consistency: Si el sistema esta funcionando y no hay ninguna escritura en un tiempo determinado, la lectura sera consistente.

La consistencia eventual es un modelo de consistencia utilizado en sistemas distribuidos para lograr alta disponibilidad. Garantiza que, si no hay ninguna actualización de la información, eventualmente todos los accesos al la información devolverán la información más al dia.

