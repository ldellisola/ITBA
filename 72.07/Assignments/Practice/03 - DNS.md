# DNS

## 40

> Utilizando herramientas de línea de comandos determine cuál es el servidor de nombres que es autoridad para cada uno de los FQDN:
>
> - `google.com`
> - `itba.edu.ar`
> - `pampero.it.itba.edu.ar`
>
> Revise los paquetes enviados, y sus respuestas.

Puedo usar `whois` o `dig`, indicando que se busquen los registros del tipo `SOA`. O usando `dig +nssearch`

```bash
$ dig +short -t SOA google.com.ar
ns1.google.com. dns-admin.google.com. 441131748 900 900 1800 60
$ dig +short -t SOA itba.edu.ar
aws-w-dc03.itbadc.itba.edu.ar. root.itba.edu.ar. 2019150943 180 600 10800 10800
$ dig +short pamero.it.itba.edu.ar
10.16.1.100
```

## 41

> Determine cuales son los servidores que manejan el correo electrónico entrante para cada uno de los siguientes dominios FQDNS:
>
> - `google.com`
> - `itba.edu.ar`
> - `it.itba.edu.ar`

El tipo de registro encargado de los emails es `MX`

```bash
$ dig +short -t MX google.com.ar
20 alt1.aspmx.l.google.com.
8 smtp.google.com.
10 aspmx.l.google.com.
50 alt4.aspmx.l.google.com.
30 alt2.aspmx.l.google.com.
40 alt3.aspmx.l.google.com.
$ dig +short -t MX itba.edu.ar
1 aspmx.l.google.com.
5 alt1.aspmx.l.google.com.
5 alt2.aspmx.l.google.com.
10 alt3.aspmx.l.google.com.
10 alt4.aspmx.l.google.com.
$ dig +short -t MX it.itba.edu.ar
0 hematite.it.itba.edu.ar.
```

## 42

> ¿Cuales son todos los servidores de nombre que entran en juego para resolver `pampero.it.itba.edu.ar` partiendo desde un root server?

```bash
$ dig +trace pampero.it.itba.edu.ar

; <<>> DiG 9.16.1-Ubuntu <<>> +trace pampero.it.itba.edu.ar
;; global options: +cmd
.			4015	IN	NS	m.root-servers.net.
.			4015	IN	NS	l.root-servers.net.
.			4015	IN	NS	k.root-servers.net.
.			4015	IN	NS	j.root-servers.net.
.			4015	IN	NS	i.root-servers.net.
.			4015	IN	NS	h.root-servers.net.
.			4015	IN	NS	g.root-servers.net.
.			4015	IN	NS	f.root-servers.net.
.			4015	IN	NS	e.root-servers.net.
.			4015	IN	NS	d.root-servers.net.
.			4015	IN	NS	c.root-servers.net.
.			4015	IN	NS	b.root-servers.net.
.			4015	IN	NS	a.root-servers.net.
;; Received 262 bytes from 127.0.0.53#53(127.0.0.53) in 0 ms

ar.			172800	IN	NS	a.dns.ar.
ar.			172800	IN	NS	b.dns.ar.
ar.			172800	IN	NS	c.dns.ar.
ar.			172800	IN	NS	d.dns.ar.
ar.			172800	IN	NS	e.dns.ar.
ar.			172800	IN	NS	f.dns.ar.
ar.			172800	IN	NS	ar.cctld.authdns.ripe.net.
ar.			86400	IN	DS	19606 8 2 4415CF1A2CF10DE94B92BC020F21D1BF4163B2E90F2A6F6A5D2A1740 339D566C
ar.			86400	IN	RRSIG	DS 8 1 86400 20220425170000 20220412160000 47671 . QTI3bZ7WtqWCwuKFMADbYVtp3qoJHkX0JBDmV6W971ASu+sCZUGEmwZt BnX1A9VYh16gCxaOkZyc6N2ALN74zTFCH1c8Jj5Ih/O5aGvEwNmXjU+E Hx6H3khHaB5wvH+qiTSZkCZ1L9xWGMRKTm6EMNen3WgipJZXgTwwxTwb rBUuJA0ElBognWG692M+CdG6CArfs0appXUCHgtjqbG77vVQZ7+AV1TJ X9ih7nVZirc/k4Y4ZlZM90H0lTDUQcpMg0ZWucfkFjROuR84li49ftdX tlZY2Atoh1X572OmJJ2+8j4+BlyYqFmKtiyS0lSnBrkuuAA78KP7JREA w5IiiQ==
;; Received 833 bytes from 199.7.83.42#53(l.root-servers.net) in 207 ms

edu.ar.			86400	IN	NS	noc.uncu.edu.ar.
edu.ar.			86400	IN	NS	ns2.switch.ch.
edu.ar.			86400	IN	NS	unlp.unlp.edu.ar.
edu.ar.			86400	IN	NS	a.riu.edu.ar.
edu.ar.			86400	IN	NS	ns1.uba.ar.
edu.ar.			86400	IN	NS	b.riu.edu.ar.
edu.ar.			86400	IN	DS	18482 8 1 4FC686BDBC94E2A5200A9205F836B8DE50AEB390
edu.ar.			86400	IN	RRSIG	DS 8 2 86400 20220512201117 20220412201117 14574 ar. hbDs7tbKgXI+myKh2fHXd/AsGSP6NEKNP1T4ypgXIdyhWlzh6XGEqdQ0 yg5moBkCOmb+lCz5PW3+VCGXh7X6zH5Qqmpu3XYiLcd6kK5XzoFWMW0f E1ThJ53B6z6o4UV8LLw7p5PACz+qEfMiGJGKXnNehs8XU64AtJM93AGp FkMu5d4XS6J+oaSg5G6ujdqDQS9IPOIFYlr9qy1/M0Q56hg+CoNq6azY NL79Tk7JybSYRWrN0o7MrnvXQpoqe1XQlzvLwbspMixHcap9igmc1cEP Z52tqbSdYVHDBKQgWcvKeKMFnged0oBcSQfAHrqj5PoTvPylZE9KnNX3 4LaU8g==
;; Received 757 bytes from 170.238.66.50#53(e.dns.ar) in 43 ms

itba.edu.ar.		3600	IN	NS	ns-90.awsdns-11.com.
itba.edu.ar.		3600	IN	NS	ns-888.awsdns-47.net.
itba.edu.ar.		3600	IN	NS	ns-1287.awsdns-32.org.
h56jplii07a3fhfpk5ju741na0bs73r1.edu.ar. 3600 IN NSEC3 1 0 5 82C16E104812F7FA H589JA50098HKJ5QFM32MTNEFOII983D NS
h56jplii07a3fhfpk5ju741na0bs73r1.edu.ar. 3600 IN RRSIG NSEC3 8 3 3600 20220511202805 20220410190001 17488 edu.ar. bbz/rZltfdRz21dKTUcYXkcHMeGJkHx9qTExex60kpM+E1t9XKTCJewL 9PaBUDQwNkhgZMqPYnTfKNVyfwaUFpxFUEczxI9sD6tLMVeL4LMgMXOb 5+QiPAloz07urwwDBSSqlFlhdv7PIRfDeh5tx4Zmbg8r+yvNur864cLU p5w=
;; Received 401 bytes from 170.210.2.97#53(noc.uncu.edu.ar) in 147 ms

it.itba.edu.ar.		60	IN	NS	crystal.it.itba.edu.ar.
;; Received 89 bytes from 205.251.197.7#53(ns-1287.awsdns-32.org) in 47 ms

pampero.it.itba.edu.ar.	3600	IN	A	200.5.121.137
it.itba.edu.ar.		3600	IN	NS	crystal.it.itba.edu.ar.
;; Received 133 bytes from 10.16.1.103#53(crystal.it.itba.edu.ar) in 11 ms
```

Podemos ver que para obtener nuestra ip tiene que pasar por:

```
. (l.root-servers.net) => 
ar (e.dns.ar) => 
edu.ar (noc.uncu.edu.ar) => 
it.itba.edu.ar (ns-1287.awsdns-32.org) =>
pampero.it.itba.edu.ar (crystal.it.itba.edu.ar)
```

## 43

>dig tiene una opción trace. ¿para qué sirve dicha opción? Contrastar su resultado con el punto anterior.

No me digas…

## 44

> Utilizar whois para obtener información de los dominios: `clarin.com`, `google.com`, `facebook.com`, `lanacion.com.ar`, `itba.edu.ar`, `apple.com`.

```bash
$ whois apple.com
mil cosas
$ whois facebook.com
mil cosas
$ whois clarin.com
mil cosas
```

## 45

> Realizar los cambios necesarios para que al ingresar en un User Agent HTTP (curl, Google Chrome, ...) a http://foo.pdc.lab, en realidad se acceda http://foo.leak.com.ar/ (no se debe ver modificada la URL en el browser). ¿Qué sucede y por qué?

Tengo que armar un reverse proxy normal usando Nginx. Para esto tengo que agregar a mi archivo de hosts `/etc/hosts`:

```hosts
127.0.0.1 foo.pdc.lab
```

 Luego tengo que crear una nueva configuración en Nginx `/etc/nginx/sites-enabled/foo.pdc.lab`:

```nginx
server {
# Listens on IPv4 on port 80
        listen 80;
# Host name
        server_name foo.pdc.lab;
# Set place for access log
        access_log /var/log/nginx/foo.pbc.lab_access.log;
# Set place for error log
        error_log /var/log/nginx/foo.pbc.lab_error.log;
# reverse proxy setup
        location / {
                proxy_pass      http://foo.leak.com.ar;
        }
}
```

Que indique que tiene que enviar, mediante un reverse proxy, a todo el trafico que vaya al host `foo.pdc.lab` a la url http://foo.leak.com.ar/.

Por ultimo tengo que reiniciar Nginx:

```bash
$ sudo service nginx restart
$ curl -v foo.pdc.lab
*   Trying 127.0.0.1:80...
* TCP_NODELAY set
* Connected to foo.pdc.lab (127.0.0.1) port 80 (#0)
> GET / HTTP/1.1
> Host: foo.pdc.lab
> User-Agent: curl/7.68.0
> Accept: */*
>
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< Server: nginx/1.18.0 (Ubuntu)
< Date: Tue, 12 Apr 2022 21:57:58 GMT
< Content-Type: text/html
< Content-Length: 12
< Connection: keep-alive
< x-amz-id-2: mTChwciRfNJ3iTD07oFUbHoXKTIunJTSqFm3fkm24TRYqoUNET+MMMsqvUFrhwV0tWay2YgYHeI=
< x-amz-request-id: WATS2J1ZAN5GD443
< Last-Modified: Tue, 23 Aug 2016 00:13:08 GMT
< ETag: "bd363b1d3c4272fe93618c8fdac2435a"
<
hola mundo!
* Connection #0 to host foo.pdc.lab left intact
```

## 46

> Suponga que en el ejercicio anterior se permite que la URL en el browser pueda ser modificada. ¿Puede encontrar otra solución?

Tengo que armar un reverse proxy normal usando Nginx. Para esto tengo que agregar a mi archivo de hosts `/etc/hosts`:

```hosts
127.0.0.1 bar.pdc.lab
```

 Luego tengo que crear una nueva configuración en Nginx `/etc/nginx/sites-enabled/foo.pdc.lab`:

```nginx
server {
# Listens on IPv4 on port 80
        listen 80;
# Host name
        server_name bar.pdc.lab;
# Set place for access log
        access_log /var/log/nginx/bar.pbc.lab_access.log;
# Set place for error log
        error_log /var/log/nginx/bar.pbc.lab_error.log;
# Send HTTP Response status 301 Redirect
  			return 301 http://foo.leak.com.ar;
}
```

Que indique que tiene que enviar, mediante un reverse proxy, a todo el trafico que vaya al host `foo.pdc.lab` a la url http://foo.leak.com.ar/.

Por ultimo tengo que reiniciar Nginx:

```bash
$ sudo service nginx restart
$ curl -v bar.pdc.lab
*   Trying 127.0.0.1:80...
* TCP_NODELAY set
* Connected to bar.pdc.lab (127.0.0.1) port 80 (#0)
> GET / HTTP/1.1
> Host: bar.pdc.lab
> User-Agent: curl/7.68.0
> Accept: */*
>
* Mark bundle as not supporting multiuse
< HTTP/1.1 301 Moved Permanently
< Server: nginx/1.18.0 (Ubuntu)
< Date: Tue, 12 Apr 2022 21:56:43 GMT
< Content-Type: text/html
< Content-Length: 178
< Connection: keep-alive
< Location: http://foo.leak.com.ar
<
<html>
<head><title>301 Moved Permanently</title></head>
<body>
<center><h1>301 Moved Permanently</h1></center>
<hr><center>nginx/1.18.0 (Ubuntu)</center>
</body>
</html>
* Connection #0 to host bar.pdc.lab left intact
```

# DNS Server

> Se quiere configurar un servidor DNS que sea autoridad de la zona foo.pdc.lab. Dicha zona deberá mantener nombres para su host y algunos otros hosts de la red en la que se encuentra. Configurar también un alias para cada uno de estos hosts.

## 48

> De existir, borrar los archivos `/etc/named.caching-server.conf`, `/var/named/chroot/etc/named.caching-server.conf`.

```bash
$ sudo rm /etc/named.caching-server.conf /var/named/chroot/etc/named.caching-server.conf
```

## 49

> Crear la zona correspondiente a su dominio (forward mapping zone y reverse zone). La configuración de named se encuentra en `/etc/bind`. Establezca una variedad de registros, con diferentes TTL.

```bash
# Ver si esta corriedo
# usando netstat, si esta corriendo en el puerto 53:
$ sudo netstat -nulp | grep 53

# usando los logs
$ tail -f /var/log/syslog | grep named
```

1. Agrego en el control panel de mi gestor de dominio (cloudflare en mi caso) los siguientes registros:

   ```
   local.lucasdellisola.com.ar IN NS ns.lucasdellisola.com.ar
   ns.lucasdellisola.com.ar IN A 192.168.64.4 [ip privada de la vm]
   ```

2. Pruebo que los cambios hayan funcionado:

   ```bash
   # Uso @ada.ns.cloudflare.com para no tener que esperar a que se propague
   $ dig -t NS local.lucasdellisola.com.ar @ada.ns.cloudflare.com
   ; <<>> DiG 9.16.1-Ubuntu <<>> -t NS local.lucasdellisola.com.ar @ada.ns.cloudflare.com
   ;; global options: +cmd
   ;; Got answer:
   ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 62217
   ;; flags: qr rd; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 2
   ;; WARNING: recursion requested but not available
   
   ;; OPT PSEUDOSECTION:
   ; EDNS: version: 0, flags:; udp: 1232
   ;; QUESTION SECTION:
   ;local.lucasdellisola.com.ar.	IN	NS
   
   ;; AUTHORITY SECTION:
   # Aca esta uno
   local.lucasdellisola.com.ar. 300 IN	NS	ns.lucasdellisola.com.ar.
   
   ;; ADDITIONAL SECTION:
   # Aca esta el otro
   ns.lucasdellisola.com.ar. 300	IN	A	192.168.64.4
   
   ;; Query time: 24 msec
   ;; SERVER: 108.162.192.54#53(108.162.192.54)
   ;; WHEN: Sat Apr 16 15:54:17 UTC 2022
   ;; MSG SIZE  rcvd: 89
   ```

3. Modificamos el archivo `/etc/bind/named.conf` y agregamos la siguiente zona, especificando que es un nodo maestro y le indicamos un archivo de configuración:

   ```
   zone "local.lucasdellisola.com.ar" {
           type master;
           file "/etc/bind/lucas.local";
   };
   ```

4. Creamos el archivo `/etc/bind/lucas.local` y agregamos lo siguiente:

   ```
   ; Macro que aplica el TTL para todos los registros
   $TTL 604801
   local.lucasdellisola.com.ar.    IN      SOA     ns.lucasdellisola.com.ar.       me.lucasdellisola.com.ar (
                           1               ; serial cambia cuando se actualiza el registro
                           604800          ; refresh para slave nodes
                           86400           ; expire para slave nodes
                           60              ; expire para slave nodes???
                           60)             ; Negative Cache TTL para cuando se busca algo en esta zona que no existe
   ; Necesario para que bind funcione
   @                               IN      NS ns.lucasdellisola.com.ar.
   ;
   ; Son lo mismo, solo que el segindp tiene un TTL de 60 segundos
   ; ZONE                                  TTL     IN      TYPE    ADDRESS
   www.local.lucasdellisola.com.ar.                IN      A       1.2.3.4
   www                                             IN      A       1.2.3.4
   @                                               IN      A       1.2.3.4
   ```

5. Podemos reiniciar `Bind9` y cargar los cambios:

   ```bash
   $ sudo systemctl restart bind9
   ```

   Y podemos ver que se cargaron nuestros registros en los logs:

   ```bash
   $ tail -f /var/log/syslog | grep named
   ...
   Apr 16 16:15:07 protos named[3460]: zone local.lucasdellisola.com.ar/IN: loaded serial 2
   ...
   ```

6. Para verificar que todo esta funcionando, desde una maquina en la red local puedo hacer llamadas de dig:

   ```bash
   $ dig -t A www.local.lucasdellisola.com.ar @192.168.64.4
   
   ; <<>> DiG 9.16.1-Ubuntu <<>> -t A www.local.lucasdellisola.com.ar @192.168.64.4
   ;; global options: +cmd
   ;; Got answer:
   ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 5707
   ;; flags: qr aa rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1
   
   ;; OPT PSEUDOSECTION:
   ; EDNS: version: 0, flags:; udp: 4096
   ; COOKIE: d486b367f87441be01000000625aeba02297be1b3a5baa36 (good)
   ;; QUESTION SECTION:
   ;www.local.lucasdellisola.com.ar. IN	A
   
   ;; ANSWER SECTION:
   www.local.lucasdellisola.com.ar. 604801	IN A	1.2.3.4
   www.local.lucasdellisola.com.ar. 604801	IN A	2.3.4.5
   
   ;; Query time: 0 msec
   ;; SERVER: 192.168.64.4#53(192.168.64.4)
   ;; WHEN: Sat Apr 16 16:15:28 UTC 2022
   ;; MSG SIZE  rcvd: 120
   
   $ dig +trace  www.local.lucasdellisola.com.ar @192.168.64.4
   
   ; <<>> DiG 9.16.1-Ubuntu <<>> +trace www.local.lucasdellisola.com.ar @192.168.64.4
   ;; global options: +cmd
   .			518297	IN	NS	k.root-servers.net.
   .			518297	IN	NS	h.root-servers.net.
   .			518297	IN	NS	j.root-servers.net.
   .			518297	IN	NS	l.root-servers.net.
   .			518297	IN	NS	b.root-servers.net.
   .			518297	IN	NS	e.root-servers.net.
   .			518297	IN	NS	c.root-servers.net.
   .			518297	IN	NS	f.root-servers.net.
   .			518297	IN	NS	d.root-servers.net.
   .			518297	IN	NS	i.root-servers.net.
   .			518297	IN	NS	a.root-servers.net.
   .			518297	IN	NS	g.root-servers.net.
   .			518297	IN	NS	m.root-servers.net.
   .			518297	IN	RRSIG	NS 8 0 518400 20220429050000 20220416040000 47671 . INwdaKeKaaHm6gySfe+TUW5wbJXulUVV9hgPH40L5awP6p9eFFaxkLjA iB9IiAr9S34iXpC6TbNzS2gAufLwWjVsc2TOpRPzHWCIyK0vomuWMXJW ieZQg6KA1w1gxum1eM0svp1BUdrkuBe2JScGYrzvrjXbhC/UZOKzliOI MGHfWeDPNGpcQDLTUUVED5dmQsJDbuWGq8htJUgT62JY20fZSKr55fgt r/tNmkwRUoldLwF+7JYhWi0VPhaSKm4Af5Dh5mFcRXCKgzWkgVBtoEQQ TxU2oeTTK6kDV/EglBCnwYorJU31KA5F/EhWws6QTU5kx7uYzZ9Mis/r +zmXog==
   ;; Received 1137 bytes from 192.168.64.4#53(192.168.64.4) in 0 ms
   
   ar.			172800	IN	NS	e.dns.ar.
   ar.			172800	IN	NS	d.dns.ar.
   ar.			172800	IN	NS	b.dns.ar.
   ar.			172800	IN	NS	c.dns.ar.
   ar.			172800	IN	NS	a.dns.ar.
   ar.			172800	IN	NS	ar.cctld.authdns.ripe.net.
   ar.			172800	IN	NS	f.dns.ar.
   ar.			86400	IN	DS	19606 8 2 4415CF1A2CF10DE94B92BC020F21D1BF4163B2E90F2A6F6A5D2A1740 339D566C
   ar.			86400	IN	RRSIG	DS 8 1 86400 20220429050000 20220416040000 47671 . NT7oPe2cgmHq7bkeOUtVYgjGkYmkH5NODxQZp/lvN7lQo7JbzI+VHwDN Fd4XDVn7v26qk9Vp2u55KRqx7dhl8e+L2nzNLqB504eHsoYBjrrAvZjI qU983sdonkfWp2Xt4O9W9gEV19MXUnzYpaCazPI7e+SLoTN/IVUDRC5f /aP2cHZggqHu24W6zgQAHGox6c4Bl+i1YKdUGM1tb5UmhR8+DRglB7fF NTNKHGDOsotwVgqvrJyo57k2bPhrgGDG8yU0fsThc3D1O59TzaXSDWBf xIihPMmUKlzp4SR9ECx+0QpqMIpMriLDymlPlKzYxhLjpWhTwWGg4MGi ueYTpw==
   ;; Received 842 bytes from 2001:dc3::35#53(m.root-servers.net) in 204 ms
   
   lucasdellisola.com.ar.	3600	IN	NS	jihoon.ns.cloudflare.com.
   lucasdellisola.com.ar.	3600	IN	NS	ada.ns.cloudflare.com.
   7HQTF6HDVVGCVBAVH3V8E0GUM8VAKO81.com.ar. 86400 IN NSEC3	1 1 10 - TADHPFPSJTVD5FN4RK3PL48IE40HRQDF NS SOA RRSIG DNSKEY NSEC3PARAM
   7HQTF6HDVVGCVBAVH3V8E0GUM8VAKO81.com.ar. 86400 IN RRSIG	NSEC3 8 3 86400 20220516140933 20220416140933 6930 com.ar. Zy1u8ulyYEtpdiaS/6znGzCbOkzGhYwbupqhoECLSeXVtTTDqWw2qRfk oF/FEhMHUvNnfuslnBDTkhzwPKhZbnu7KVOLnYDZXMxp4VRWvHEksQhA UWBFy1pw7x6mauh0XFtMk7LfHlOmGmPyAZgVNWPWwgX0LkhtPYvl6J7v BnocAUctEM+gHAVkt7Y5tD9fXMm6xBhPy0uAN/wY7GIVlLemDtBnUI3n D8RalOc8C54kGjGQaJ+dY1cEwYF9J2PeS9swmY5UUYw4kDEAtBZ6TGFQ ak3zoRL4FpJxPeoIEUepm5zl2G6qzd7+Nw5Frd/ZaD8qnQWqmI2s3lpt KiSCEA==
   ;; Received 539 bytes from 2801:140:10::10#53(c.dns.ar) in 184 ms
   
   local.lucasdellisola.com.ar. 300 IN	NS	ns.lucasdellisola.com.ar.
   ;; Received 93 bytes from 2a06:98c1:50::ac40:23e9#53(jihoon.ns.cloudflare.com) in 24 ms
   
   www.local.lucasdellisola.com.ar. 604801	IN A	2.3.4.5
   www.local.lucasdellisola.com.ar. 604801	IN A	1.2.3.4
   local.lucasdellisola.com.ar. 604801 IN	NS	ns.lucasdellisola.com.ar.
   ;; Received 158 bytes from 192.168.64.4#53(ns.lucasdellisola.com.ar) in 0 ms
   ```

## 50

> Indicarle al daemon que reinicie. Observar el mensaje almacenado en el log, elaborar conclusiones en base al mismo.

Cuando se reinicia el daemon, se lee los archivos de configuracion y se van cargando las zonas, una a la vez. Si una de estas falla, el proceso continuan solo dejando un log de error.



## 51

> Comprobar usando las utilidades `dig`, `host` y `nslookup` que su dominio esté configurado correctamente.

```bash
$ dig -t A www.local.lucasdellisola.com.ar @192.168.64.4

; <<>> DiG 9.16.1-Ubuntu <<>> -t A www.local.lucasdellisola.com.ar @192.168.64.4
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 5707
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
; COOKIE: d486b367f87441be01000000625aeba02297be1b3a5baa36 (good)
;; QUESTION SECTION:
;www.local.lucasdellisola.com.ar. IN	A

;; ANSWER SECTION:
www.local.lucasdellisola.com.ar. 604801	IN A	1.2.3.4
www.local.lucasdellisola.com.ar. 604801	IN A	2.3.4.5

;; Query time: 0 msec
;; SERVER: 192.168.64.4#53(192.168.64.4)
;; WHEN: Sat Apr 16 16:15:28 UTC 2022
;; MSG SIZE  rcvd: 120

$ host www.local.lucasdellisola.com.ar 192.168.64.4

Using domain server:
Name: 192.168.64.4
Address: 192.168.64.4#53
Aliases:

www.local.lucasdellisola.com.ar has address 1.2.3.4
www.local.lucasdellisola.com.ar has address 2.3.4.5

$ nslookup local.lucasdellisola.com.ar 192.168.64.4
Server:		192.168.64.4
Address:	192.168.64.4#53

Name:	local.lucasdellisola.com.ar
Address: 3.4.5.6
```

## 52

> Asegurarse que su host esté utilizando al servidor DNS configurado como su servidor DNS primario

???

## 53

> Investigar en named que son los forwarders. Sniffear paquetes haciendo uso y sin hacer uso de forwarders para ver los paquetes que generan el servidor DNS cuando le hacen consultas.

DNS Forwarding es un modo de operación de los servidores DNS donde el servidor en si nunca va a resolver una query DNS, sino que va a enviar las queries a otros servidores y va a guardar el resultado en una cache. Si se require de vuelta hacer la misma query, entonces va a devolver el resultado guardado en vez de enviar la query a resolver de vuelta.

La ventaja de estos sistemas es que permiten operar con todas las ventajas del servidor DNS pero sin tener que implementar la lógica pesada.

Para implementar esto, hay que ir al archivo `/etc/bind/named.conf.options` y editarlo para agregar lo siguiente dentro del grupo `options`:

```
options {
	forwarders {
		1.1.1.1;
		8.8.8.8;
	};
	forward only;
};
```







