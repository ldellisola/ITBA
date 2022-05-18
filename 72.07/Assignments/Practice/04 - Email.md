# Email

## 54

> Si usted desea entregar de forma directa un correo electrónico a una casilla del dominio alu.itba.edu.ar ¿A qué servidores SMTP deberá conectarse?

Para averiguar esto necesito ver a donde dirigen los registros `MX` del DNS del dominio `alu.itba.edu.ar`. Para averiguar esto podemos correr el siguiente comando:

```bash
$ dig -t MX alu.itba.edu.ar

; <<>> DiG 9.16.1-Ubuntu <<>> -t MX alu.itba.edu.ar
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 13923
;; flags: qr rd ra; QUERY: 1, ANSWER: 5, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;alu.itba.edu.ar.		IN	MX

;; ANSWER SECTION:
alu.itba.edu.ar.	4502	IN	MX	1 aspmx.l.google.com.
alu.itba.edu.ar.	4502	IN	MX	5 alt1.aspmx.l.google.com.
alu.itba.edu.ar.	4502	IN	MX	5 alt2.aspmx.l.google.com.
alu.itba.edu.ar.	4502	IN	MX	10 alt3.aspmx.l.google.com.
alu.itba.edu.ar.	4502	IN	MX	10 alt4.aspmx.l.google.com.

;; Query time: 275 msec
;; SERVER: 127.0.0.53#53(127.0.0.53)
;; WHEN: Tue Apr 19 19:04:45 UTC 2022
;; MSG SIZE  rcvd: 162
```

Podemos ver que se debería conectar a los servidores de google:

- `aspmx.l.google.com.`
- `alt1.aspmx.l.google.com.`
- `alt2.aspmx.l.google.com.`
- `alt3.aspmx.l.google.com.`
- `alt4.aspmx.l.google.com.`

## 55

> Intente conectarse a otros servidores SMTP que no sean administrado por el ITBA o a la
> red en la que se encuentra (por ejemplo smtp.speedy.com.ar).
>
> 1. ¿Puede?

Si, me dejo conectarme

```bash
$ nc -v -C smtp.speedy.com.ar 25
Connection to smtp.speedy.com.ar 25 port [tcp/smtp] succeeded!
220 mail-out-cmgw05-mia.tpn.terra.com cmsmtp ESMTP server ready
EHLO lucas.com.ar
250-mail-out-cmgw05-mia.tpn.terra.com hello [200.5.121.136], pleased to meet you
250-AUTH LOGIN PLAIN
250-SIZE 40000000
250-ENHANCEDSTATUSCODES
250-8BITMIME
250-STARTTLS
250 OK

```

> 2. Si no puede establecer la conexión: ¿Por qué cree que el administrador del ITBA con-
>    figuró la red de esa manera? 

Lo hacen para que no se envíe spam a traves de sus servidores. Lo que hacen es que bloquean todas las conexiones salientes del puerto 25.

> 3. Si le es posible intente enviar un correo electrónico a su cuenta del ITBA. ¿Es posible?

Para enviar el mail hay que usar netcat (`nc`):

```bash
$ nc -v -C aspmx.l.google.com 25
Connection to aspmx.l.google.com 25 port [tcp/smtp] succeeded!
220 mx.google.com ESMTP h13-20020a9d6a4d000000b006043e0d348asi6511922otn.173 - gsmtp
EHLO noreply.pyd.com.ar
250-mx.google.com at your service, [200.5.121.136]
250-SIZE 157286400
250-8BITMIME
250-STARTTLS
250-ENHANCEDSTATUSCODES
250-PIPELINING
250-CHUNKING
250 SMTPUTF8
MAIL FROM: <noreply@pyd.com.ar>
250 2.1.0 OK h13-20020a9d6a4d000000b006043e0d348asi6511922otn.173 - gsmtp
RCPT TO: <ldellisola@itba.edu.ar>
250 2.1.5 OK h13-20020a9d6a4d000000b006043e0d348asi6511922otn.173 - gsmtp
DATA
354  Go ahead h13-20020a9d6a4d000000b006043e0d348asi6511922otn.173 - gsmtp
From: "alguien" (personal) <tumama@pyd.com.ar>
To: "otra persona" <tuhermana@pyd.com.ar>
Subject: Quien te quiere?
MIME-Version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: quoted-printable
=C2=Hola!
.
250 2.0.0 OK  1650396737 h13-20020a9d6a4d000000b006043e0d348asi6511922otn.173 - gsmtp

```

Los comandos son:

- `EHLO mail.at.address`: Inicializa el protocolo SMTP
- `MAIL FROM <Address>`: Indica de que direccional se va a mandar el mail. No tiene por que existir.
- `RCPT TO: <Address>`: A que dirección se va a mandar el mail. Tiene que existir.
- `DATA`: Indica que va a comenzar el mensaje.
- `From: "alguien" (personal) <alguien@mail.com>`: Esto indica que nombre va a figurar en el mail, en el campo “from”. No tiene por que ser igual que el de `MAIL FROM` y puede no existir.
- `To: "otra persona" <otro@mail.com>`: Esto indica que nombre va a figurar en el mail, en el campo “To”. No tiene por que ser igual que el de `RCPT TO` y puede no existir.
- `MIME-Version: 1.0`: Version de MIME
- `Content-type: text/plain; charset=UTF-8` El tipo de contenido y el charset usado
- `Content-transfer-encoding: quoted-printable`: La forma de encodear el mensaje
- `.`: Termina el mensaje

> 4. ¿Qué significa la configuración de relay?

Es un servidor externo a traves del cual pasan todos los mensajes que se envían a nuestro servidor SMPT. Este servidor externo puede filtrar mensajes de usuarios no autorizados, detectar spam, etc. Luego el mensaje es reenviado a nuestros servidores SMPT.

> 5. Teniendo en cuenta todo el análisis anterior. ¿Con qué políticas configuraría su servidor SMTP?

Usando relay

## 56

> Instale `dovecot` y `postfix`. Configurarlo para que los correos enviados a su casilla puedan ser obtenidos mediante el protocolo `POP3`. Envíe un correo a su cuenta de correo del ITBA con título ”PDC Ejercicio 1”, y cuerpo
> ”hola mundo”.
> 
> 1. Use en el `MAIL FROM`: su cuenta de correo del ITBA. Valide que el correo llegue. Revise desde el MUA el ”fuente de correo”. ¿El correo fue modificado?
> 

No


> 2. Haga los cambios necesarios para asegurar que en el campo To: que muestra el MUA se vea la dirección del destinatario.
> 

Hay que agregar el campo `to: ...`


> 3. Manteniendo su dirección de correo del ITBA en el MAIL FROM: agregue en el mensaje una cabecera From con la dirección alguien@example.org.
> 	1. ¿Con qué dirección se muestra en el MUA el remitente?
> 	2. ¿Qué ve en las cabeceras del mensaje fuente?
> 	

Se muestra con `alguien@example.com`. En el mensaje fuente se muestra el mail del Itba.


> 4. Manteniendo los cambios realizados. ¿Que sucede si en el mensaje (DATA) se escribe una cabecera To: pepe@example.org. ¿El mensaje le llega a usted?
> 

Si.


> 5. Manteniendo los cambios realizados anteriormente, en RCPT TO: use una dirección inexistente.
>	 	1. ¿Se le notifica que no se pudo entregar el correo?
>	 	2. ¿Qué dirección se utiliza para notificar los rebotes?

Se manda un mail a la dirección que lo envió, con una copia del mail original, indicando que no pudo ser enviado.

## 57

> Repita el ejercicio anterior, pero utilizando como destino una dirección servida por su SMTP local.
> • Revise los correos electrónicos desde el filesystem (maildir o mailbox).
> • Revise los correos electrónicos utilizando el protocolo POP3 utilizando netcat.

Igual que antes.no jodas

## 58

> {W} Utilizando un MUA envíe un correo electrónico que contenga de mensaje el texto
>
> ```
> hólá múndó ñ
> ```
>
> y contenga como adjunto la imagen ubicada en https://www.itba.edu.ar/wp-con-tent/uploads/2020/07/Marca-ITBA.jpg.

No se que pedis

## 59

> Verifique como realiza la transacción SMTP el MUA. Detecte diferencias con las que usted ha realizado en los ejercicios anteriores.
> Utilizando el MUA también obtenga utilizando POP3 y verifique la transacción.

No

## 60

> Analizar el funcionamiento de las siguientes técnicas anti-spam. ¿Cuales son sus ventajas
> y desventajas?
>
> - SPF
> - Domain keys
> - Grey Listing
> - Filtros Bayesianos

- Sender Policy Framework es un sistema de validación de correo electrónico en el que una organización especifica qué servidores (por nombre o IP) están autorizados a enviar correos en su nombre, dándole al receptor información de qué tan confiable es el mensaje. De esta manera se evita que se envíe spam utilizando los servidores. Sus principales desventajas son que no valida el encabezado “From” (lo muestra como el remitente actual del mensaje), se rompe cuando el correo es reenviado (toma al que reenvía como el nuevo remitente del mensaje), y no tiene informes (dificulta el mantenimiento).
- DomainKeys Identified Mail es un sistema de validación que permite al receptor de un correo garantizar que este fue enviado por el dueño del dominio. La principal desventaja es que no analiza el contenido del mensaje, sino que sólo valida al emisor.
- Grey Listing
  Se tienen listas blancas y listas negras, donde están los servidores que están autorizados o prohibidos para recibir mails. Cuando se recibe un mail desde un servidor que no está en ninguna de las dos listas, el servidor rechaza el mensaje y pide que sea reenviado. Esto es porque los servidores automatizados para spam en general no tienen una política de reenvío, por lo que al no reenviarse pone al servidor en la lista negra. El principal problema puede ser el tiempo de recepción de un mensaje cuanto este es crítico.
- Filtros Bayesianos
  Es un método que se basa en el Teorema de Bayes para calcular la probabilidad de que un mail sea o no spam. Lo que hace es tomar cada palabra del mail (token), y analiza la probabilidad de que el mail sea spam dado que tiene ese token. La principal desventaja es que el método necesita ser entrenado, y puede tener falsos positivos (pérdida potencial de información).

## 61

> Según la configuración SPF de itba.edu.ar: ¿desde qué direcciones IP se pueden enviar correos a servidores que implementen SPF?

```bash
$ nslookup -type=txt itba.edu.ar
Server:		127.0.0.53
Address:	127.0.0.53#53

Non-authoritative answer:
itba.edu.ar	text = "v=spf1 include:_spf.google.com ip4:190.104.250.100 ip4:190.104.250.101 ip4:52.67.50.43 ip4:54.94.246.207 ip4:52.67.178.216 ip4:200.32.57.124 include:_spf.perfit-mail.net include:spf.mandrillapp.com -all"

Authoritative answers can be found from:
```

Podemos ver que se pueden enviar de las siguientes direcciones:

- `*spf.google.com`
- `*spf.perfit-mail.net`
- `spf.mandrillapp.com`
- `190.104.250.100`
- `190.104.250.101`
- `52.67.50.43`
- `54.94.246.207`
- `52.67.178.216`
- `200.32.57.124`