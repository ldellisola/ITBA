# Telnet

## 70

> Exponer un servidor de `telnet` utilizando `xinetd`. Para esto debe tener instalado `xinetd` y `in.telnetd` y crear el archivo `/etc/xinetd.d/`
> telnet con el siguiente contenido y luego reiniciarlo:
>
> ```
> service telnet
> {
> disable = no
> id = telnet
> socket_type = stream
> protocol = tcp
> wait = no
> user = root
> server = /usr/sbin/in.telnetd
> }
> ```
>
> Establezca una sesión con telnet y pase la autenticación. Con wireshark:
>
> - Verifique la negociación entre el cliente y el servidor.
> - ¿Cuál es la técnica para que la contraseña ingresada por el usuario no se muestre en
>   la terminal?

Primero instalo telnet:

```bash
$ sudo apt-get install -y xinetd
$ sudo apt-get install -y telnetd
$ sudo service xinetd restart
```

Me conecto por telnet a la IP de mi servidor (en este caso `localhost`):

```bash
$ telnet localhost
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
Ubuntu 20.04.4 LTS
protos login: ldellisola
Password: mypass
Welcome to Ubuntu 20.04.4 LTS (GNU/Linux 5.4.0-107-generic aarch64)
...
```

Lo que hace el servidor es, cuando se ingresa el usuario, el cliente envía de a un carácter y el servidor le responde con él mismo por telnet. A la hora de enviar la contraseña, esta no se envía por telnet.