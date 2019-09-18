# Programas y Binarios

## Compilacion y Linkedicion en C

El proceso de pasar de un archivo `.c` a un ejecutable no es un simple paso, sino que estan involucrados varios procesos:

1. `cpp`: Se va a invocar al preprocesador `cpp`, que va a evaluar las macros y las directivas y las va a reemplazar por el valor al cual equivalen.
2. `gcc`: Se llama al compilador `gcc` que va a convertir nuestro codigo en C a codigo en assebly.
3. `gas`: El tercer paso implica llamar al compilador de assembly llamado `gas` que convierte al condog assembly en codigo objeto.
4. `ld`: El ultimo paso es el linkeditor, que se ocupa de unir a todos los archivos compilados en un solo ejecutable.

## Ejecucion de un programa

Para ejecutar un programa desde linux, el sistema operativo sigue la siguente ruta:

1. El usuario indica por linea de comando al programa que quiere ejecutar.
2. El sistema operativo efectua la ejecucio con el proceso `excve.`
3. Se lee en el disco duro donde esta guardado el programa.
4. Se asigna espacio al programa en la memoria `RAM.`
5. Se ejecuta la funcion `jmp` hacia la direccion de memoria recien asignada al programa.
6. Se ejecuta el programa.

## Programa en Memoria

El programa tienen en memoria un espacio asignado en una forma particular. En la parte superior se guarda el codigo del programa (Seccion <u>Codigo</u>). Luego se almacenan los <u>datos</u>, es decir, las variables estaticas y globales que se inician al cargar el programa. En tercer lugar se guarda un espacio llamado <u>heap</u> que se utiliza como memoria dinamica que se reserva y libera en tiempo de ejecucion. Por ultimo esta el <u>stack</u>, que son los argumentos y las veriables locales a la funcion.

## Introduccion al Sistema Operativo

La memoria no esta encargada de amacenar a la informacion de los programas, sino que ademas de contener multiples programas (<u>User Space</u>), tambien tiene que tener al sistema operativo (<u>Kernel Space</u>).

### System Calls

Las system calls es la forma que tienen todos los programas de interactuar con el sistema operativo y, finalmente, con el hardware (aunque nunca lo hacen de forma directa).

































