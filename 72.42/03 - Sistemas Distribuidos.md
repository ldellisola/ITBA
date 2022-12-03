# Sistemas Distribuidos

Lo que buscamos con distribuir es conseguir más potencial para el sistema. Tenemos 4 recursos:

- CPU
- Almacenamiento
- Red
- Memoria

Se llama **DEF** a la colección de computadoras autonomas que están conectadas entre si por una red.

Cuando se llama a un objeto remoto existe una chance de que el mismo no se ejecute. Existen varias formas de reaccionar frente a esto:

- **Maybe**: El cliente envia el mensaje y se despreocupa se le llego al server o no.
- **At least once**: El cliente envía el mensaje y espera a que el servidor le responda verificando que el mensaje se envió. Si pasa un tiempo determinado sin recibir la confirmación, lo reintenta.
- **At most once**: El servidor se encarga de verificar que el mensaje una vez ejecutado no se vuelva a ejecutar, pero no hay garantias de que el mensaje llegue.
- **Exactly once**: Tanto el cliente como el servidor colaboran para que el mensaje sea ejecutado solamente una vez.

## RM-ODP

Es una norma creada por ISO. Esta indica que:

- Hay que modelar asl sistema con objetos.
- Especificar a partor de ViewPoints separados.
- Tienen que haber transparencias.
- Tiene que haber un framework para medir confirmidad.

Estos no son obligatorios.

### ViewPoints

Son formas de describir al sistema a partir de distintas perspectivas:

- **Enterprise ViewPoint**: Indica cual es la necesidad.
- **Infomation ViewPoint**: Que información va a tener el sistema.
- **Computational ViewPoint**: Que componentes voy a tener a la hora de resolver la semántica.
- **Technology ViewPoint**: Que lenguajes o frameworks se van a usar.
- **Engineering ViewPoint**: La forma de hacer el deployment.

### Transparencias

Que no parezca que el sistema es remoto. Para lograrlo hay que cumplir con los siguientes puntos:

- **Acceso**: Esconder el hecho de que se esta conectando de manera remota.
- **Ubicación**: Comunicarse con el sistema sin saber donde esta deployado.
- **Migración**: Mover el deployment sin que el sistema se vea afectado.
- **Reubicación**: Mover los componentes sin afectar al cliente.
- **Fallas**: Evitar o ocultar fallas remotas.
- **Replicación**: Puedo tener varios componentes del sistema como si fuera uno.
- **Persistencia**: Agregar o quitar elementos del sistema sin afectar al mismo.
- **Transacción**: Ocultar que sean varios los objetos que trabajan juntos para resolver una acción.

## Servicios

### RPC

El modelo RPC busca que nosotros hagamos llamadas a funciones remotas pero que parezcan locales. Hay que hacer una transformación de las llamadas locales a las remotas.

**RMI** es una implementación de RPC en Java que nos permite:

- Localizar objetos remotos.
- Autogenerar las clases de middleware.
- Enviar objetos via parametros.
- La memoria se limpia con el garbage collector.

Tiene los siguientes componentes:

- **Interfaz Remota**: Es una interfaz que declara un conjunto de métodos que un cliente puede invocar de forma remota. Tanto el cliente como el servidor deben tener a esta clase. Esta interfaz debe cumplir con:
  - Debe ser publica y extender a la interfaz `Remote`. 
  - Todos los métodos deben lanzar la excepcion `RemoteException`.
  - Todos los parametros y valores de retorno deben ser serializables.
- **Servant**: Es el objeto encargado de realizar las operaciones del servicio y reside en el servidor. Debe cumplir con:
  - Implementar una interfaz remota.
  - Ser exportado para escuchar pedidos remotos.
  - Ser thread safe.
- **Referencia a un Servant**: Es el objeto que tiene el cliente para realizar las llamadas al servidor.

En Java todo esto se implementa como un **stub**, es decir un proxy al objeto remoto. El **skeleton** se crea en el servidor y se encarga de recibir el pedido del cliente, interpretarlo y llamar al objeto remoto con los mismos parametros.

### REST

REST es una interfaz demota de servicios basada en recursos sobre HTTP por la cual se ueden enviar y recibir datos multimedia y texto con distintos formatos. Tiene las siguientes caracteristicas:

- Es stateless
- Hace referencia a la sesion.
- Siempre se deben cachear las respuestas.
- Esconde la implementación en capas.

### gRPC

Es un sistema de comunicacion RPC multiplataforma de alto rendimiento. La interfaz de da por `protocol buffers`. 

Estos archivos definen los mensajes (parametros) y servicios. Hay 4 tipos de servicios:

1. **Unario**: El cliente hace el pedido y recibe una respuesta del servidor.
2. **Server Stream**: El servidor envia una secuencia de valores como respuesta.
3. **Client Stream**: El cliente envia una secuencia de valores como parametros que van a ser procesados por el servidor.
4. **Bidirectional Stream**: Tanto el cliente como el servidor pueden mandar y recibir una secuencia de argumentos.

### SOAP

SOAP es un protocolo de comunicacion mediante XML. Tiene 3 caracteristicas principales:

- **Extensibilidad**: El protocolo puede extenderse para servicios complejos.
- **Neutralidad**: Utiliza TCP como transporte y se pueden usar los siguientes protocolos de aplicación: HTTP, SMTP, JMS.
- **Independencia**: Es multiplataforma.

Los mensajes SOAP tienen:

- **Envelope**: un elemento que lo engloba.
- **Header**
- **Body**
- **Fault**: indica si se produjo un error.

## Garbage Collection

En los sistemas distribuidos tenemos un **Distributed Garbage Collector** que se encarga del conteo de referencias para saber cuando puede liberar memoria. Este algoritmo coordina con los garbage collectors locales para lograr su objetivo. Es un algoritmo complicado de mantener y que consume muchos recursos.

**Leasing** es otro algoritmo basado en el conteo de referencias pero ademas agrega un *time-to-live* que los clientes deben renovar para no perder sus referencias del lease.

## Bases de Datos

### RDBMS

Las bases de datos relacionales cumplen con ACID:

- **Atomicidad**: Indica que la transaccion se completa o no se realiza.
- **Consistencia**: La información escrita es valida de acuerdo a las restricciones definidas.
- **Aislamiento**: Ninguna transaccion sera afectada por otras transacciones que se realicen de manera concurrente.
- **Durabilidad**: Indica que una vez que se escribio la información, la misma es permanente y las proximas lecturas retornaran el nuevo valor.

Estas bases de datos tienen algunos problemas:

- No escalan bien.
- Necesitan una estructura definida.

### CDN

Es lo opuesto a tener una sola base de datos. Permite obtener contenido estático de forma eficiente y con cache.

### Data WareHouse (BI)

Falopa 4.0

#### OLAP

Es un set de datos con muchos puntos de vista. Nos permite agregar resultados y hacer cualquier otra cosa.

#### Big Data

Hay una definición de 3 V:

- **Volumen**
- **Variedad** de las estructuras de los datos.
- **Velocidad** con la que se generan los datos

Por definición trabajar con Big Data excede las capacidades de una sola computadora. Se requiren implementar nuevas estrategias para resolver los problemas que presenta:

- **Adquisición**: tenemos que soportar tanto el volumen como la velocidad, dando soporte a la variedad de fiuentes.
- **Procesamiento**: Realizar el procesamiento dentro de un tiempo que sea útil para la organización.
- **Guardado**: Se deben utilizar estrategias de guardado acordes a los datos y necesidades de respuesta.
- **Vista**: tener formas de mostrar la información que sea util para los usuarios del sistema.

## Escalamiento

Se dice que se **escala verticalmente** cuando le estoy dando más recursos a una maquina para que cope con más trabajos. Por el contrario, **escalar horizontalmente** implica agregar maquinas a la red para realizar más trabajos.

## Almacenamiento

Existen distintas formas de almacenar información en un sistema distribuido.

### Sharding

Se puede repartir la información en distintos nodos siguiendo alguna logica en particular. Hacer sharding nos permite escribir y leer más rápido. El problema esta en la configuracion de las particiones, ya que pueden quedar ciertos nodos con gran parte de los datos.

### Replicación 

La replicación permite tener una copia de nuestros datos en otro servidor por si el primero se cae. El problema de la replicación es la consistencia. Al escribir nueva información, hay que decidir:

- Escribo todo a una sola replica.
- Escribo a todas las replicas.
- Escribo a algunas replicas.

Dependiendo del caso, vamos a tener que tomar una decision.

Se dice que hay dos factores que indican la preferencia de la consistencia:

- **Consistencia en Escritura**: Indica cuantas copias tienen que reportar que la escritura fue hecha antes de que se le indique al cliente que la escritura esta terminada.
- **Consistencia en Lectura**: Indica cuantas particiones tienen que reportar el mismo valor antes de responder ese valor como cierto en una lectura.

Hay dos modelos de consistencia:

- **Consistencia Estricta**: Es el modelo ideal, donde toda escritura esta inmediatamente disponible para la lectura de todos y respeta el orden de cada operación de manera global.
- **Consistencia Eventual**: Indica que luego de realizarse una escritura , y de no mediar nueva escrituras, pasado cierto tiempo todas las lecturas reflejaran el valor escrito.

### Elasticidad

La elasticidad es la capacidad de un cluster de modificar la cantidad de nodos que lo componen y que estos puedan participar de la operación del mismo sin que el cluster quede offline completamente.

## Tolerancia a Fallos

Si algun nodo se cae, las particiones y replicas del mismo deben ser reasigandas. Esto requiere coordinación y hay varias estrategias para que esto sea posible. En general hay un nodo coordinador con cierta redundancia.

