# SSL

La Secure Sockets Layer (SSL) fue desarrollada por Netscape en 1994 y es una capa intermedia entre potocolos de aplicación y de transporte. Permite que un servidor y un cliente se comuniquen en un medio encriptado luego de autenticarse.

Para usar SSL en internet, se necesita crear un certificado:

1. Crear una clave publica y privada.
2. Crear un certificado que incluya la clave del servidor.
3. Firmar el certificado, por un CA reconocido o por nosotros mismos.

Para conectarse por a un servidor mediante SSL, se tiene que hacer un handshake:

<img src="Resources/05 - SSL/Screen Shot 2022-03-18 at 18.15.48.png" alt="Screen Shot 2022-03-18 at 18.15.48" style="zoom:50%;" />

## TLS

La Transport Layer Security es una capa de seguridad basada en SSL 3.0, que permite establecer una conexión segura para distintos protocolos:

- HTTPs en el puerto 443.
- IMAPs en el puerto 993.
- POPs en el puerto 995.

Es una conexión segura por protocolo, que comienza con un `hello` inseguro y luego cambian a una conexión segura. Tanto TSL como SSL proporcionan el mismo nivel de encriptación, pero difieren en cómo se inicia la conexión segura.

Se puede usar DNS sobre TLS para ofrecer una experiencia mas segura. Esto se hace por defecto en el puerto 853 y permite dos modos de operación:

- Modo Estricto
- Modo de Privacidad Oportunista

El cliente usa un comando GET o POST para enviar una query DNS codificada.