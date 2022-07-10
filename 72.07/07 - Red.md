# Red

<img src="Resources/07 - Red/Screen Shot 2022-05-13 at 16.53.10.jpg" alt="Screen Shot 2022-05-13 at 16.53.10" style="zoom:50%;" />

Ambos servidores deben poseer un identificador o dirección que permita enviar paquetes entre ellos. Las direcciones de la capa de red utilizan un esquema de direccionamiento jerárquico que permita encontrar una ruta de forma eficiente.

La capa de red en general translada segmentos de un host a otro. Entre sus funciones estas:

- **Forwarding**: Mueve paquetes de un input del router a un output del router.
- **Routing**: Determinar la ruta que deben tomar los paquetes para llegar a destino.
- **Establecer conexión**: Antes de intercambiar datagramas, se establece un circuito virtual entre dos hosts.

## Servicios Ofrecidos por Protocolos de Red

Los protocolos de red mas conocidos son:

- **Protocolos de routeo**
- **Protocolo IP**
- **Protocolo ICMP**

Ademas, los protocolos de red pueden ofrecer:

- **Conmutación de paquetes (datagrama)**: Garantiza el delivery.
- **Circuito virtual**: Entrega los datagramas en orden y provee un ancho de banda mínimo.
- **Ambos**: Integridad de datos, encriptación, etc.

<img src="Resources/07 - Red/Screen Shot 2022-05-13 at 17.15.13.jpg" alt="Screen Shot 2022-05-13 at 17.15.13" style="zoom:50%;" />

### Circuitos Virtuales

Antes de poder enviar datos, es necesario establecer una conexión, llamada circuito virtual (CV). Luego, cada paquete va identificado con su CV y los routers a su vez mantiene el estado para cada CV.

Ademas, se pueden reservar recursos específicamente para un CV, como lo son ancho de banda o espacio en el buffer.

<img src="Resources/07 - Red/Screen Shot 2022-05-13 at 17.05.29.jpg" alt="Screen Shot 2022-05-13 at 17.05.29" style="zoom:50%;" />

Estos circuitos virtuales tienen 3 fases:

1. **Establecer la conexión**: Implica añadir una entrada a la tabla de ruteo, reservar recursos, etc.
2. **Transferencia de paquetes**.
3. **Cierre de conexión**.

### Conmutación de Paquetes

A diferencia de los circuitos virtuales, aquí se utilizan **datagram networks**. En estas redes no hay una llamada previa y no se establece una conexión. Los routers no conocen los estados y solo forwardear los paquetes en base a la dirección de destino.

<img src="Resources/07 - Red/Screen Shot 2022-05-13 at 17.12.15.jpg" alt="Screen Shot 2022-05-13 at 17.12.15" style="zoom:50%;" />

## Direccionamiento IPv4

Cada host en internet tiene una dirección IPv4. Esta permite a ls hosts de una red IP ser identificado unívocamente. Estas direcciones están formadas por 32 bits, escritos como 4 números separados por puntos. Ademas, cada IP consta de dos partes:

- **Network ID**
- **Host ID**

Siendo el Network ID común a todos los hosts que comparten la red.

Existen ,varias clases de IPv4, dentro de las principales se encuentran :

- **A**: Utiliza 7 bits para la red y 24 bits para el host.
- **B**: Utiliza 14 bits para la red y 16 para el host.
- **C**: Utliza 21 bits para la red y 8 para el host.

<img src="Resources/07 - Red/Screen Shot 2022-05-13 at 17.30.20.jpg" alt="Screen Shot 2022-05-13 at 17.30.20" style="zoom:50%;" />

### Datagrama IPv4

<img src="Resources/07 - Red/Screen Shot 2022-05-15 at 12.38.05.jpg" alt="Screen Shot 2022-05-15 at 12.38.05" style="zoom:50%;" />

Donde los parametros son:

- **Version**: Indica la version de IP que usa.
- **HLen**: Indica la longitud del header del datagrama, contado en conjuntos de 32 bits.
- **ToS**: Indica el nivel de importancia que se le ha asignado por un protocolo de capa superior en particular.
- **Longitud Total**: Indica la longitud del paquete IP, incluyendo el header y el cuerpo.
- **Identificación**: Contiene un número entero que identifica al diagrama actual.
- **Flags**: Es un campo de 3 bits que controlan la fragmentación.
- **Desplazamiento de Fragmento**: Se utiliza para reunir a los fragmentos de diagramas.
- **TTL**: Es un contador de la cantidad máxima de saltos de red que puede hacer el paquete. Con cada salto se decrementa el contador.
- **Protocolo**: Indica cual es el protocolo de la capa superior que recibe los paquetes entrantes.
- **Header Checksum**: Garantiza la integridad del encabezado IP.
- **Dirección de Origen**: Especifica el nodo emisor.
- **Dirección de Destino**: Especifica el nodo receptor.
- **Opciones**: Permite que el protocolo IP soporte opciones como seguridad.
- **Datos**: Contiene información de capa superior (hasta 64kb).
- **Relleno**: Se agregan 0s adicionales para garantizar que el encabezado IP siempre sea múltiplo de 32 bits.

## Superredes

Cuando se diseñaron las clases de direcciones IP no se pensaba en un gran crecimiento en la cantidad de redes. Eventualmente las direcciones de clase B se agotaban y para una sola organización no alcazaba con 1 direccional de clase C.

Por este motivo se reemplazo la clasificación en clases de IPs a los bloques CIDR. Con este nuevo protocolo, las IPs iban a ser identificadas por una dirección y una mascara. Otro problema que se soluciono con esta implementación era el tamaño de las tablas de routeo, que hasta este momento se asignaba una entrada por IP.

## Subredes

Es lo mismo que superredes, básicamente usas el direccionamiento para hacer redes mas chicas a partir de una red grande.

























