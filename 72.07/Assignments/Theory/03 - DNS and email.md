# DNS y Email

## 1

> Desde mi notebook y situado fuera del ITBA, puedo establecer una sesión SSH a “`pampero.itba.edu.ar`”, pero estando dentro del ITBA no. Mis servidores DNS fijos son de los de Google: `4.4.4.4` y `8.8.8.8`. ¿Por qué falla y cómo se resuelve?

Desde la red del ITBA se puede acceder a pampero por una IP privada y no se puede hacerlo desde su IP publica. El servidor DNS de google te redirige a pampero por la IP publica, pero el router no puede encontrar a esa IP.

Lo que hay que hacer para arreglarlo seria utilizar el DNS del ITBA cuando se conecta a la red del ITBA. Este DNS nos va a dar la dirección IP privada en la red local del ITBA y nos vamos a poder conectar.

## 2

> Un servidor DNS debe escuchar peticiones tanto `UDP` como `TCP`, por lo que un cliente DNS puede elegir utilizar cualquiera de ellos como protocolo de transporte. Nombrar un caso en el cual sea mejor usar `UDP` y un caso en el cual sea preferible usar `TCP`

Se utiliza `UDP` para respuestas cortas ya que solo se envía un datagrama y no hay que establecer una conexión. Si se espera que la respuesta sea larga, entonces me conviene utilizar `TCP`, ya que el over head de realizar la conexión y cerrarla no va a ser tan molesto.

### 3

> Se consulta vía `UDP` a un servidor DNS, pero la respuesta no entra en un datagrama, ¿cómo se resuelve? ¿Lo debe contemplar el protocolo de transporte o el de aplicación?

En este caso, el servidor responde solo un datagrama y enciende el bit de truncado en los headers del paquete. Luego es responsabilidad del cliente, si tiene la información que necesita puede no hacer otra consulta, pero si necesita toda la información, entonces debe volver a realizar la consulta utilizando `TCP`.

Es un problema que se resuelve a nivel aplicación, no protocolo de transporte.

## 4

> Un programa de correo (Thunderbird, app de mail para celular, etc.) sólo nos pregunta cuenta de correo y contraseña, 
>
> ¿Cómo sabe cuál es el servidor al cual tiene que conectarse para enviar un mail?

Al tener la cuenta de correo, puede consultar con el DNS por los registros MX del dominio del mail y a partir de eso obtiene el servidor.

> ¿Por qué puede ser que falle la conexión al servidor de mail? (descartar cosas como contraseña inválida, falta de señal, no hay internet, etc.)

El registro DNS solo nos indica la dirección del servidor, no si este esta escuchando en el puerto default.

## 5

> El IP de un FQDN ha cambiado, el servidor DNS que utilizo ya conoce la nueva IP, sin embargo en mi computadora me lo sigue resolviendo con la vieja IP. Nombrar dos razones por las que puede estar sucediendo esto y cómo resolverlo

Una razón es que los cambios se hayan realizado en el servidor DNS pero no se propagaron al resto de los servidores DNS. Para arreglar esto habría que esperar a que se propague o indicarle manualmente a la computadora cual es la dirección del servidor DNS.

La otra razón posible es que el registro DNS esta cacheado localmente y todavía no se venció. Para solucionar a este problema debemos refrescar manualmente la cache.

Una tercera razón seria que el FQDN este definido en el archivo `/etc/hosts` y hace falta cambiarlo manualmente.

## 6

> El IP de un servidor HTTP ha cambiado, pero mi servidor DNS lo sigue resolviendo con la vieja IP.
>
> Si yo conozco la nueva IP, ¿puedo usarla directamente en el browser en vez del FQDN? ¿Funciona siempre, nunca o a veces?

A veces, esto es por que la IP iría en el campo *Host* y algunos web servers no lo aceptarían.

> ¿Cómo puedo hacer para conectarme al servidor web por nombre -sabiendo la nueva IP- sin esperar que lo resuelva correctamente mi servidor DNS?

Puedo modificar el archivo `/etc/hosts` para que el FQDN te dirija a la dirección IP nueva.

> Si no conozco la nueva IP, ¿qué puedo hacer para averiguarla?

Puedo hacer una consulta por el registro `A` (si es IPv6 se debe usar `AAAA`) al servidor DNS para averiguar la IP nueva.

## 7

> ¿Qué se obtiene en cada uno de los siguientes comandos?
>
> `$ dig .`

Se obtienen todos los registros `A` del dominio root

> `$ dig . NS`

Se obtienen todos los registros `NS` del dominio root

> `$ dig ar`

Se obtienen todos los registros `A` del dominio `ar`

> `$ dig ar NS`

Se obtienen todos los registros `NS` del dominio `ar`

> `$ dig ar MX`

Se obtienen todos los registros `MX` del dominio `ar`

## 8

> Para cada protocolo indicar si es orientado a conexión o no, confiable o no confiable:
>
>  1. SMTP
>  2. POP3
>  3. DNS

| Protocolo | Orientado a conexión | confiable |
| --------- | -------------------- | --------- |
| SMTP      | SI                   | SI        |
| POP3      | SI                   | SI        |
| DNS       | NO                   | NO        |

## 9

> Analizar la veracidad de las siguientes afirmaciones:
>
> `SMTP` usa `TCP` como protocolo de transporte, eso garantiza que el mail que yo envío será recibido por el destinatario final.

Falso, TCP solo me garantiza que el mail fue recibido por el servidor SMTP.

> Yo uso Gmail desde un browser. Eso quiere decir que en el envío de mis mails no interviene `SMTP`.

Falso, ya que los servidores de Gmail envían los mails utilizando SMTP.

> El uso de `IMAP` ha perdido popularidad desde que existe Gmail y otros webmails.

Verdadero, IMAP se usa principalmente para acceder a los emails desde el servidor y no descargarlos. Los webmail's suelen descargar el email del servidor y los almacenan ellos.

## 10

> ¿Por qué tomarse la molestia de usar Split-horizon al configurar un servidor DNS? ¿Por qué no asociar el nombre del host únicamente a la IP pública?

Para evitar que los paquetes enviados por la red local entren desde una IP publica, agregando el overhead del firewall y routing. Con Split-Horizon se le indica la IP privada en la red, por lo que los otros hosts se pueden conectar directamente.







