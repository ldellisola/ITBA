# DHCP

Cada host en una red debe tener una dirección. IP compatible con la red a la que pertenece, y a su vez dos hosts no pueden tener la misma dirección. Existen dos esquemas para la asignación de direcciones:

- **Direccionamiento estático**: Se configura la interface con una dirección IP y mascara de red fija.
- **Direccionamiento dinámico**: Automáticamente se le asignan IPs a los hosts. Hay dos modos de hacer esto:
  - **BOOTP**: Cuando un dispositivo se conecta a la red, este envía un mensaje broadcast con su numero MAC pidiendo una dirección IP, luego el servidor BOOTP le asigna una IP y le entrega mas datos de la red.
  - **DHCP**: Es un protocolo similar, pero hay más pasos involucrados y el dispositivo no tiene por qué conocer la IP del servidor DHCP.

El protocolo DHCP es el sucesor de BOOTP. En este nuevo protocolo el cliente no tiene que conocer la dirección del servidor DHCP y ademas de asignar de forma dinámica, se pueden asignar IPs estáticas.

El protocolo funciona de la siguiente manera:

<img src="Resources/08 - DHCP/Screen Shot 2022-05-16 at 14.56.31.jpg" alt="Screen Shot 2022-05-16 at 14.56.31" style="zoom:50%;" />

## DDNS

<img src="Resources/08 - DHCP/Screen Shot 2022-04-22 at 16.17.32.jpg" alt="Screen Shot 2022-04-22 at 16.17.32" style="zoom:50%;" />

Es para conectar a un dominio a una ip dinámica. Cada vez que esta cambia le comunico al servidor DNS del cambio. Los registros DNS deben tener un TTL muy bajo.

## NAT

<img src="Resources/08 - DHCP/Screen Shot 2022-04-22 at 16.18.28.jpg" alt="Screen Shot 2022-04-22 at 16.18.28" style="zoom:50%;" />

Mediante la NAT se permite otorgar solo una ip publica. Ademas esto permite otorgar cierta seguridad al limitar que puertos se abren en esa ip publica a cada computadora.

Esto es obligatorio para ipv4, pero no lo es para ipv6 aunque es recomendable activarla también.

Hay dos tipos de NAT, **DNAT** (destination NAT) y **SNAT** (source NAT).

En ambos casos hay que recalcular el hash del header al pasar por una NAT, ya que este es modificado.

### Port Forwarding

DNAT permite redireccionar las conexiones que llegan a una ip publica en un puerto (o varios) especifico a una ip privada (o mas). 

Un ejemplo de esto seria load balancing, donde mas de una computadora puede recibir paquetes para cumplir con el mismo servicio.

<img src="Resources/08 - DHCP/Screen Shot 2022-04-22 at 16.27.06.jpg" alt="Screen Shot 2022-04-22 at 16.27.06" style="zoom:50%;" />

Se puede filtrar el trafico ademas por el protocolo, eligiendo entre TCP, UDP y ambos.

Otra forma de solucionar este problema seria con **UPnP** Internet Gateway Device (IGD), que le permite al host dentro de la NAT aprender su propia IP y agregar o remover los puertos abiertos. También se lo conoce como **port triggering**

<img src="Resources/08 - DHCP/Screen Shot 2022-04-22 at 16.31.59.jpg" alt="Screen Shot 2022-04-22 at 16.31.59" style="zoom:50%;" />

## Relay

En los casos donde no se pueden abrir puertos, hay servidores que se pueden configurar como “relay”. Esto significa que el servicio no tiene que conocer tu ip directamente, ya que no puede acceder. En cambio, tanto el cliente como el servicio pueden conectarse a este servidor y conectarse por ahi.

<img src="Resources/08 - DHCP/Screen Shot 2022-04-22 at 16.35.11.jpg" alt="Screen Shot 2022-04-22 at 16.35.11" style="zoom:50%;" />

Esta solución simula ser punto a punto y es mucho más lento que abrir puertos.

## ICMP

IP no maneja errores ni transmisiones, para esto esta el protocolo ICMP. Este protocolo es genérico y tiene muchos usos. Cada paquete tiene la forma de:

<img src="Resources/08 - DHCP/Screen Shot 2022-04-22 at 16.40.21.jpg" alt="Screen Shot 2022-04-22 at 16.40.21" style="zoom:50%;" />

Luego, los valores pueden ser:

<img src="Resources/08 - DHCP/Screen Shot 2022-04-22 at 16.41.04.jpg" alt="Screen Shot 2022-04-22 at 16.41.04" style="zoom:50%;" />

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