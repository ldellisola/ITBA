# Red

## 1

> El protocolo IP ofrece a su capa superior: 
>
>  1. un servicio con conexión que se maneja internamente en forma de datagramas 
>    2. un servicio con conexión que internamente utiliza circuitos virtuales
>    3. un servicio sin conexión sin reconocimiento 
>    4. un servicio sin conexión con reconocimiento 
>    5. ninguna de las anteriores 

Un servicio sin conexión ni reconocimiento.

## 2

> ¿Cuál es la diferencia entre routing y forwarding?

forwarding: decisión que toma un host en base a su tabla de ruteo. En base a la IP destino determina por qué interfaz debe encaminarse. En caso de ser un host sin forwarding habilitado y un paquete IP no generado en el mismo host con un IP destino que no pertenece al mismo host, el mismo es descartado.

Routing: refiere al modo en que se crea la tabla de ruteo

## 3

> Considere enviar un datagrama de 3100 bytes a un enlace cuyo MTU es de 800 bytes. ¿Cuántos fragmentos se generan? 

Asumiendo que se usa UDP, IPv4 y Ethernet, tenemos que estos servicios ocupan las siguientes cantidades de bytes:

- UDP: 8 bytes
- IPv4: 20 bytes
- Ethernet: 24 bytes

Entonces, por cada paquete tenemos que reservar 52 bytes. Si restamos esto, el tamaño de cada fragmento va a ser 748 bytes como máximo:
$$
\left\lceil \frac{3100}{748}\right\rceil = 5
$$

## 4

> ¿Puede un host, cuya única IP es privada, enviar y recibir información de otro host cuya única IP es pública? Justificar

Si, siempre y cuando haya un router que haga NAT entre ambas redes.

## 5

> ¿Cuáles de las siguientes direcciones IP hace referencia a un ID de red de 24 bits, utilizando un prefijo de red de formato CIDR? 
>
>  1. 192.168.14.5/24 
>    2. 192.168.14.8/255.255.255.0 
>    3. 192.168.14.0/8 
>    4. 192.168.264.5/24 

Ninguna hace referencia a una red, ya que los últimos 8 bits deberían estar en 0, ademas de tener una mascara de 24 bits.

## 6

> ¿Cuáles de las siguientes direcciones IP corresponden a un host de la subred 192.168.15.16/28   `192.168.15.00010000`? 
>
>  1. 192.168.15.17  `192.168.15.00010001` SI
>     2. 192.168.15.14  `192.168.15.00001110` NO
>     3. 192.168.15.29  `192.168.15.00011101` SI
>     4. 192.168.15.16  `192.168.15.00010000` NO 
>     5. 192.168.15.31  `192.168.15.00011111` NO
>     6. 192.168.15.15 `192.168.15.00001111` NO

Básicamente, todas las IPs cuyos último numero este entre 17 y 30.

## 7

> Marcar la respuesta correcta en cada caso 
>
> - La cantidad máxima de bits que se pueden usar en una red clase C para crear subredes es: 
>
>   1. 1 
> 
>   2. 4
> 
>   3. 6 
>
>   4. 7 
>
>   5. 8

La cantinad máxima es 6 bits. Esto viene a que las IP de clase C tienen 8 bits reservados para los hosts y cada subred debe tener como minimo 2 bits (para tener 2 hosts, dirección de red y broadcast). Entonces, solo quedan 6 bits para las subredes.

> - Con una dirección IP 204.211.19.162 y una máscara de subred 255.255.255.224, ¿cuántos bits se han utilizado para crear una subred? 
>
>   1. 1 
>
>   2. 2 
> 
>   3. 3 
> 
>   4. 4 

3 bits.

> - ¿Cuál es la máscara de subred para una dirección clase B si se han utilizado 4 bits para las subredes? 
>
>   1. 255.224.0.0 
>   2. 255.255.0.0 
>   3. 255.255.240.0 
>   4. 255.255.255.240 
>   5. Ninguna de las anteriores
>

La tercera opción, `255.255.240.0 `.

>  - Dada una dirección IP de un host y la máscara de red a la que pertenece, ¿qué operación lógica se debe efectuar entre ambas para obtener la dirección de red? 
>
>    1. OR 
>      2. AND 
>      3. XOR 
>      4. ninguna de las anteriores

AND

## 8

> Dada la dirección IP `192.15.205.7` y la máscara de red `255.255.252.0`, indique cuál es la dirección de red original y de qué clase es (A, B o C), cuál es la dirección de la superred a la que pertenece el  host y cuál es el número del host.

La mascara es `255.255.11111100.0`

La dirección de red original es `192.15.204.0 = 192.15.11001100.0`

`11000000.00001111.11001101.00000111` 

Como la dirección comienza con `110`, entonces puedo decir que es una dirección de clase C. 

La dirección de la superred es: `0.00001111.11001101.0`

La dirección del host es `0.0.0.00000111`

## 9

>  Se tiene una dirección clase C y se necesitan 10 subredes, con la mayor cantidad de hosts posibles en cada subred. ¿Cuál de las siguientes máscaras elige? 
>
>  1. 255.255.255.192 
>    2. 255.255.255.224 
>    3. 255.255.0.240 
>    4. 255.255.255.248 
>    5. 255.255.255.240 
>    6. Ninguna de ellas

Una red de tipo C tiene 8 bits asignados para hosts/subredes. Como necesitamos 10 subredes con la cantidad máxima de hosts cada una, tenemos que guardar 4 bits para representarlas. Esto nos va a dar hasta 16 redes, pero si elegimos menos bits, no entran las 10 redes pedidas.

Por esto, vamos a elegir a la opción 5: `255.255.255.240 ` 

## 10

> Sea una red clase C en base a la cual se crean subredes con máscara /28. ¿Cuál de las siguientes combinaciones son verdaderas? 
>
> 1. 30 redes con 6 hosts c/u
> 2. 6 redes con 20 hosts c/u
> 3. 8 redes con 32 hosts c/u
> 4. 32 redes con 18 hosts c/u
> 5. 14 redes con 14 hosts
> 6. 16 redes con 14 hosts
> 7. Ninguna de las anteriores es correcta

16 redes con 14 hosts

## 11

> ¿Cuál es la dirección de red de una subred con un host cuya dirección de IP es 172.16.210.0/22? 
>
>  1.  172.16.42.0 
>    2.  172.16.208.0 
>    3.  172.16.252.0 
>    4.  172.16.254.0

`110100|10`

`001010|10` NO

`110100|00` SI

`111111|00` NO

`111111|10` NO

`172.16.208.0`  es valida

## 12

>  A una organización se le asigna un rango de direcciones de red clase C. Indicar cuál o cuáles serían las direcciones de red CIDR que pertenezcan a esta organización si los rangos son: 
>
>  1. 192.16.0.0 a 192.16.7.0 
>    2. 192.16.0.0 a 192.16.2.0 
>    3. 192.16.0.0 a 192.16.9.0 

todas?























