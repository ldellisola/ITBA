# Transporte

Esta capa comunica a los procesos de las aplicaciones con la capa de red. Los protocolos de transporte son:

- TCP:
  - Ofrece
    - Control de congestion.
    - Control de flujo.
    - Establecimiento de conexión.
- UDP:
  - Ofrece:
    - *best effort*, es decir que no garantiza nada.
- SCTP

<img src="Resources/06 - Transporte/Screen Shot 2022-03-25 at 16.17.42.jpg" alt="Screen Shot 2022-03-25 at 16.17.42" style="zoom:50%;" />

Esta capa provee la comunicación lógica entre 2 procesos que corren en distintos hosts. Ejecutan en las *puntas finales*. El que envía los datos tienen que separar al mensaje en segmentos y los envía a nivel de red, luego el que los recibe los tiene que reensamblar y enviarlo a la capa de aplicación.

### Multiplexación 

Cuando un host recibe los datagramas IP, tiene que procesarlos para saber a que proceso los tiene que entregar. De cada catagrama obtiene un IP de destino y de origen, ademas del protocolo de transporte y el puerto de origen y destino. Cada host utiliza estos valores para asignarlos al socket adecuado.

<img src="Resources/06 - Transporte/Screen Shot 2022-03-25 at 16.42.26.jpg" alt="Screen Shot 2022-03-25 at 16.42.26" style="zoom:50%;" />

Los siguientes puertos están reservados:

<img src="Resources/06 - Transporte/Screen Shot 2022-03-25 at 16.35.43.jpg" alt="Screen Shot 2022-03-25 at 16.35.43" style="zoom:50%;" />

Cuando usamos UDP es mucho mas simple este proceso. Al llegar un datagrama, no hace falta establecer una conexión, por lo que puede simplemente pasarle el catagrama al socket. Ademas, aunque los datagramas que lleguen tengan distinto IP de origen, serán atendidos por el mismo socket.

<img src="Resources/06 - Transporte/Screen Shot 2022-03-25 at 16.42.04.jpg" alt="Screen Shot 2022-03-25 at 16.42.04" style="zoom:50%;" />

### UDP

Formato de un datagrama UPD:

<img src="Resources/06 - Transporte/Screen Shot 2022-03-25 at 16.44.53.jpg" alt="Screen Shot 2022-03-25 at 16.44.53" style="zoom:50%;" />

Este servicio transporta datos de manera no confiable entre hosts. Entre sus propiedades están:

- No es orientado a conexión.
- No es confiable.
- No ofrece verificación de software para la entrega de segmentos.
- No reensambla los mensajes entrantes.
- No utiliza ACK.
- No proporciona control de flujo.

### TCP

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