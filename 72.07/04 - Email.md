# Email

En un servidor de linux, toda cuenta de usuario tiene un mail creado por defecto. Para acceder a esto hay que usar el comando `mail`. Este comando se usa de la siguiente forma:

```bash
mail [-opciones] User1,...,UserN
```

- `-s` indica el sujeto del mensaje.
- `-a` indica un archivo a adjuntar.

Ademas permite leer los mensaje disponibles si solo se invoca al programa sin ningún parámetro.

<img src="Resources/04 - Email/Screen Shot 2022-05-11 at 13.57.34.jpg" alt="Screen Shot 2022-05-11 at 13.57.34" style="zoom:50%;" />

- **Mail Transfer Agent (MTA)**: Envía mensajes entre hosts, pero es viejo, solo permite mandar texto.
- **Mail User Agent (MUA)**: Permite al usuario enviar y leer mensajes. Un ejemplo seria Gmail o dovecot (en la terminal).
- **Mail Delivery Agent (MDA)**: Coloca los mensajes en la casilla de correo.

## Protocolos

### SMTP

Es el protocolo por el cual se transmiten los mails por internet:

<img src="Resources/04 - Email/Screen Shot 2022-05-11 at 13.59.13.jpg" alt="Screen Shot 2022-05-11 at 13.59.13" style="zoom:50%;" />

Este protocolo esta construido sobre TCP para transferir mensajes desde el cliente al servidor, mediante el puerto 25. Los mensajes solo pueden contener 7bit ASCII.

Las transferencias son de forma directa, desde un servidor que envia a otro que recibe. Estas tienen 3 fases:

- Handshaking.
- Transferencia de Mensajes.
- Cierre.

Esta transferencia esta implementada mediante una interacción de comando/respuesta. Los comandos están compuestos por texto ASCII y las respuestas son una combinación de códigos de estado y comentarios. 

Los comandos son:

- `EHLO [mailaddr]`: Inicializa el protocolo SMTP. El parámetro tiene que ser un email y hay que reemplazar el ‘@’ por un punto.
- `MAIL FROM: [src_mail]`: Dice de que direccional se va a mandar el mail. No tiene por que existir.
- `RCPT tO: [dest_mail]`: Indica a que dirección se va a enviar el mail. Esta dirección tiene que existir.
- `DATA`: Indica que va a comenzar el mensaje.
- `From: [name] [email]`: Indica que nombre va a figurar en el campo *‘from’* del email. No tiene por que ser igual al valor en el campo `MAIL FROM:` y esta dirección puede también no existir.
- `To: [name] [email]`: Indica que nombre va a figurar en el campo ‘*to*’ del email. No tiene por que ser igual al valor en el campo `RCPT TO:` y esta dirección puede también no existir. 
- `MIME-Version: 1.0`: Versión de MIME.
- `Content-type: [content_type]; charset=[charset]`: El tipo de contenido y el charset usado.
- `Content-transfer-encoding: [cte]`: Indica la forma en la que se codifico al mensaje. Puede tener los siguientes valores:
  - `BASE64`: Se utiliza base64 para codificar el mensaje.
  - `QUOTED-PRINTABLE`: Se utiliza una forma de codificar el mensaje que trata de dejar el texto lo más parecido a ASCII y que este pueda ser leído sin tener que procesarlo.
  - `8BIT`: Utiliza la versión extendida de ASCII pero tiene la misma limitación en cantidad de caracteres por linea.
  - `7BIT`: Codificación ASCII normal. 
  - `BINARY`: La información enviada es binaria y no respeta las semánticas de SMPT.
  - `x-token`: Una regla que permite extender a nuevos tipos de codificación no estandarizados.
- `.`: Termina el mensaje

#### Ejemplo

Para poder probar esto, me puedo conectar a cualquier servidor SMPT. Nosotros vamos a utilizar el programa `postfix` para crear un servidor SMPT local, que va a estar en el puerto 25. Para conectarnos podemos usar netcat:

```bash
$ nc -v -C localhost 25
R: EHLO <mail.at.address> 
S: MAIL FROM:<me@mail>
R: 250 OK
S: RCPT TO:<other@mail>
R: 250 OK
S: RCPT TO:<invalid_user@mail>
R: 550 No such user here
S: DATA
R: 354 Start mail inputl end with <CRLF>.<CRLF>
S: ... message body ...
S: <CRLF>.<CRLF>
R: 250 OK
```

### POP

El protocolo POP2/POP3 permite obtener los mensajes de un servidor y almacenarlos en el host local, aunque hay versiones que permiten dejar una copia en el servidor. También se basa en el protocolo TCP y esta en el puerto 109/110.

<img src="Resources/04 - Email/Screen Shot 2022-05-11 at 14.10.46.jpg" alt="Screen Shot 2022-05-11 at 14.10.46" style="zoom:50%;" />

Este protocolo tiene dos fases, con varios comandos específicos:

- Autorizacion:
  - `user`: declara al usuario.
  - `pass`: contraseña.
- Transacciones:
  - `list`: lista los mensajes.
  - `retr [msg]`: muestra el contenido de un mensaje.
  - `dele [msg]`: borra un mensaje
  - `quit`: termina la comunicación.
  - `stat`: devuelve la cantidad de mensajes y bytes
  - `noop`
  - `rset`: recupera los mensajes marcados para ser eliminados.
  - `top [msg] [lines]`: devuelve el header y las primeras lineas de un mensaje.

#### Ejemplo

Podemos conectarnos a un servidor POP de forma fácil. En nuestra computadora podemos instalar `dovecot`, que va a levantar un servidor POP3 en el puerto 110 y nos podemos conectar a el utilizando`netcat`

```bash
$ nc -C -vv localhost 110
Connection to localhost 110 port [tcp/pop3] succeeded!
# Autorizacion
S: +OK POP3 server ready
C: user carlos
S: -ERR
C: user bob
S: +OK
C: pass hungry
S: +OK 
# Transacciones
C: list
S: 1 498
S: 2 912
S: ...
S: .
C: retr 1
S: <Message 1 content>
C: dele 1
C: quit
s: +OK
```

### IMAP

IMAP cumple con la misma función que POP, pero no intenta de obtener los mensajes de un servidor, sino que los consulta directamente desde él mismo. Otro beneficio es que permite marcar a los mensajes como leídos y crear carpetas en el servidor.

Se utilizan los siguientes comandos:

- `login [user] [pass]`: inicio de sesión.
- `capability`: lista las funcionalidades del servidor.
- `logout`: cierra la sesión.
- `select [mailbox]`: selecciona un buzón.
- `examine [mailbox]`: abre un buzón en modo de lectura.
- `create [mailbox]`: crea un buzón.
- `delete [mailbox]`: elimina un buzón.
- `rename [mailbox1] [mailbox2]`: cambia el nombre de un buzón.
- `close`: cierra un buzón y elimina todos los mensajes marcados para ser eliminados.
- `expunge`: elimina los mensajes marcados para ser eliminados.
- `fetch [n] [mailbox]`: muestra un mensaje del mailbox. 

## Formato de un Mensaje

El mensaje tiene una envoltura (headers) y luego tiene campos de cabecera, como from, to, etc. Los usuarios también pueden definir headers que comiencen con X. Luego viene una linea en blanco y después el cuerpo del mensaje.

El estándar actual acepta solo texto ASCII de 7 bits, con una longitud máxima de 100 caracteres por linea. Esto hace imposible enviar caracteres con tildes, archivos adjuntos, etc. Aunque estas limitaciones puede ser superadas con unos trucos:

- Para poder enviar cualquier carácter de texto o cualquier archivo binario, voy a utilizar el encoding conocido como [Base64](Annex/04.1 - Base64.md). De esta forma, todos los elementos se van a representar en 7-bit ASCII.
- A la hora de usar archivos adjuntos en el email, voy a indicar a que tipo se refiere con  [MIME](Annex/04.2 - MIME.md) 

## SPAM

Mediante spam se pueden obtener direcciones de correo, enviar mensajes mediante troyanos o servidores SMPT que aceptan relay.

Para evitar el spam, se implementaron varios métodos:

- **SPF**: Sender Policy Framework es un sistema de validación de correo electrónico en el que una organización especifica que sus servidores están autorizados a enviar correos en su nombre. Con este sistema no se puede enviar SPAM desde el servidor.
- **DKIM**: Domain Keys Identified Mail es otro sistema que no solo permite garantizar que el mail fue enviado por el dueño del dominio, sino que también garantiza que el mensaje no fue modificado.
- **Grey Listing**: Se tienen whitelists y blacklists dónde están los servidores autorizados para recibir mails. Cuando se recibe un correo que no esta en ninguna lista, esta pasa a una lista gris, y se pide que se reenvíe el mensaje, si el mensaje es reenviado, el servidor es agregado a la whitelist, sino va a la blacklist. Este sistema sirve por que los servidores automáticos de envio de SPAM no suelen utilizar una política de reenvío.
- **Filtros Bayesianos**: Es un método que se basa en el Teorema de Bayes para calcular la probabilidad de que un mail sea o no spam. Lo que hace es tomar cada palabra del mail (token), y analiza la probabilidad de que el mail sea spam dado que tiene ese token. La principal desventaja es que el método necesita ser entrenado, y puede tener falsos positivos (pérdida potencial de información).

## Autenticación de mails

Hay dos técnicas para autenticar mails:

- **Sender Policy Framework (SPF)**: Se agregan registros TXT en los DNS donde pones todos los IPs de los servidores autorizados a enviar desde un dominio determinado.

  <img src="Resources/04 - Email/Screen Shot 2022-03-18 at 17.21.27.png" alt="Screen Shot 2022-03-18 at 17.21.27" style="zoom:50%;" />

- **Domain Keys Identified Mail (DKIM)**: Permite a una organización responsabilizarse del envio de un mensaje, de manera que este pueda ser validado por un destinatario. Esta validación se realiza con una clave publica y ademas provee una verificación de integridad.

  <img src="Resources/04 - Email/Screen Shot 2022-05-12 at 10.16.58.jpg" alt="Screen Shot 2022-05-12 at 10.16.58" style="zoom:50%;" />

  

















