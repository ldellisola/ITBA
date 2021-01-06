# File Systems

## 1

Tenemos un sistema de archivos tipo UNIX en el que para localizar los bloques de un archivo se utilizan <u>11 entradas directas</u>, <u>una entrada indirecta</u>, <u>una entrada doblemente indirecta y una entrada triple indirecta</u>. E<u>l tamaño de bloque es de 1KB (1024 bytes)</u> <u>y los enlaces a bloques son de 32 bits</u>. Para responder a las siguientes cuestiones, asuma que la información del inodo del archivo ya se encuentra en memoria principal.

1. En función de la información dada, ¿cuál es la longitud máxima que puede tener un fichero en este sistema? (se puede dar una estimación aproximada).

   Tenemos 11 bloques directos, que serian 11KB. 

   Como sabemos que los nodos son bloques tambien, entonces tienen un tama;o de 1KB. Si dividimos a esto por el tama;o de cada entrada (32 bits), podemos decir que cada nodo permite 256 entradas.

   Con la informacion anterior, podemos decir que la entrada indirecta nos permite obtener 256 KB adicionales, mientras que la entrada doblemente indirecta nos permite 64 MB, y por ultimo la entrada triple indirecta nos da unos adicionales 16GB.

   Teniendo en cuenta estos numeros, podemos decir que un programa puede pesar como mucho alrededor de 16GB.

2. Tenemos un fichero de 10 megabytes de longitud. ¿Cuántos bloques consume del sistema de archivos? (NOTA: 1 megabyte = 1024 KiB).

   Teniendo bloques de 1KB, podemos decir que nuestro archivo necesita 10240 bloques

   Sacando 11 bloques directos y 256 bloques indirectos, nos quedan 9973 bloques. Como en los bloques indirectos dobles podemos tener hasta ~65000 bloques, no hace falta usar bloques de direccionamiento indirecto triple.

   De los bloques de direccionamiento indirecto doble, vamos a usar  39 bloques, es decir tendriamos nuestro primer nodo doble que apunta a los 39 nodos, por lo que serian 40 bloques

   Entonces vamos a utilizar 10240 + 1 + 1 +39 = 10281 bloques.

3. Al fichero anterior le queremos modificar un byte situado en la posición 1.000.000, relativa al comienzo del fichero. ¿Cuántos accesos a bloques tenemos que realizar para completar la operación?

   Tenemos que acceder al primer MB, entonces vemos que tenemos que acceder a un bloque de los dirigidos doblemente indirectos. Entonces vamos a acceder al fichero, de ahi iremos al primer nodo de los indirectos doble (que contiene 256 nodos), de ahi tendriamos que acceder al nodo correspondiente (contiene 256 bloques) y por ultimo accederiamos al bloque que necesitamos.

   Entonces tendriamos 4 accesos

## 2

Tenemos un sistema de archivos tipo UNIX en el que para localizar los bloques de un archivo se utilizan <u>10 entradas directas, una entrada indirecta, una entrada doblemente indirecta y una entrada triple</u>. Los <u>bloques tienen un tamaño de 2 KB</u> y <u>el tamaño de los índices (direcciones de bloques de disco) es de 32 bits</u>. En este sistema, un programa UNIX crea un fichero y realiza sobre él una operación write() de 55 millones de bytes.

- ¿Cuántos bloques de disco ocupa ahora el fichero, incluyendo bloques de índices?

  Como cada bloque tiene 2048 bytes, entonces voy a escribir 26.856 bloques.

  Ocupo 10 bloques directos, 512 bloques indirectos y 26

- ¿Cuál es el tamaño máximo de un fichero en este sistema?

  Los nodos de indices tienen 512 entradas, entonces voy a tener:

  - 10 Bloques directos
  - 512 Bloques indirectos
  - 262.144 Bloques indirectos dobles
  - 134.217.728 Bloques indirectos triples

  En total tendria 134.480.134 bloques, es decir 256,5 GB aproximadamente

  Pero como el tama;o maximo de la direccion es de 32 bits, no puedo tener un archivo tan grande, y esto nos va a imponer el limite de tama;o en 4GB.

  ==PREGUNTAR==

- Si la gestión del espacio en disco fuera enlazada y el tamaño del disco fuera de 8Terabytes, con el mismo tamaño de bloque, ¿cuántos bloques de disco ocuparía el fichero anterior tras realizar las mismas operaciones?

- Si el sistema de archivos aquí descrito se emplea en un sistema informático donde el 99% de los ficheros tiene un tamaño aproximado de 24KBytes, ¿cuál de los dos sistemas de gestión de espacio en disco emplearía y por qué?