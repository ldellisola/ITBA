# Domain Name System

DNS es un sistema jerárquico distribuido para traducir nombres de hosts a direcciones IP. La información en DNS puede ser vista como un árbol invertido donde la raid hace referencia a los servidores de nombre de raíz.

<img src="Resources/03 - DNS/Screen Shot 2022-05-10 at 14.29.59.jpg" alt="Screen Shot 2022-05-10 at 14.29.59" style="zoom:50%;" />

## Dominios

Un **dominio** es una colección de computadoras que pueden ser acedadas usando un nombre en común, llamado **nombre de dominio**. Los dominios tiene distintos niveles, siendo **.com** el dominio *top-level* más conocido.

Dentro de un dominio *top-level*, una organización tiene su propio dominio o dominios. A si vez, dentro de estos pueden existir sub-dominios y cada host tiene su propio nombre (**hostname**). Uniendo este hostname con el dominio, se puede crear al **fully qualified domain name (FQDN)**.

<img src="Resources/03 - DNS/Screen Shot 2022-05-10 at 13.55.35.jpg" alt="Screen Shot 2022-05-10 at 13.55.35" style="zoom:50%;" />

## Resolución de Nombres

El objetivo para las computadoras es, a partir de un FQDN, obtener una ip a la cual conectarse. Para realizar esta conversion tiene que pasar por varias etapas:

1. Primero, la computadora se va a fijar en el archivo `/etc/hosts` si tiene una entrada del tipo `ip FQDN` que permita obtener la ip deseada. Este archivo se parece al siguiente:

   ```
   127.0.0.1			localhost
   ::1						localhost
   192.168.0.2		clarin.com fakeclarin.com
   ```

2. De no poder resolver la ip, se va a utilizar un **DNS Resolver**. Esto básicamente es un cliente de DNS que se contacta con un servidor de DNS para traducir a los FQDN a una ip. En Linux, este se configura en el archivo `/etc/resolv.conf` con las siguientes opciones:

   - `nameserver [address]`: Son las direcciones de los servidores DNS a los cuales el cliente se va a conectar. Puede haber hasta 3 entradas por dominio.
   - `domain [name]`: Indica el dominio.
   - `search [domains]`: Es similar a la opción anterior, pero puede contener a varios dominios. Esta opción no se puede usar con la anterior.
   - `sortlist [netword]/[mask]`: En caso de recibir multiples direcciones IP para un nombre, este parámetro las ordena en base a las redes listadas en esta opción.
   - `options [option]`: Es un parametro de seteo condicional con las siguientes opciones:
     - `debug`
     - `ndots: n`
     - `timeout: t`
     - `attempts: n`
     - `rotate`
     - `no-check-names`
     - `inet6`

Por defecto, este es el orden que se utiliza a la hora de transformar un FQDN en una IP, aunque esto puede ser modificado en el archivo `/etc/host.conf` donde se encuentra la siguiente linea:

```
order		hosts,bind
```

Si cambiamos el orden de estas variables, entonces va a utilizar primero el DNS Resolver y si no encuentra al nombre, utilizara al archivo `/etc/hosts`.

## Consultas

Las consultas a los servidores DNS se realizan de manera recursiva. Si el servidor al cual le solicito el servicio no conoce la IP asignada a este FQDN, este suele redirigirlo al cliente a otro servicio que pueda tener esta información.

También existe el caso de que estos servidores tengan en cache la entrada de este FQDN, aunque este registro no les pertenezca. En estos casos, el servidor devuelve la IP solicitada.

<img src="Resources/03 - DNS/Screen Shot 2022-05-10 at 14.42.13.jpg" alt="Screen Shot 2022-05-10 at 14.42.13" style="zoom:50%;" />

### Cache

Una vez que el servidor de nombres aprende el mapeo de un FQDN y una IP, lo guarda en la cache, que va a expirar en un tiempo determinado (TTL). Este proceso se usa generalmente desde los servidores de nombre, que cachean las direcciones de los servidores *top-level domain*, por lo que los root servers no suele visitarse.

## Tipos de Servidores DNS

- **DNS Cache-only Server**: Este tipo de servidor solo guarda en la cache las respuestas de otro servidor de nombres. No es considerado un servidor autorizado por qué su información es de segunda mano.
- **DNS Primary Server**: Es la fuente autorizada para toda la informacion de una zona especifica. Lee la informacion sobre el dominio desde un archivo construido por el administrador. Es un servidor autorizado para un dominio o parte de un dominio pues puede responder con autoridad preguntas sobre ese dominio.
- **DNS Secondary Server**: Transfiere información completa de una zona desde un servidor privado y la almacena en un archivo en el disco local. Mantiene la información completa y actualizada de una zona y puede responder preguntas sobre zona en forma autorizada.

## Registros DNS

Hay distintos tipos de registros DNS, aunque todos siguen el mismo formato:

```
name, value, type, ttl
```

Tenemos los siguientes tipos:

- `A`: Este registro indica el nombre del host y le asigna una IPv4.

  ```
  www.lucasdellisola.com.ar. 3600 IN A 192.168.0.3
  ```

  Donde estoy registrando el FQDN `www.lucasdellisola.com.ar` a la IPv4 especificada con un TTL de 3600 segundos.

- `NS`: Este registro indica la delegación de un dominio a un servidor dns.

  ```
  ns.lucasdellisola.com.ar.	21600	IN	NS	ada.ns.cloudflare.com.
  ```

  Donde estoy delegando el dominio `ns.lucasdellisola.com.ar` al servidor DNS `ada.ns.cloudflare.com` con un TTL de 21600 segundos.

- `CNAME`: Este registro es un alias para el nombre de un host.

  ```
  lucasdellisola.com.ar.	CNAME  www.lucasdellisola.com.ar.
  ```

  Donde estoy haciendo un alias desde mi pagina `lucasdellisola.com.ar` hacia `www.lucasdellisola.com.ar.`

- `MX`: Este registro indica la existencia de un servidor de mails en el dominio especificado.

  ```
  lucasdellisola.com.ar.	3600	IN	MX	10 mx1.forwardemail.net.
  ```

  Donde estoy asignando que todos los mails que se envíen a `*@lucasdellisola.com.ar` utilicen el servidor `mx1.forwardemail.net`. Los otros parámetros son el TTL de 3600 segundos y la prioridad on un valor de 10. A la hora de utilizar este mail, el servidor se fijara en la prioridad para decidir que servidor debería utilizar.

- `AAAA`: Este registro indica el nombre del host y le asigna una IPv6. 

  ```
  ipv6.lucasdellisola.com.ar. 3600 IN AAAA :::1
  ```

  De forma similar al registro `A`, asignamos un hostname a una IPv6.

- `SOA`: Este registro indica el comienzo de una zona autorizada de registros.

  ```
  lucasdellisola.com.ar. IN SOA 100 ns.lucasdellisola.com.ar. mailadmin.lucasdellisola.com.ar. (
  	1234 ; SERIAL
  	7200 ; REFRESH
  	3600 ; RETRY
    99999 ; EXPIRE
    1000 ; NEGATIVE TTL
  )
  ```

  Los parametros son:

  - `nombre`: Nombre de la zona: `lucasdellisola.com.ar`.

  - `TTL`: Time to live `100`.
  - `mname`: Es el nameserver principal para esta zona: `ns.lucasdellisola.com.ar`.
  - `rname`: Es el mail del admin de la zona, con el @ reemplazado por un punto: `mailadmin.lucasdellisola.com.ar`. 
  - `serial`: Número serial para esta zona, se usa para saber si la zona fue actualizada: `1234`.
  - `refresh`: Número de segundos que tiene que esperar un servidor secundario para realizar una query sobre el registro SOA y detectar cambios en la zona: `7200`.
  - `retry`: Número de segundos que tiene que esperar un servidor secundario para ver el número serial si el master no responde. Tiene que ser menor que el valor de refresh: `3600`.
  - `expire`: Número de segundos que tiene que esperar un servidor para dejar de responder queries si el servidor primario no responde. Este valor tiene que ser mayor que la suma de refresh y retry: `99999`.
  - `negative ttl`: Número en segundos que los servidores secundarios deben cachear las queries negativas que se hayan hecho al servidor primario: `1000`

- `SRV`: Este registro indica un host y un puerto especifico al cual conectarse para servicios específicos.

  ```
  _mail._tcp.lucasdellisola.com.ar.   3600 IN    SRV 10       60     5060 mail.lucasdellisola.com.ar.
  ```

  Los parametros son:

  - `servicio`: Es la primera parte del nombre, en este caso es `mail`.
  - `protocolo`: Es la segunda parte del nombre, en este caso `tcp`.
  - `nombre`: es el resto del dominio, en este caso `lucasdellisola.com.ar`.
  - `TTL`: tiempo de vida 3600.
  - `prioridad`: Menor prioridad significa mas chances de ser utilizado: `10`.
  - `peso`: Un peso relativo para los registros con la misma prioridad, un valor mas alto significa que va a ser elegido mas frecuentemente: `60`.
  - `puerto`: El puerto TCP o UDP del servicio: `5060`.
  - `destino`: FQDN del la computadora donde esta corriendo el servicio: `mail.lucasdellisola.com.ar`.

- `RP`: Este registro indica la persona responsable del dominio.

  ```
  lucasdellisola.com.ar. IN RP adminmail.lucasdellisola.com.ar. txt-name
  ```

  Los parametros son:

  - `dominio`
  - `admin mail`
  - `txt-name`: registro del tipo TXT. También puede ser reemplazado por `.`

- `TXT`: Es un registr que permite agregar texto arbitrario a un hostname o dominio.

  ```
  lucasdellisola.com.ar. IN TXT "Este es mi dominio"
  ```

- `SPF`: Indica una lista de IPs de hosts autorizados para enviar mails en nombre de este dominio.

  ```
  mail.lucasdellisola.com.ar. IN TXT "v=spf1 ip4:74.86.49.128/28 a mx ~all"
  ```

  Los parametros son:

  - `hostname`
  - `v=spf1`: Indica que es un registro del tipo `SPF`
  - `ip4:74.86.49.128/28`: Indica que se permiten todas las IPs en ese rango.

## Utilidades DNS

Para poder tester que nuestra configuración es correcta, se suelen utilizar 4 herramientas de linea de comando:

- **host**: informa la IP asignada a un host:

  ```bash
  $ host lucasdellisola.com.ar
  lucasdellisola.com.ar has address 181.46.230.46
  lucasdellisola.com.ar mail is handled by 10 mx2.forwardemail.net.
  lucasdellisola.com.ar mail is handled by 10 mx1.forwardemail.net.
  ```

- **nslookup**: Es una utilidad que permite consultar a los name servers por los distintos dominios y hosts que tienen.

  ```bash
  $ nslookup lucasdellisola.com.ar
  Server:		127.0.0.53
  Address:	127.0.0.53#53
  
  Non-authoritative answer:
  Name:	lucasdellisola.com.ar
  Address: 181.46.230.46
  ```

- **dig**: Permite ver los registros DNS para un dominio. Esta utilidad tiene varias opciones:

  - `+noall`: No trae ninguna selección.
  - `+answer`: Trae la respuesta.
  - `-t `: Permite pedir solo un tipo de registro.
  - `ANY`: Trae información de todos los registros.
  - `+short`: Trae solo las IPs.
  - `+trace`: Muestra todas las llamadas a los servidores DNS.

  ```bash
  $ dig lucasdellisola.com.ar
  ; <<>> DiG 9.16.1-Ubuntu <<>> lucasdellisola.com.ar
  ;; global options: +cmd
  ;; Got answer:
  ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 40582
  ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1
  
  ;; OPT PSEUDOSECTION:
  ; EDNS: version: 0, flags:; udp: 65494
  ;; QUESTION SECTION:
  ;lucasdellisola.com.ar.		IN	A
  
  ;; ANSWER SECTION:
  lucasdellisola.com.ar.	252	IN	A	181.46.230.46
  
  ;; Query time: 0 msec
  ;; SERVER: 127.0.0.53#53(127.0.0.53)
  ;; WHEN: Wed May 11 14:40:12 UTC 2022
  ;; MSG SIZE  rcvd: 66
  ```

- **whois**: Provee información sobre el responsable del dominio

  ```bash
  $ whois lucasdellisola.com.ar
  % La información a la que estás accediendo se provee exclusivamente para
  % fines relacionados con operaciones sobre nombres de dominios y DNS,
  % quedando absolutamente prohibido su uso para otros fines.
  %
  % La DIRECCIÓN NACIONAL DEL REGISTRO DE DOMINIOS DE INTERNET es depositaria
  % de la información que los usuarios declaran con la sola finalidad de
  % registrar nombres de dominio en ‘.ar’, para ser publicada en el sitio web
  % de NIC Argentina.
  %
  % La información personal que consta en la base de datos generada a partir
  % del sistema de registro de nombres de dominios se encuentra amparada por
  % la Ley N° 25326 “Protección de Datos Personales” y el Decreto
  % Reglamentario 1558/01.
  
  domain:		lucasdellisola.com.ar
  registrant:	20412628692
  registrar:	nicar
  registered:	2020-02-03 15:27:54.272937
  changed:	2022-05-05 23:00:33.094087
  expire:		2023-04-03 00:00:00
  
  contact:	20412628692
  name:		DELL ISOLA LUCAS
  registrar:	nicar
  created:	2020-03-09 14:04:43.185609
  changed:	2022-05-05 23:00:30.082556
  
  nserver:	ada.ns.cloudflare.com ()
  nserver:	jihoon.ns.cloudflare.com ()
  registrar:	nicar
  created:	2021-10-07 12:15:57.842063
  ```

## DNS Dinamico

Existe un protocolo llamado DDNS que permite registrar FQDN a dispositivos con IPs dinámicas, es decir, que cambian con el tiempo. Este protocolo permite que una computadora cliente conectada a la red con IP dinámica le vaya avisando al servidor DNS de su IP de forma regular:

<img src="Resources/03 - DNS/Screen Shot 2022-05-11 at 11.58.18.jpg" alt="Screen Shot 2022-05-11 at 11.58.18" style="zoom:50%;" />

En estos casos, el TTL de los registros DNS sera muy bajo, con valores de 1 minuto para poder tener siempre al día al IP de nuestra maquina.

## DNS Spoofing

DNS Spoofing es un proceso para hacer que un registro DNS apunte a una dirección IP que no debería.

<img src="Resources/03 - DNS/Screen Shot 2022-05-11 at 12.29.07.jpg" alt="Screen Shot 2022-05-11 at 12.29.07" style="zoom:50%;" />

Hay varias formas de hacer esto:

- Un servidor malicioso puede enviarle al servidor DNS una IP con su FQDN sin que el servidor DNS haya preguntado por ella

  <img src="Resources/03 - DNS/Screen Shot 2022-05-11 at 12.30.50.jpg" alt="Screen Shot 2022-05-11 at 12.30.50" style="zoom:50%;" />

  Para evitar esto se debe verificar que la respuesta corresponda con alguna query, así como también verificar su ID y que el origen sea confiable.

- **DNS Spoofing**: Se puede realizar un ataque Man-In-The-Middle, donde una computadora maliciosa obtiene el trafico de la computadora víctima. Cuando esta computadora realiza una query DNS, el atacante envia una respuesta falsa con el mismo ID que la query.

  <img src="Resources/03 - DNS/Screen Shot 2022-05-11 at 12.33.11.jpg" alt="Screen Shot 2022-05-11 at 12.33.11" style="zoom:50%;" />

- **DNS Cache Poisoning**: Este ataque consiste en insertar un registro invalido en el cache de un servidor DNS, para que luego se lo sirva a todos los clientes.

  La idea es simple, se arma un servidor DNS con un dominio especifico, luego con una query se le pregunta al servidor víctima sobre la IP de este FQDN. El servidor víctima le va a preguntar al Servidor DNS malicioso y este le va a responder con varios registros, empezando con el que pidió el servidor víctima y luego inyectando los registros inválidos.

  <img src="Resources/03 - DNS/Screen Shot 2022-05-11 at 12.49.36.jpg" alt="Screen Shot 2022-05-11 at 12.49.36" style="zoom:50%;" />

## Formato de los Mensajes

Los mensajes DNS se envían a través de UDP y tiene el siguiente header

<img src="Resources/03 - DNS/Screen Shot 2022-05-11 at 12.53.12.jpg" alt="Screen Shot 2022-05-11 at 12.53.12" style="zoom:50%;" />

Donde el opcode significa:

- `0`: Consulta estándar.
- `1`: Consulta inversa.
- `2`: Consulta inversa por *server status*.

Y rcode significa:

- `0`: Sin error
- `1`: Error de formato, el servidor no pudo decodificar el mensaje.
- `2`: Error en el servidor, el servidor tuvo un error inesperado.
- `3`: Error en el nombre, el FQDN no existe.
- `4`: Sin implementar, 
- `5`: Rechazado.

Ademas, tiene los siguientes bits:

- `Q`: indica si es una query (0) o una respuesta (1)
- `A`: Indica si es una respuesta autorizada.
- `T`: Indica si es una respuesta truncada.
- `D`: Indica si es una pregunta con recursividad.
- `R`: Indica si hay recursión disponible.

Luego tenemos el mensaje de pregunta, que ademas de estos headers tiene:

<img src="Resources/03 - DNS/Screen Shot 2022-05-11 at 13.43.40.jpg" alt="Screen Shot 2022-05-11 at 13.43.40" style="zoom:50%;" />

Con el tipo de pregunta:

- `1`: host.
- `2`: name server autorizado.
- `5`: nombre canonico con alias.
- `15`: mail exchange.
- `252`: solicitud de transferencia de zona.
- …

Luego, la respuesta tiene la siguiente estructura:

<img src="Resources/03 - DNS/Screen Shot 2022-05-11 at 13.45.07.jpg" alt="Screen Shot 2022-05-11 at 13.45.07" style="zoom:50%;" />























