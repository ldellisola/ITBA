# Email

==FALTA==

- **Mail Transfer Agent (MTA)**: Envía mensajes entre hosts, pero es viejo, solo permite mandar texto.
- **Mail User Agent (MUA)**: Permite al usuario enviar y leer mensajes.
- **Mail Delivery Agent (MDA)**: Coloca los mensajes en la casilla de correo.

## POP

El protocolo POP/POP3 permite acceder a los mails enviados de forma remota

## Webmail

Es un cliente de correo electrónico (MUA) con una interface web, que permite acceder al mailbox de un usuario.›

<img src="Resources/04 - Email/Screen Shot 2022-03-18 at 16.50.40.png" alt="Screen Shot 2022-03-18 at 16.50.40" style="zoom:50%;" />

## Mensaje

El mensaje tiene una envoltura (headers) y luego tiene campos de cabecera, como from, to, etc. Los usuarios también pueden definir headers que comiencen con X. Luego viene una linea en blanco y después el cuerpo del mensaje.

El estandard actual de SMPT y RFC822 acepta solo texto ASCII de 7 bits, con una longitud máxima de 100 caracteres por linea. Para superar a esta limitación se utilizan métodos como:

- Encriptar en base64, que mantiene una codificación simple, pero cada grupo de 3 bytes es codificado como 4 bytes. Si la cantidad de bits del mensaje no es múltiplo de 6, entonces se agregan 0s hasta llegar a un múltiplo de 6.

## MIME

Para enviar archivos binarios, como imágenes, tenemos que trabajar con las mismas limitaciones. Para eso se utiliza el protocolo **MIME**.

<img src="Resources/04 - Email/Screen Shot 2022-03-18 at 17.05.16.png" alt="Screen Shot 2022-03-18 at 17.05.16" style="zoom:50%;" />

El objetivo de MIME es normalizar el intercambio de diferentes tipos de contenido y solucionar el problema de enviar texto internacionalizado por email. 

Los headers de MIME son:

- MIME-version
- Content-type
- Content-Transfer-Encoding:
  - 7 bits
  - 8 bits
  - binario
- Content-Description
- Content-ID

## SPAM

MEdiante spam se pueden obtener direcciones de correo, enviar mensajes mediante troyanos o servidores SMPT que aceptan relay.

Para evitar el spam, se implementaron blacklists y whitelists de IPs, para ver que servidor de mails puede enviar a nuestro servidor. 

También se puede hacer mediante **greylisting**, esta es una lista donde se agregan los nuevos servidores SMPT. A estos servidores nuevos les envían un comando pidiendo que en un tiempo le reenvié el mail. Como la mayoría de los servidores truchos no responden a este mail, se podía saber si a esa IP hay que agregarla a la whitelist o a la blacklist.

Otro metodo seria clasificarlos con **filtros bayesianos** para definir si es un buen servidor o un mal servidor.

## Autenticación de mails

Hay dos técnicas para autenticar mails:

- **Sender Policy Framework (SPF)**: Se agregan registros TXT en los DNS donde pones todos los IPs de los servidores autorizados a enviar desde un dominio determinado.

  <img src="Resources/04 - Email/Screen Shot 2022-03-18 at 17.21.27.png" alt="Screen Shot 2022-03-18 at 17.21.27" style="zoom:50%;" />

- **Domain Keys Identified Mail (DKIM)**: