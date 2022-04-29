# Capa de Enlace

Esta capa encapsula los datagramas y se encarga de hacer una transferencia confiable de los mismos entre dos nodos adyacentes. Cada interface tiene su numero MAC unido, otorgado por IEEE.

Esta capa ofrece:

- **Control de Flujo**: Ajusta la velocidad del enlace al eslabón más lento.
- **Detección de Errores**
- **Corrección de Errores**
- **Half-duplex o Full-duplex**: Ambos puntos pueden emitir y recibir. Half-duplex implica que si uno esta emitiendo, el otro no puede emitir. En full-duplex esta limitación no existe.

Hay dos tipos de comunicaciones a nivel de enlace:

<img src="Resources/Untitled 1/Screen Shot 2022-04-29 at 16.09.49.jpg" alt="Screen Shot 2022-04-29 at 16.09.49" style="zoom:50%;" />

## Protocolos Punto a Punto

Estos protocolos son mas simples que los enlaces broadcast. Generalmente son usados para encapsular datagramas IP y no necesitan control de acceso al medio.