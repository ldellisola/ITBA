# Transporte

## 1

> Cuando envía por correo una carta simple, asumiendo que fue recibida por el destinatario. ¿Esto es análogo a TCP o UDP? 

Es analogo a UDP. No tenemos una confirmación de que la carta haya sido recibida.

## 2

> ¿Cuál es el protocolo de transporte que intercambia datagramas sin acuses de recibo ni envío garantizado? 

UDP

## 3

> ¿Qué utilizan TCP, SCTP y UDP para mantener un registro de las distintas conversaciones que atraviesan la red al mismo tiempo?

Utilizan los puertos de entrada y salida, ademas de las IPs.

## 4

> En una comunicación TCP, ¿qué sucede si de un segmento enviado no se recibe el ACK en un tiempo determinado? 
>
> 1. Se cierra la conexión 
> 2. Nada 
> 3. Se retransmite el paquete 
> 4. Depende de la aplicación 
> 5. Se envía un mensaje de error al otro host

Se retransmite el paquete.

## 5

> ¿Cuál de las siguientes afirmaciones describe mejor a UDP? 
>
> 1. Un protocolo que envía acuses de recibo únicamente por datagramas defectuosos 
> 2. Un protocolo que no ofrece seguridad para los datos 
> 3. Un protocolo que intercambia datagramas sin acuse de recibo ni garantía de entrega 
> 4. Un protocolo que detecta errores de transmisión y solicita retransmisión de ser necesario

Un protocolo que intercambia datagramas sin acuse de recibo ni garantía de entrega 

## 6

> Completar el siguiente cuadro para los protocolos TCP, SCTP y UDP, marcando con una X los servicios que brinda el protocolo

1. 

|                                                    | SCTP | TCP  | UDP  |
| -------------------------------------------------- | :--: | :--: | :--: |
| Establecer conexión                                |  X   |  X   |      |
| Garantía de mínimo delay                           |      |      |      |
| Transferencia de mensajes de tamaño arbitrario     |  X   |  X   |      |
| División de mensajes largos en distintos segmentos |  X   |  X   |      |
| Retransmisión de segmentos                         |  X   |  X   |      |
| Checksum de segmentos                              |  X   |  X   |  X   |
| Integridad de datos                                |      |      |      |
| Autenticación de los hosts                         |      |      |      |
| Almacenamiento de segmentos hasta recibir ACK      |  X   |  X   |      |
| Envío de NAK ( Negative Acknowledege)              |      |      |      |
| Control de flujo                                   |  X   |  X   |      |
| Múltiples IPs para una misma conexión              |  X   |      |      |

## 7

> Suponga que un proceso en el host C tiene un socket UDP con puerto 6789. Los hosts A y B envían  un segmento UDP a C con puerto destino 6789. 
> 1. ¿Ambos segmentos serán dirigidos al mismo socket en C? 

Si

> 2. Si es así, ¿cómo sabrá el proceso en C que estos segmentos fueron originados por hosts    distintos? 

Los puede diferenciar por la IP y puerto de origen.

## 8

> Suponga que un web server escucha en el host C en el puerto 80. Este servidor utiliza conexiones persistentes y recibe requests desde los hosts A y B.  
>
> 1. ¿Todos los *requests* son enviados al mismo socket en C? 

Todas las requests se envied al mismo socket pasivo. Luego de hacer el handshake TCP, se redirige a esos request a un socket activo, definido por el trio puerto de origen, IP y puerto de destino.

> 1. Si son enviados a sockets distintos, ¿usan ambos 80 como puerto destino?

Si.

## 9

> ¿Para qué se utilizan números de secuencia en un protocolo confiable? 

Se utilizan por dos motivos:

- Ordenar a los paquetes luego de que fueron recibidos.
- Devolver un ACK por cada paquete que se recibió. Estos paquetes son identificados con el numero de secuencia.

## 10

> ¿Para qué se utilizan timers en un protocolo confiable? 

Si no se envia un ACK luego de un tiempo determinado, podemos decir que el cliente no esta conectado y no le están llegando los mensajes y podemos dejar de intentar de comunicarnos.

## 11

> Suponga que el host A envia dos segmentos al host B sobre una conexión TCP. El primer segmento  tiene número de secuencia 90; el segundo 110. 
>
> 1. ¿Cuantos bytes de datos hay en el primer segmento? 

Hay 20 bytes de datos?

> 2. Suponga que el primer segmento se pierde, pero el segundo arriba a B. En el ACK que B envía a A, ¿Cuál será el número de ACK?

Seria 90.

> 3. ¿Cuántos bytes de datos hay en el segundo segmento?

No se sabe.

## 12

> El protocolo HTTP 1 puede causar el problema “Head of line Blocking”, ya que al usar una conexión TCP para pedir 3 recursos a un mismo servidor, si se pierde un paquete TCP del primer recurso, el resto no estará disponible para la aplicación hasta que se retransmita el paquete pedido. HTTP 2 soluciona esto permitiendo que la aplicación obtenga los dos siguientes recursos aún si el primero está incompleto. 
>
> Suponiendo que se le pide que desarrolle una aplicación cliente/servidor que intercambie recursos en forma similar a HTTP, explicar cómo haría –en la forma más simple posible- para evitar el “Head of line Blocking”.

Lo que se podría hacer es crear un flujo TCP por cada recurso, en vez de realizar un solo flujo. Esto va a traer el overhead de hacer el handshake 3 veces, pero evita este problema.

## 13

> Una aplicación que utiliza UDP para transporte debe enviar una respuesta que supera sí o sí al máximo permitido por cada datagrama, ¿se puede enviar esa respuesta al cliente? En caso afirmativo explicar cómo se resuelve.

Se deben partir a la información en la cantidad de paquetes que sean necesarios.

## 14

> ¿Cuál es la diferencia entre un socket pasivo y un socket activo?

Los sockets pasivos son solo utilizados para comenzar la comunicación. Luego los paquetes se envían por un socket activo. El cierre de la conexión también se debe hacer con un socket activo.

## 15

> ¿Qué campo o campos del header tiene TCP para poder implementar control de flujo?

Utiliza al campo *window*. Este campo esta compuesto por un numero de 16 bits que indica el tamaño máximo de paquete que puede aceptar el recipiente, medido en bytes.

## 16

> ¿Qué campo o campos del header tiene TCP para poder implementar control de congestión?

No tiene campos especiales para esto. La implementación del control de congestión se basa en información local, como la cantidad de segmentos que se pierden.

































