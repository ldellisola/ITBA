# Email

1. Instalar `dovecot-pop3d` y `postfix`

   1. Para `postfix`, seleccionar **internet site** y poner un nombre de dominio. 

      A partir de ahora nuestro mail es el nombre de usuario de ubuntu + el dominio indicado. Por ejemplo:

      ```
      ldellisola@lucas.com
      ```

      Ir al archivo `/etc/postfix/main.cf` y agregar al final del archivo la siguiente linea:

      ```
      home_mailbox = mail/
      ```

      Donde `mail/` es la carpeta donde apunta `dovecot` para guardar los mails.

   2. Para `dovecot` no hacer nada creo.

2. Enviar un mail con `postfix`

   Por default, postfix levanta el servidor en el puerto 25, nos podemos conectar con netcat y hablar con el.

   ```bash
   $ netcat -C localhost 25
   220 protos ESMTP Postfix (Ubuntu)
   ehlo hola
   250-protos
   250-PIPELINING
   250-SIZE 10240000
   250-VRFY
   250-ETRN
   250-STARTTLS
   250-ENHANCEDSTATUSCODES
   250-8BITMIME
   250-DSN
   250-SMTPUTF8
   250 CHUNKING
   mail from: me@lucas.com
   250 2.1.0 Ok
   rcpt to: ldellisola@lucas.com
   250 2.1.5 Ok
   data
   354 End data with <CR><LF>.<CR><LF>
   Subject: hola?
   chau
   .
   250 2.0.0 Ok: queued as 6D9652501F
   ```

3. Recibir el mail en `dovecot`:

   Por default, `dovecot` levanta el servidor en el puerto 110. Esto se puede chequear:

   ```bash
   $ sudo netstat -ntlp | grep dovecot
   tcp        0      0 0.0.0.0:993             0.0.0.0:*               LISTEN      10285/dovecot
   tcp        0      0 0.0.0.0:995             0.0.0.0:*               LISTEN      10285/dovecot
   tcp        0      0 0.0.0.0:110             0.0.0.0:*               LISTEN      10285/dovecot
   tcp        0      0 0.0.0.0:143             0.0.0.0:*               LISTEN      10285/dovecot
   tcp6       0      0 :::993                  :::*                    LISTEN      10285/dovecot
   tcp6       0      0 :::995                  :::*                    LISTEN      10285/dovecot
   tcp6       0      0 :::110                  :::*                    LISTEN      10285/dovecot
   tcp6       0      0 :::143                  :::*                    LISTEN      10285/dovecot
   ```

   Para conectarme tengo que hacerlo por netcat en ese puerto, e indicarle el usuario y contraseña de la computadora:

   ```bash
   $ nc -C -vv localhost 110
   Connection to localhost 110 port [tcp/pop3] succeeded!
   +OK Dovecot (Ubuntu) ready.
   user ldellisola
   +OK
   pass mypass
   +OK Logged in.
   list
   +OK 1 messages:
   1 399
   .
   retr 1
   +OK 399 octets
   Return-Path: <me@lucas.com>
   X-Original-To: ldellisola@lucas.com
   Delivered-To: ldellisola@lucas.com
   Received: from hola (localhost [127.0.0.1])
   	by protos (Postfix) with ESMTP id 6D9652501F
   	for <ldellisola@lucas.com>; Tue, 19 Apr 2022 20:41:28 +0000 (UTC)
   Subject: hola?
   Message-Id: <20220419204132.6D9652501F@protos>
   Date: Tue, 19 Apr 2022 20:41:28 +0000 (UTC)
   From: me@lucas.com
   
   chau
   .
   ```

   Tiene los siguientes comandos:

   - `list`: enumera los correos
   - `retr i`: trae un correo
   - `dele i`: elimina un correo
   - `quit`: Se va a la mierda