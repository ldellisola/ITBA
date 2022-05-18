# Transporte

Esta capa comunica a los procesos de las aplicaciones con la capa de red. Los protocolos de transporte son:

- **TCP**:
  - Control de congestion.
  - Control de flujo.
  - Establecimiento de conexión.
- **UDP**:
  - *best effort*, es decir que no garantiza nada.
- **SCTP**

<img src="Resources/06 - Transporte/Screen Shot 2022-03-25 at 16.17.42.jpg" alt="Screen Shot 2022-03-25 at 16.17.42" style="zoom:50%;" />

Esta capa provee la comunicación lógica entre 2 procesos que corren en distintos hosts. Ejecutan en las *puntas finales*, el que envía los datos tienen que separar al mensaje en segmentos y los envía a nivel de red, luego el que los recibe los tiene que reensamblar y enviarlo a la capa de aplicación.

## Multiplexación

Cuando un host recibe los datagramas IP, tiene que procesarlos para saber a que proceso los tiene que entregar. De cada catagrama obtiene un IP de destino y de origen, ademas del protocolo de transporte y el puerto de origen y destino. Cada host utiliza estos valores para asignarlos al socket adecuado.

<img src="Resources/06 - Transporte/Screen Shot 2022-03-25 at 16.42.26.jpg" alt="Screen Shot 2022-03-25 at 16.42.26" style="zoom:50%;" />

Los siguientes puertos están reservados:

<img src="Resources/06 - Transporte/Screen Shot 2022-03-25 at 16.35.43.jpg" alt="Screen Shot 2022-03-25 at 16.35.43" style="zoom:50%;" />

Cuando usamos UDP es mucho mas simple este proceso. Al llegar un datagrama, no hace falta establecer una conexión, por lo que puede simplemente pasarle el catagrama al socket. Ademas, aunque los datagramas que lleguen tengan distinto IP de origen, serán atendidos por el mismo socket.

<img src="Resources/06 - Transporte/Screen Shot 2022-03-25 at 16.42.04.jpg" alt="Screen Shot 2022-03-25 at 16.42.04" style="zoom:50%;" />

### Datagrams UDP

Formato de un datagrama UPD:

<img src="Resources/06 - Transporte/Screen Shot 2022-03-25 at 16.44.53.jpg" alt="Screen Shot 2022-03-25 at 16.44.53" style="zoom:50%;" />

Este servicio transporta datos de manera no confiable entre hosts. Entre sus propiedades están:

- No es orientado a conexión.
- No es confiable.
- No ofrece verificación de software para la entrega de segmentos.
- No reensambla los mensajes entrantes.
- No utiliza ACK.
- No proporciona control de flujo.

### Datagramas TCP

Cuando se usa TCP, cada socket esta identificado por:

- IP de origen
- Puerto de origen
- IP de destino
- Puerto de destino

<img src="Resources/06 - Transporte/Screen Shot 2022-03-25 at 16.54.46.jpg" alt="Screen Shot 2022-03-25 at 16.54.46" style="zoom:50%;" />

TCP ofrece un circuito virtual entre aplicaciones de usuarios finales con las siguientes características:

- Es orientado a conexión.
- Es confiable.
- Divide a los mensajes salientes en segmentos, y los reensambla en el host de destino.
- Vuelve a enviar los datos no recibidos.
- Control de flujo
- Control de congestion.

## Transferencias

### Transferencia de Datos Confiables

Si el protocolo de red es confiable, entonces:

- No se alteran bits
- No se pierden paquetes
- Los paquetes llegan en orden

Esta lógica es muy simple de implementar, pero es muy complicado estar utilizando un medio de protocolo confiable.

### Transferencia con Posibles Errores

Los protocolos de red pueden alterar algunos bits. Para detectar esto podemos agregar un hash del mensaje llamado CRC, y en caso de que sucedan, podemos usar los mensajes de ACK y NAK ante la falta o error del mensaje.

Otro metodo utilizado para solucionar esto es **stop and wait**:

<img src="Resources/06 - Transporte/Screen Shot 2022-03-25 at 17.10.55.jpg" alt="Screen Shot 2022-03-25 at 17.10.55" style="zoom:50%;" />

Este metodo es mas seguro, pero muy lento.

También puedo usar **pipelining**:

<img src="Resources/06 - Transporte/Screen Shot 2022-03-25 at 17.11.49.jpg" alt="Screen Shot 2022-03-25 at 17.11.49" style="zoom:50%;" />

La complejidad de esta implementación es bastante mayor, pero es mas optimo.

## Control de Congestión 

Cuando hay muchas fuentes enviando muchos datos a alta velocidad, la capa de red no lo puede manejar. Este concepto es distinto del control de flujo y la capa de IP no se hace cargo. Los problemas de congestión de manifiestan con:

- Perdida de paquetes.
- Demoras.

TCP soluciona esto implementado **AIMD (Additive Increase Multiplicative Decrease)**. Esto se basa en incrementar el tamaño de ventana en relación al MSS (Maximum segmentos size) indicado por cada RTT (Round Trip Time) hasta que detecte perdidas. Una vez que detecta perdidas, redice el tamaño de ventana a la mitad.

<img src="Resources/06 - Transporte/Screen Shot 2022-05-13 at 11.41.17.jpg" alt="Screen Shot 2022-05-13 at 11.41.17" style="zoom:50%;" />

## NAT

NAT o Network Address Translation es un protocolo que permite que haya solo una IP publica por red, pero que todas las computadoras conectadas a esa red puedan acceder y ser accedidas a través del internet.

La **table NAT** es una lista que mantiene el firewall para la red. En esta tabla se indica que conexiones exteriores pueden entrar a la red:

<img src="Resources/06 - Transporte/Screen Shot 2022-05-13 at 11.43.40.jpg" alt="Screen Shot 2022-05-13 at 11.43.40" style="zoom:50%;" />

Hay dos tipos de NAT:

- **DNAT**: Conocida como Destination NAT, se utiliza para permitir que conexiones exteriores entren por un puerto especifico a la red y sean redirigiros a una o mas computadoras en la red. Ademas, a la hora de redireccionar un paquete a la una maquina en la red, también modifica el header de destino en los paquetes. 

  <img src="Resources/06 - Transporte/Screen Shot 2022-05-13 at 12.07.30.jpg" alt="Screen Shot 2022-05-13 at 12.07.30" style="zoom:50%;" />

- **SNAT**: Es el mismo concepto anterior, pero en vez de permitir a una conexión entrante, se permite a una conexión saliente. En este caso no se modifica ningún header.

  <img src="Resources/06 - Transporte/Screen Shot 2022-05-13 at 12.09.28.jpg" alt="Screen Shot 2022-05-13 at 12.09.28" style="zoom:50%;" />

## Firewalls

Un firewall opera en el nivel más bajo de red, evita accesos no autorizados a la intranet y permite definir qué trafico entra y sale de la red.

<img src="Resources/06 - Transporte/Screen Shot 2022-05-13 at 12.15.18.jpg" alt="Screen Shot 2022-05-13 at 12.15.18" style="zoom:50%;" />

### Packet Filter

Este metodo analiza el trafico de la red a nivel de transporte, donde cada paquete es evaluado para ver si satisface una serie de reglas. Estas reglas pueden ser basadas en:

- La interface a la cual llegan.
- La IP de origen o destino.
- El protocolo.
- El puerto de origen o destino.

<img src="Resources/06 - Transporte/Screen Shot 2022-05-13 at 12.19.24.jpg" alt="Screen Shot 2022-05-13 at 12.19.24" style="zoom:50%;" />

### Circuit Level

Este método sirve para validar si un paquete pertenece a una sesión valida.

<img src="Resources/06 - Transporte/Screen Shot 2022-05-13 at 12.21.46.jpg" alt="Screen Shot 2022-05-13 at 12.21.46" style="zoom:50%;" />

Una vez establecida una sesión, se suele almacenar:

- El identificador de la conexión.
- Estado de la conexión: handshake, established, closing.
- Numero de secuencia.
- IP de origen y destino.
- Interfaz de red por la que entran los paquetes.
- Interfaz de red por la que salen los paquetes.

### Application Layer

<img src="Resources/06 - Transporte/Screen Shot 2022-05-13 at 12.33.57.jpg" alt="Screen Shot 2022-05-13 at 12.33.57" style="zoom:50%;" />

### Dynamic Packet Filter

Es similar al filtrado de paquetes anterior pero pero permite modificar las reglas dinámicamente.

<img src="Resources/06 - Transporte/Screen Shot 2022-05-13 at 12.35.14.jpg" alt="Screen Shot 2022-05-13 at 12.35.14" style="zoom:50%;" />