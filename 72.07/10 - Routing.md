# Protocolos de Routing

Routing permite que el trafico de una red pueda ser enviado hacia otra red en cualquier parte del mundo. Hay que diferenciar dos conceptos:

- **Routing o Forwarding**: Es el acto de reenviar paquetes a un host basado en la información almacenada en las tablas de routeo.
- **Protocolos de Routing**: Son programas que intercambian información entre routers para construir las tablas de routeo.

Dentro de los protocolos de routing, hay 3 categorías:

- **Routing minimo**: Una red aislada de otras redes TCP/IP.
- **Routing Estático**: La tabla de routeo esta construida por un administrador de forma estática.
- **Routing Dinámico**: La tabla de routeo es construida en base a información intercambiada por protocolos de routing.

## Routing Dinamico

Dentro de los protocolos de routing, tenemos a los siguientes:

- **Routing interno (IGP)**: Son diseñados para una red controlada por una sola organización. Los mas usados son RIP y OSPF.
- **Routing Externo (EGP)**: Son diseñados para intercambiar información entre redes controladas por distintas organizaciones. Se usa BGP.

<img src="Resources/10 - Routing/Screen Shot 2022-05-16 at 16.06.40.jpg" alt="Screen Shot 2022-05-16 at 16.06.40" style="zoom:50%;" />

Estos protocolos operan sobre distintas capas:

- BGP opera sobre TCP.
- RIP opera sobre UDP.
- OSPF, PIM, EIGRP operan sobre IP.
- IS-IS opera sobre protocolos a nivel de enlace.

Estos algoritmos suelen utilizar algoritmos adaptativos para encontrar el mejor camino entre el nodo inicial y de destino. Estos algoritmos pueden ser:

- **Distance Vector**: Con este algoritmo, los routers comunican periódicamente enviando su tabla de enrutamiento, donde se indica a que cantidad de saltos se encuentran los otros routers la red. Luego de varios intercambios, cada router debería tener una tabla completa con la cantidad de saltos que requiere para llegar a cada nodo.

  <img src="Resources/10 - Routing/Screen Shot 2022-05-16 at 16.21.27.jpg" alt="Screen Shot 2022-05-16 at 16.21.27" style="zoom:50%;" />

  Este método tiene varios problemas, uno de ellos es contar hasta infinito, esto se soluciona de tres formas distintas:

  - **Split Horizon** no le reenvío al vecino la tabla que me envío.
  - **Ruta Envenenada**: Puedo reenviar los datos que me envía un vecino pero las distancias las tengo que cambiar por infinito, para no actualizar las distancias del vecino.
  - **Bad News First**: Si un router detecta un problema en el vinculo, envía de forma inmediata esa entrada *“envenenada”*.

- **Dijkstra**

- **Flooding**

- **Hot Potato**

- **Link State**: En este algoritmo, cada router recibe del resto de los routers información sobre sus vecinos. En base a ella arma un grafo de la red y calcula los caminos más cortos. Cada router debe hacer lo siguiente:

  1. Descubrir a sus vecinos.
  2. Medir la distancia a cada vecino.
  3. Construir un paquete con lo que sabe.
  4. Enviar el paquete a todos los routers de la red.
  5. Calcular el camino más corto a cada router.

### RIP

Llamado Routing Information Protocol, pertenece a la familia de distance vector. Selecciona una ruta en base a la cantidad de saltos a usar para llegar al destino. Este protocolo es simple de configurar y funciona bien en redes pequeñas.

En Linux, esta implementado en el servicio `routed`. Cuando se inicia el servicio, el cliente envía un pedido de actualización de routeo. Luego, cada router envía de forma periódica paquetes con información basada en su tabla de routeo. 

#### Versión 1

Esta versión del protocolo intercambia informacion con sus vecinos cada 30 segundos y esta limitado a un diámetro de red de 15 saltos. Los paquetes utilizados son del tipo broadcast y usan notación *classfull*. Ademas, los paquetes no tienen autenticación. 

<img src="Resources/10 - Routing/Screen Shot 2022-05-16 at 19.00.19.jpg" alt="Screen Shot 2022-05-16 at 19.00.19" style="zoom:50%;" />

#### Versión 2

Esta nueva versión tiene soporte para direcciones CIDR. Ademas realiza los updates con multicast y agrega autenticación, mientras que mantiene compatibilidad con la versión 1.

<img src="Resources/10 - Routing/Screen Shot 2022-05-16 at 19.04.37.jpg" alt="Screen Shot 2022-05-16 at 19.04.37" style="zoom:50%;" />

### OSPF

Este protocolo se llama Open Shortest Path First. Este también es un modelo jerárquico donde se intercambia información sobre sus vecinos con toda la red. Cuando se detecta un cambio en la topología, también se comparte información.

Cada enlace puede tener un peso asignado y luego cada router construye un grafo de la red y utiliza Dijkstra para construir el camino más corto.

<img src="Resources/10 - Routing/Screen Shot 2022-05-16 at 19.15.01.jpg" alt="Screen Shot 2022-05-16 at 19.15.01" style="zoom:50%;" />

Ademas, se pueden definir áreas, que son colecciones interconectadas de redes. Cada área intercambia información con otras áreas a través de un router de borde.

Todas las áreas están conectadas con el área cero y los routers del borde resumen la información de las redes de un área. Esto reduce las entradas en las tablas de routeo y el impacto por los cambios de topología localizados.

Todo esto esta implementado en el servicio `gated` de linux. Este servicio ademas soporta múltiples protocolos como RIP y BGP.





















