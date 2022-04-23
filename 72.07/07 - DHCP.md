# DHCP

==falta==

## DDNS

<img src="Resources/07 - DHCP/Screen Shot 2022-04-22 at 16.17.32.jpg" alt="Screen Shot 2022-04-22 at 16.17.32" style="zoom:50%;" />

Es para conectar a un dominio a una ip dinámica. Cada vez que esta cambia le comunico al servidor DNS del cambio. Los registros DNS deben tener un TTL muy bajo.

## NAT

<img src="Resources/07 - DHCP/Screen Shot 2022-04-22 at 16.18.28.jpg" alt="Screen Shot 2022-04-22 at 16.18.28" style="zoom:50%;" />

Mediante la NAT se permite otorgar solo una ip publica. Ademas esto permite otorgar cierta seguridad al limitar que puertos se abren en esa ip publica a cada computadora.

Esto es obligatorio para ipv4, pero no lo es para ipv6 aunque es recomendable activarla también.

Hay dos tipos de NAT, **DNAT** (destination NAT) y **SNAT** (source NAT).

En ambos casos hay que recalcar el hash del header al pasar por una NAT, ya que este es modificado.

### Port Forwarding

DNAT permite redireccionar las conexiones que llegan a una ip publica en un puerto (o varios) especifico a una ip privada (o mas). 

Un ejemplo de esto seria load balancing, donde mas de una computadora puede recibir paquetes para cumplir con el mismo servicio.

<img src="Resources/07 - DHCP/Screen Shot 2022-04-22 at 16.27.06.jpg" alt="Screen Shot 2022-04-22 at 16.27.06" style="zoom:50%;" />

Se puede filtrar el trafico ademas por el protocolo, eligiendo entre TCP, UDP y ambos.

Otra forma de solucionar este problema seria con **UPnP** Internet Gateway Device (IGD), que le permite al host dentro de la NAT aprender su propia IP y agregar o remover los puertos abiertos. También se lo conoce como **port triggering**

<img src="Resources/07 - DHCP/Screen Shot 2022-04-22 at 16.31.59.jpg" alt="Screen Shot 2022-04-22 at 16.31.59" style="zoom:50%;" />

## Relay

En los casos donde no se pueden abrir puertos, hay servidores que se pueden configurar como “relay”. Esto significa que el servicio no tiene que conocer tu ip directamente, ya que no puede acceder. En cambio, tanto el cliente como el servicio pueden conectarse a este servidor y conectarse por ahi.

<img src="Resources/07 - DHCP/Screen Shot 2022-04-22 at 16.35.11.jpg" alt="Screen Shot 2022-04-22 at 16.35.11" style="zoom:50%;" />

Esta solución simula ser punto a punto y es mucho más lento que abrir puertos.

## ICMP

IP no maneja errores ni transmisiones, para esto esta el protocolo ICMP. Este protocolo es genérico y tiene muchos usos. Cada paquete tiene la forma de:

<img src="Resources/07 - DHCP/Screen Shot 2022-04-22 at 16.40.21.jpg" alt="Screen Shot 2022-04-22 at 16.40.21" style="zoom:50%;" />

Luego, los valores pueden ser:

<img src="Resources/07 - DHCP/Screen Shot 2022-04-22 at 16.41.04.jpg" alt="Screen Shot 2022-04-22 at 16.41.04" style="zoom:50%;" />

En los casos donde sucede algún error, se guarda toda esta información directamente en el campo de data, en vez de usar los headers. Es el trabajo del sistema operativo entregar este error a la aplicación que lo haya causado.

## Utilidades de networking

### Ping

```bash
$ ping ip
$ ping -c1 ip -r
# muesta las ips de los routers por los cuales el paquete pasa.
```

### Traceroute

```bash
$ traceroute ip/domain
```

Trata de alcanzar al host de destino, pero informa cada router por el que va pasando. Esto lo hace mandando ICMP echo request, pero el primero con un TTL de 1 salto, luego con 2 saltos, etc hasta 30 saltos (por defecto).

Esto es util cuando queremos detectar dónde muere un paquete o dónde se queda colgado.