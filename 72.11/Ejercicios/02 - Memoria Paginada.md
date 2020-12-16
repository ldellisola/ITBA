# Memoria Paginada

## 1

Para empezar, supongamos un sistema que utiliza memoria paginada. Las direcciones lógicas son de 24 bits. Si se dedican 10 bits para seleccionar la página y los restantes para el desplazamiento dentro de la página:

- ¿Cuántas páginas puede llegar a tener un proceso?

  Se pueden tener $2^{10}$ paginas

- ¿Qué tamaño de página utiliza el sistema?

  El sistema utiliza paginas de 16KB

- ¿Cuánta memoria puede direccionar un proceso?

  16MB

Pongamos otro caso similar. Esta vez tenemos direcciones lógicas de 24 bits y sabemos que el tamaño de página es de 4KB. Entonces:

- ¿Cuántas páginas puede llegar a tener un proceso?

  Puedo llegar a tener $2^{12}$ paginas

- ¿Cuántos bits hay que dedicar a página y a desplazamiento?

  Hay que dedicar 12 bits al numero de pagina y 12 bits al desplazamiento

- ¿Cuánta memoria puede direccionar un proceso?

  16MB

Otra cuestión interesante es observar la influencia entre el tamaño de página y el espacio ocupado por la **tabla de páginas**. ¿Cuál de los dos sistemas anteriores genera tablas de páginas más grandes?

La segunda opcion tiene paginas mas chicas, por lo que hay una mayor cantidad de paginas en el sistema. Esto genera que tenga una tabla de paginas mas grande, ya que necesita mas entradas.

## 3

Supongamos una máquina con direcciones lógicas de 16 bits, direcciones físicas de 32 bits y un tamaño de página de 16KiB. En este sistema:

- ¿Cuánta memoria puede direccionar un proceso?

  Como las direcciones logicas son de 16 bits, un proceso puede manejar hasta $2^{16}$ bytes, es decir 64 KB.

- ¿Cuánto espacio físico puede direccionarse?

  Se puede direccionar hasta 4GB.

- ¿Cuántos marcos de página pueden llegar a existir en la memoria?

  $2^{18}$

- ¿Cuántos bits dedicados a página y desplazamiento habría en una dirección física?

  Va a haber 14 bits dedicados al desplazamiento y 18 bits dedicados al numero de pagina.

- ¿Cuántas entradas puede llegar a tener la tabla de páginas de un proceso?

  La tabla de paginas puede tener solo 4 paginas por proceso, ya que solo tiene 2 bits de numero de pagina la direccion logica.

- ¿Cuántos bits son necesarios para almacenar una entrada en la tabla de páginas?

  Solo 2 bits.

## 4

En los sistemas comerciales se han manejado tamaños de páginas entre 256 bytes y hasta 1 gigabyte. Un tamaño típico y clásico son los 4KiB de los procesadores x86 de Intel, que vamos a tomar como caso para este ejercicio. En los x86 el tamaño de una entrada en la tabla de páginas es de 32 bits (4 bytes).

Bajo estas condiciones, supón que tenemos un proceso que tiene reservados 10 megabytes de memoria y calcula estos datos:

- ¿Cuántas páginas necesita este proceso?

  Va a necesitar 640 paginas.

  4KB = 2^14 B => 14 bits

- ¿Cuánto ocupa la tabla de páginas de este proceso?

  ==??????==





















