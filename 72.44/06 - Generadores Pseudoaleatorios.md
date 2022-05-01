# Generadores Pseudoaleatorios

La idea de estos algoritmos determinísticos es que la secuencia de salir parezca aleatoria. Comienzan con una seed y luego genera el resto de la secuencia con operaciones `xor`:

<img src="Resources/06 - Generadores Pseudoaleatorios/Screen Shot 2022-03-10 at 17.10.57.png" alt="Screen Shot 2022-03-10 at 17.10.57" style="zoom:50%;" />

Básicamente es una función a la cual nadie le encontró una forma de que no pase un test de aleatoriedad.

<img src="Resources/06 - Generadores Pseudoaleatorios/Screen Shot 2022-03-10 at 17.15.21.png" alt="Screen Shot 2022-03-10 at 17.15.21" style="zoom:50%;" />

En términos matemáticos, no se pudieron probar la existencia de este tipo de funciones.