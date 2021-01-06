## 11

Se quiere dar formato a una memoria USB de <u>4 gigabytes</u> con un sistema de archivos que admite estos dos modelos de asignación de espacio:

- Indexado simple (un solo nivel)

- FAT. 

En ambos casos se trabaja con <u>enlaces de 16 bits</u> y con <u>bloques de datos de 64 KiB</u>. Para cada uno de los dos modelos planteados, calcule:

1. El tamaño máximo que puede llegar a tener un archivo. 

   - FAT:

     Con los datos anteriores podemos calcular cuantos bits de la dirección se utilizarían para offset del bloque y cuantos para la dirección del bloque. Como tenemos 16 bits para el offset del bloque, y nuestra dirección es de 32 bits, podemos decir que necesitamos solo los primeros 16 bits de la dirección, para identificar a cada bloque. Para simplificar cálculos vamos a utilizar el tamaño en Bytes, es decir 2B.

     Para calcular el tamaño máximo de un archivo, tenemos que saber la cantidad máxima de bloques a la que nuestra FAT puede referenciar. A diferencia del modo indexado simple, acá el tamaño de la tabla no esta limitado a un bloque. Sabiendo esto, podemos decir que la FAT va a poder referenciar como mucho a:
     $$
     2^{16} \text{ bloques}
     $$
     

     Entonces, si cada bloque tiene 64KB de espacio asignado, el tamaño máximo que debería poder tener debería ser:
     $$
     2^{16} \times 64KB = 4GB
     $$
     Pero, de ser así, no podríamos almacenar la FAT en memoria, ya que todo estaría consumido por la información del archivo, entonces a este valor hay que quitarle el tamaño que ocupa la tabla FAT.

     El espacio que ocupa la tabla FAT se puede calcular utilizando la cantidad de entradas que posee, multiplicado por el tamaño de cada entrada:
     $$
     2^{16} \times 2B = 128KB
     $$
     Entonces, nuestra respuesta real seria:
     $$
     4GB - 128KB = 4.194.176KB
     $$

   - Indexado Simple:

     Con los datos anteriores podemos calcular cuantos bits de la dirección se utilizarían para offset del bloque y cuantos para la dirección del bloque. Como tenemos 16 bits para el offset del bloque, y nuestra dirección es de 32 bits, podemos decir que necesitamos solo los primeros 16 bits de la dirección, para identificar a cada bloque. Para simplificar cálculos vamos a utilizar el tamaño en Bytes, es decir 2B.
     
     Como cada entrada ocupa 2B, y nuestros bloques son de 64KB, entonces calculo la cantidad de entradas que puedo apuntar desde el índice:
     $$
     \frac{64KB} {2B} = \frac{2^{16}B}{2B} = 32768 \text{ entradas}
     $$
     Entonces, cada tabla de índices puede apuntar a 32768 bloques, que como cada uno tiene 64KB de tamaño, puedo decir que el tamaño máximo de un archivo es de :
     $$
     32768 \times 64KB = 2GB
     $$
   
2. Cuántos bloques en total ocupará un fichero de 100.000 bytes.

   - FAT:

     En el ejercicio anterior calculamos que la FAT ocupa 128KB, entonces, como los bloques son de 64KB, podemos decir que la FAT ocuparía 2 bloques.

     Por otro lado,  puedo dividir a la cantidad de bytes que tengo que guardar en memoria y obtener la cantidad de bloques que requeriría para almacenar la información:
$$
\frac{1000000B}{65536B} = 1.5... \text{Bloques}
$$
Como no podemos ocupar solo parte de un bloque, podemos decir que se requieren $2$ bloques para almacenar la información.

 Con ambos datos puedo decir que se requieren <u>4 bloques</u> para almacenar un fichero de 100.000 bytes.

   - Indexado Simple:
   
     Ocupara 1 bloque de la tabla de indexado mas la cantidad de bloques que se utilice para guardar la información del archivo. Convirtiendo 64KB a Bytes, obtengo que cada bloque tiene:
$$
65536 \text{ Bytes}
$$
Tomando esta información, puedo dividir a la cantidad de bytes que tengo que guardar en memoria y obtener la cantidad de bloques que requeriría para almacenar la información:
$$
\frac{1000000B}{65536B} = 1.5... \text{Bloques}
$$
 Como no podemos ocupar solo parte de un bloque, podemos decir que se requieren $2$ bloques para almacenar la información.

 Sabiendo estos dos datos, podemos decir que se requieren <u>3 bloques</u> para almacenar un fichero de 100000 Bytes.     