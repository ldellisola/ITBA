# HTTP

HTTP surgió como respuesta a la necesidad de comunicarse mediante internet con hipertexto.

En 1991 sale **HTTP 0.9** como un protocolo basado en texto (no usa un sistema binario) de recuperación de información, con un mecanismo *request-response*. El contenido que se envía es estático y no mantiene estado en el servidor. Estaba orientado mas al uso mediante terminales (en vez de navegadores).

<img src="Resources/02 - HTTP/Screen Shot 2022-03-04 at 17.38.12.png" alt="Screen Shot 2022-03-04 at 17.38.12" style="zoom:50%;" />

Con la llegada de **HTTP 1.0** en 1999 se agregaron distintos métodos para interactuar con el servidor como POST y HEAD, y códigos de estado, ademas de permitir enviar otro contenido que no sea hipertexto. Esto permite que sea mas amigable para los navegadores.

<img src="Resources/02 - HTTP/Screen Shot 2022-03-04 at 17.42.20.png" alt="Screen Shot 2022-03-04 at 17.42.20" style="zoom:50%;" />

En **HTTP 1.1** se introdujeron los headers, así como también mas comandos (PUT, DELETE, TRACE y OPTIONS), negociación de contenido, soporte de cache y conexiones persistentes.

<img src="Resources/02 - HTTP/Screen Shot 2022-03-04 at 17.43.27.png" alt="Screen Shot 2022-03-04 at 17.43.27" style="zoom:50%;" />

**HTTP 2.0** es la version actual (aunque no es muy usada) que establece un protocolo binario, compresión de headers, multiplexacion de recursos, server push, etc.

## Recursos

Según HTTP, un recurso es un bloque de información identificado por su **URI**. Puede ser un archivo físico o generado por un programa.

### URL

Una URL (Uniform Resource Locator) se refiere a una recurso por su ubicación.

### URN

Una URN (Uniform Resource Name) se refiere a un recurso por su nombre.

## Mensajes HTTP

El cliente y el servidor intercambian mensajes HTTP de modo *request-response*:

Una **request** tiene un metodo (GET, HEAD, POST, PUT, TRACE, OPTIONS, DELETE), mientras que las **responses** tienen asignado un código de estado.

### Headers

Los headers tienen una estructura:

```
<nombre> : <valor>
```

Y pueden ser de los siguientes tipos (por lo general enviados en este orden):

- Generales
- De Solicitudes
- De Respuestas
- De Contenido

Ademas, los headers permiten utilizar la cache, define los tipos de conexion, las fechas de creación del mensaje, ver que codificación se utilizo y la lista de intermediarios por los que paso el mensaje.