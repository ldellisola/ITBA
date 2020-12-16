# Sistemas de Archivos

## 1

Suponga un sistema de archivos que utiliza asignación de espacio enlazada. Los bloques de datos son de 1024 bytes y cada enlace ocupa 4 bytes dentro del bloque. Si un archivo tiene un tamaño de 1 MiB, ¿cuántos bloques de datos ocupa el archivo?



Como cada bloque tiene 1024 bytes asignados, pero dentro se ocupan siempre 4 para apuntar al próximo bloque, solo hay 1020 bytes disponibles por bloque para datos. Al mismo tiempo sabemos que 1MiB = 1.000.000 B, entonces con una simple división podemos obtener que se necesitan:
$$
\frac {1000000 B} {1020 B} =980.4 
$$
Como no puedo dejar un bloque a medio utilizar por un archivo y medio utilizar por otro, puedo redondearlo y decir que ocupara **981 bloques** el archivo.

## 2

**1**   Considere un archivo que ocupa 100 bloques de datos en el disco. Suponga que la entrada en directorio del archivo y su bloque de índices (si es el caso) ya se encuentran en memoria principal. Calcule cuántas operaciones de E/S de disco se requieren con las estrategias de asignación de espacio contigua, enlazada e indexada simple para cada una de las siguientes acciones:

1. Se añade un bloque al principio del archivo.

   <u>Espacio Contiguo:</u> Hay dos casos:

   1. Si hay lugar para un bloque al principio del archivo, seria cuestion de escribir la nueva posicion de memoria en el directorio e insertar un nuevo nodo con otra llamada de escritura, con un total de 2 operaciones.
   2. Si no hay lugar al principio del archivo, seria cuestion de modificar la entrada del primer bloque en el directorio. Luego tenemos que copiar los 100 nodos a un lugar donde haya espacio para 101 nodos y crear el nuevo nodo. Esto causa que tengamos 100 operaciones de lectura + 100 operaciones de escritura + 1 operacion de escritura + 1 opreacion de escritura, dandonos un total de 202 operaciones.

   <u>Memoria Linkeada:</u> Requiere una operacion de escritura para crear el nodo y otra para modificar el directorio e indicarle la nueva direccion de memoria.

   <u>Memoria Indexeada:</u> Hago una operacion de escritura para crear al nuevo nodo y al menos una operacion para modificar la tabla de indices. Esto varia ya que depende de la cantidad de bloques que ocupe la tabla. Puedo mover varios indices de la tabla con una misma operacion por que estan en el mismo bloque.

2. Se añade un bloque en la mitad del archivo.

   <u>Espacio Contiguo:</u> Hay dos casos

   1. Si hay lugar al final del archivo para un bloque mas, serian 50 operaciones de lectura y 50 de escritura para poder copiar los ultimos nodos un bloque para abajo, y luego seria 1 instruccion de escritura para crear al nuevo nodo, siendo en total 101 operaciones.
   2. Si no hay lugar al final del archivo, entonces serian 202 operaciones como el caso anterior.

   <u>Memoria Linkeada:</u> Se requiere 50 lecturas para poder llegar al nodo 50, luego dos de escritura, una para modificar el puntero del nodo 49 al nuevo ingresado y otra para crear el nuevo nodo.

   <u>Memoria Indexeada:</u>

3. Se añade un bloque al final del archivo.

   <u>Espacio Contiguo:</u> Hay dos casos:

   1. Si hay lugar para agregar un bloque al final es cuestion de crear un nuevo nodo con una operacion de escritura.
   2. Si no hay lugar para agregar un nuevo bloque, entonces caigo en el mismo caso de antes.

   <u>Memoria Linkeada:</u> Se requieren 100 lecturas para llegar al ultimo nodo y luego dos escrituras, una para crear al nuevo nodo y otra para modificar al puntero del nodo 100.

   <u>Memoria Indexeada:</u>

4. Se elimina el primer bloque del archivo.

   <u>Espacio Contiguo:</u> Requiere una escritura ya que solo hay que cambiar el directorio para que el puntero apunte a la nueva posicion.

   <u>Memoria Linkeada:</u> Se requiere una lectura del primer nodo para obtener el puntero al segundo nodo. y una escritura para modificar el directorio y que apunte a esta direccion que obtivumos.

   <u>Memoria Indexeada:</u>

5. Se elimina un bloque en la mitad del archivo.

   <u>Espacio Contiguo:</u> Tengo que correr todo el archivo para arriba, entonces voy a tener 50 operaciones de lectura y 50 de escritura.

   <u>Memoria Linkeada:</u> Se requieren 51 lecturas para llegar al nodo proximo al que quieremos eliminar y una escritura mediante la cual hacemos que el nodo 49 apunte al nodo 51.

   <u>Memoria Indexeada:</u>

6. Se elimina el último bloque del archivo.

   <u>Espacio Contiguo:</u> Solo tengo que modificar el directorio para cambiar la lognitud del archivo o cambiar el puntero al ultimo elemento.

   <u>Memoria Linkeada:</u> Se requieren 100 lecturas para llegar al ultimo nodo y una escritura para modificar al nodo 99 y que no apunte al ultimo nodo.

   <u>Memoria Indexeada:</u>

















