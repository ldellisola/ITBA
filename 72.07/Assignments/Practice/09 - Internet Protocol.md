# Internet Protocol

## 78

> Ejecutar el comando `traceroute www.google.com`. Analizando el tráfico generado por la herramienta y la información obtenida, explicar cómo determina la información que muestra.

```bash
$ traceroute www.google.com.ar
traceroute to www.google.com.ar (142.250.79.195), 64 hops max
  1   192.168.64.1  0.305ms  0.334ms  0.284ms
  2   10.9.71.254  5.033ms  3.828ms  4.418ms
  3   10.255.254.230  6.314ms  3.792ms  3.562ms
  4   209.13.133.6  5.845ms  4.046ms  4.529ms
  5   *  *  *
  6   *  *  *
  7   *  *  *
  8   *  *  *
  9   *  *  *
 10   *  *  *
 11   *  *  *
 12   *  *  *
 13   209.13.139.211  8.068ms  5.615ms  23.009ms
 14   209.13.139.209  6.865ms  5.441ms  21.304ms
 15   209.13.166.210  8.932ms  20.457ms  9.843ms
 16   200.32.34.125  13.985ms  14.351ms  19.919ms
 17   200.32.34.185  9.988ms  8.302ms  37.267ms
 18   200.32.33.122  9.466ms  11.185ms  8.480ms
 19   200.26.92.13  35.009ms  32.889ms  9.489ms
 20   72.14.220.19  7.381ms  5.913ms  6.964ms
 21   72.14.220.18  8.162ms  10.867ms  12.618ms
 22   *  *  *
 23   74.125.242.209  10.272ms  14.880ms  12.473ms
 24   74.125.242.216  7.824ms  8.872ms  10.504ms
 25   142.250.232.143  10.439ms  11.211ms  10.157ms
 26   209.85.240.69  45.002ms  42.412ms  40.020ms
 27   172.253.67.68  40.697ms  43.142ms  42.234ms
 28   108.170.245.129  40.658ms  39.249ms  40.557ms
 29   108.170.235.255  46.562ms  44.224ms  41.642ms
 30   142.250.79.195  39.682ms  39.188ms  39.363ms
```

## 79

> Repetir el ejercicio anterior pero con las opciones `-M icmp` y `-M udp`. Analizar si se producen cambios en la forma de determinar la ruta y conjeturar sobre las razones de existencia de estas estas opciones.

```bash
$ traceroute www.google.com.ar -M icmp
traceroute to www.google.com.ar (142.250.79.195), 64 hops max
  1   192.168.64.1  4.140ms  0.617ms  0.564ms
  2   10.9.71.254  8.477ms  5.789ms  63.570ms
  3   10.255.254.230  5.530ms  4.809ms  4.293ms
  4   209.13.133.6  18.594ms  26.662ms  72.564ms
  5   *  *  *
  6   *  *  *
  7   *  *  *
  8   *  *  *
  9   *  *  *
 10   *  *  *
 11   *  *  *
 12   *  *  *
 13   209.13.139.211  6.740ms  5.578ms  6.359ms
 14   209.13.139.209  5.120ms  6.436ms  5.109ms
 15   209.13.166.210  5.256ms  4.710ms  4.340ms
 16   200.32.34.125  6.997ms  6.102ms  17.560ms
 17   200.32.34.185  7.942ms  6.409ms  7.391ms
 18   200.32.33.90  5.288ms  6.446ms  10.229ms
 19   *  200.26.92.13  7.666ms  5.880ms
 20   72.14.220.19  5.992ms  7.301ms  7.410ms
 21   72.14.220.18  11.469ms  8.454ms  8.331ms
 22   142.250.62.79  8.607ms  10.506ms  7.946ms
 23   74.125.242.201  9.002ms  8.576ms  12.415ms
 24   108.170.227.118  11.597ms  45.093ms  23.623ms
 25   209.85.251.157  40.842ms  42.724ms  41.441ms
 26   142.250.227.230  39.624ms  40.580ms  41.447ms
 27   108.170.245.129  39.613ms  41.411ms  40.428ms
 28   108.170.235.255  44.158ms  58.455ms  43.714ms
 29   142.250.79.195  41.838ms  38.476ms  39.743ms
 
 $ traceroute www.google.com.ar -M udp
traceroute to www.google.com.ar (142.250.79.195), 64 hops max
  1   192.168.64.1  0.722ms  0.415ms  0.303ms
  2   10.9.71.254  30.923ms  8.603ms  9.391ms
  3   10.255.254.230  3.816ms  3.925ms  3.280ms
  4   209.13.133.6  5.895ms  6.440ms  15.208ms
  5   *  *  *
  6   *  *  *
  7   *  *  *
  8   *  *  *
  9   *  *  *
 10   *  *  *
 11   *  *  *
 12   *  *  *
 13   209.13.139.211  11.262ms  16.003ms  7.005ms
 14   209.13.139.209  4.478ms  5.044ms  6.035ms
 15   209.13.166.210  9.195ms  5.782ms  5.277ms
 16   200.32.34.125  7.163ms  7.568ms  7.309ms
 17   200.32.34.185  7.029ms  8.622ms  11.814ms
 18   200.32.34.45  7.654ms  8.449ms  8.067ms
 19   200.26.92.13  8.180ms  8.953ms  9.087ms
 20   72.14.220.19  7.774ms  7.390ms  8.918ms
 21   72.14.220.18  8.905ms  8.320ms  12.072ms
 22   *  *  *
 23   142.251.70.178  9.899ms  9.502ms  7.994ms
 24   172.253.53.19  26.156ms  16.554ms  26.046ms
 25   108.170.227.118  9.356ms  22.570ms  20.454ms
 26   209.85.240.69  45.283ms  46.557ms  43.381ms
 27   142.250.227.230  40.242ms  38.045ms  40.146ms
 28   108.170.245.161  42.704ms  44.964ms  45.718ms
 29   142.251.61.65  42.332ms  59.191ms  44.194ms
 30   142.250.79.195  57.742ms  71.185ms  45.795ms
```

Son distintos por que usan otro protocolo.

## 80

> Ejecutar el comando `traceroute www.google.com 4000`. Analizando el tráfico generado por la herramienta y la información obtenida responder los siguiente:
>
> - ¿Se fragmentaron los datagramas IPs?

Se puede ver que se fragmentaron. Para verificarlo me fijo en los flags.

==NO PUDE REPRODUCIRLO==

> - De generarse fragmentos ¿Cuantos fragmentos por datagrama? ¿Por qué se produjo la fragmentación?

2 fragmentos, el offset siempre esta en 0 y 185.

> - ¿Qué información en el header IP indica que se produjo fragmentación?

El flag.

## 81

> Se desea configurar los diferentes hosts R y H descriptos en la Figura 1, “Red a configurar”, para que tengan conectividad entre ellos

Primero conectamos a las maquinas. Para hacer esto configuro mis maquinas virtuales, poniendo su networking como Bridge.

Luego, en la computadora H, configuro la IP `192.168.10.2`:

```bash
$ sudo ip addr add 192.168.10.2/24 dev enp0s10
```

Y verifico que fue agregada por dos métodos distintos:

```bash
$ ifconfig -a
enp0s10: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.10.2  netmask 255.255.255.0  broadcast 0.0.0.0
        inet6 fe80::54e3:12ff:fec0:96c  prefixlen 64  scopeid 0x20<link>
        ether 56:e3:12:c0:09:6c  txqueuelen 1000  (Ethernet)
        RX packets 2887  bytes 749571 (749.5 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 50  bytes 7775 (7.7 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 731  bytes 53746 (53.7 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 731  bytes 53746 (53.7 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

```

```bash
$ route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.10.0    0.0.0.0         255.255.255.0   U     0      0        0 enp0s10

```

En la computadora R, hago lo mismo con la IP `192.168.10.1`.



