# Capa de Enlace

Esta capa encapsula los datagramas y se encarga de hacer una transferencia confiable de los mismos entre dos nodos adyacentes. Cada interface tiene su numero MAC unido, otorgado por IEEE.

Esta capa ofrece:

- **Control de Flujo**: Ajusta la velocidad del enlace al eslabón más lento.
- **Detección de Errores**
- **Corrección de Errores**
- **Half-duplex o Full-duplex**: Ambos puntos pueden emitir y recibir. Half-duplex implica que si uno esta emitiendo, el otro no puede emitir. En full-duplex esta limitación no existe.

Hay dos tipos de comunicaciones a nivel de enlace:

<img src="Resources/11 - Capa de Enlace/Screen Shot 2022-04-29 at 16.09.49.jpg" alt="Screen Shot 2022-04-29 at 16.09.49" style="zoom:50%;" />

## Redes

### Punto a Punto

Estos protocolos son mas simples que los enlaces broadcast. Generalmente son usados para encapsular datagramas IP y no necesitan control de acceso al medio. Dentro de estos protocolos encontramos a:

- **SLIP**: Es un protocolo muy simple utilizado para encapsular datagramas IP sobre lineas seriales.
- **PPP**: Es el sucesor de SLIP. Este protocolo soporta el encapsulamiento de varios protocolos, ademas de ofreces detección de errores, autenticación, notificación de direcciones, negociación de opciones y mediación de calidad de enlace.

### Broadcast

En estas redes se utiliza un canal compartido donde existe la posibilidad de interferencia, ademas de colisiones de paquetes. Por este motivo debe haber establecido una norma para coordinar el intercambio de paquetes en el canal.

Hay 3 clases de protocolos definido para estas redes:

- **Partición de canal**: Divide al canal en partes, utilizando frecuencias o slots de tiempo, y cada cliente tiene uso exclusivo sobre esa parte.
- **Por turnos**
- **Acceso aleatorio**: Los nodos transmiten cuando quieren y si hay colisiones, mala suerte. Los protocolos deben identificar colisiones y reaccionar frente a ellas.

#### Time Division Multiple Access (TDMA)

Este protocolo es de partición del canal. Cada cliente tiene asignado un tamaño fijo de slot por turno donde puede utilizar el canal. Si el cliente no utiliza su slot, este es desperdiciado.

<img src="Resources/11 - Capa de Enlace/Screen Shot 2022-05-17 at 19.09.05.jpg" alt="Screen Shot 2022-05-17 at 19.09.05" style="zoom:50%;" />

#### Polling

Este protocolo se basa en turnos, donde hay un cliente master que controla la conexion del canal. Este nodo master le va preguntando a cada cliente si quiere utilizar el canal y se lo va asignando.

<img src="Resources/11 - Capa de Enlace/Screen Shot 2022-05-17 at 19.10.25.jpg" alt="Screen Shot 2022-05-17 at 19.10.25" style="zoom:50%;" />

Este protocolo no tiene colisiones, pero tiene overhead, alta latencia y un único punto de falla.

#### Token Ring

Es otro protocolo de turnos. En este caso se debe conectar a los clientes en forma de anillo y los datos circulan en un solo sentido. Cada nodo recibe un token que lo habilita a transmitir. Se dice que el anillo es compartido pero solo transmite el que recibió el token durante cierto tiempo. 

<img src="Resources/11 - Capa de Enlace/Screen Shot 2022-05-17 at 19.12.30.jpg" alt="Screen Shot 2022-05-17 at 19.12.30" style="zoom:50%;" />

#### CSMA

En este protocolo, cada cliente sigue los mismos casos a la hora de enviar in paquete:

1. Lee el canal para ver si esta ocupado. De estar libre continua.
2. Transmite todos los paquetes.
3. Lee el canal para ver si hubo colisiones.

![img](Resources/11 - Capa de Enlace/aHbX0IkLVFqaEEnLnP1fVItAepI_JOrfT-1NhkXCllqowXiM-FqaRhHkJ87KZ8oDICB5RNSQQ6kq3vZUZAQb2Im5Y1Us7trei04JYK-tXyrIxrIjkSFtD4XN4MxSd6no1JKuvXUT5IjjwyuEuY0t.png)

#### Ethernet

Es el protocolo mas utilizado en las LANs cableadas y tiene dos topologías principales:

- **Bus**: Todos los hosts están en la misma linea, conectados a un hub. Hay una gran posibilidad de colisiones. si la red crece se divide en segmentos.

  <img src="Resources/11 - Capa de Enlace/Screen Shot 2022-05-17 at 19.20.32.jpg" alt="Screen Shot 2022-05-17 at 19.20.32" style="zoom:50%;" />

- **Estrella**: Cada host se conecta a un switch, que luego reenvía los paquetes al destino que corresponde, evitando las colisiones. Para 









