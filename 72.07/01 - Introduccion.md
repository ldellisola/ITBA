# Introduccion

Una red de computadoras es un conjunto interconectado de hosts, donde cada host es un equipo autónomo. Los hosts no necesariamente tienen que ser computadoras.

Los hosts necesitan mandar distintos tipos de información, mediante distintos protocolos. Para hacerlo siempre divide a la aplicación en partes llamadas **paquetes**. Estos paquetes deben tener como mínimo una dirección a la cual se envía.

La **demora de transmisión** se define como:
$$
\frac{\text{bits enviados }L}{\text{Tasa de transmision del link R}}
$$
Esta demora de transmisión solo se calcula hasta que llegue al ISP, no hasta que llegue al destino final. 

<img src="Resources/01 - Introduccion/Screen Shot 2022-03-04 at 16.24.08.png" alt="Screen Shot 2022-03-04 at 16.24.08" style="zoom:50%;" />

Si la tasa del link de entrada es superior a la tasa de transición del link de salir, se deben encolar los paquetes, esperando a ser enviados, o deben ser descartados. En este ultimo caso la computadora debe reenviar el paquete.

<img src="Resources/01 - Introduccion/Screen Shot 2022-03-04 at 16.23.22.png" alt="Screen Shot 2022-03-04 at 16.23.22" style="zoom:50%;" />

## Red en Capas

A principios de los 80, el mismo fabricante se encargaba de crear todos los elementos de conexion y sus protocolos. La consecuencia de esto es que los sistemas no eran compatibles entre si. Con el nacimiento de la internet, hubo una necesidad de estandarizar estos sistemas y se lo definió con un sistema de capas. Según el modelo OSI, estas son las capas actuales:

<img src="Resources/01 - Introduccion/Screen Shot 2022-03-04 at 16.27.46.png" alt="Screen Shot 2022-03-04 at 16.27.46" style="zoom:50%;" />

## Protocolos

Los protocolos son un sistema formal de reglas de comunicación. Se pueden clasificar según el servicio que ofrecen a su nivel superior:

- **Orientado a conexión**: El cliente que recibe el mensaje debe confirmar que lo tiene.
- **No orientado a conexión**: No hace falta esperar a una confirmación.

También puede ser:

- **Confiable**: Te avisa si llego o no llego el mensaje
- **No Confiable**: No avisa si el mensaje llega o no llega.

## Modelo TCP/IP

Es el modelo de red que utiliza la internet:

<img src="Resources/01 - Introduccion/Screen Shot 2022-03-04 at 16.45.31.png" alt="Screen Shot 2022-03-04 at 16.45.31" style="zoom:50%;" />

### Encapsulamiento de paquetes

Cada capa de la red agrega elementos a los paquetes para poder enviarlos por internet, ya que no hay una capa de sesiónelos

<img src="Resources/01 - Introduccion/Screen Shot 2022-03-04 at 16.47.32.png" alt="Screen Shot 2022-03-04 at 16.47.32" style="zoom:50%;" />

## Topologia de Red

### Topologia de Bus

<img src="Resources/01 - Introduccion/Screen Shot 2022-03-04 at 16.52.20.png" alt="Screen Shot 2022-03-04 at 16.52.20" style="zoom:50%;" />

En las redes con esta topología, todos los hosts en la misma liana se conectan a un hub. Cada host puede ver los que se esta transmitiendo y tiene una gran probabilidad de colisiones. Si la red crece, se divide en segmentos.

Los paquetes se envían a todas las computadoras con una direccion indicando a que computadora se debería enviar. Cada host debe leer esta dirección y decidir si lo acepta o no.C

### Topologia de Estrella

<img src="Resources/01 - Introduccion/Screen Shot 2022-03-04 at 16.54.50.png" alt="Screen Shot 2022-03-04 at 16.54.50" style="zoom:50%;" />

En esta topología, cada host se conecta entre sí con un **switch**. El switch puede leer host de origen y de destino de los paquetes, entonces sabe a que host debe enviar cada paquete y el resto de los hosts no tienen acceso. 

Los switches permiten también enviar varios paquetes en simultaneo.

## Interconexión de redes

<img src="Resources/01 - Introduccion/Screen Shot 2022-03-04 at 17.07.16.png" alt="Screen Shot 2022-03-04 at 17.07.16" style="zoom:50%;" />

Los **routers** se usan para conectar distintas redes. Estos toman decisiones en base a la dirección de red, y no a las direcciones MAC de las computadoras. Es el backbone de la internet, estableciendo rutas entre hosts y regulando el trafico.
