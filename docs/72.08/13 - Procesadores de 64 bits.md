# Procesadores de 64 bits

En el mundo de los procesadores se utilizan distintas tecnologías con respecto a los procesadores. Los procesadores Intel de 32 bits utilizan una arquitectura llamada IA-32, que representa a todas as instrucciones que puede manejar un procesador de ese estilo. 

Luego de desarrollaron nuevas tecnologías de 64 bits, de las cuales salió una triunfante. Estamos hablando de EM64T (IA-32e) y su contraparte en Intel IA-64. El segundo de estos fue el gran paso de Intel a 64 bits, dejando de soportar la arquitectura de 32 bits completamente, y no fue muy bien aceptado. Luego salió la arquitectura EM64T (junto a AMD64, que son muy parecidos), que permitía mantener compatibilidad con los programas de 32 bits, mientras que agregaba soporte para operar en 64 bits.

## Diferenciación de los Procesadores

Se denomina <u>arquitectura</u> de un procesador al set de instrucciones que corre, es decir, si cambia al menos una instrucción de un set a otro, esta cambiando la arquitectura. 

Luego viene la <u>microarquitectura</u>, que define como se deberá implementar el hardware, seleccionando las tecnologías que serán compatibles con los procesadores que se hagan con dada microarquitectura. Entre las tecnologías que se implementan qui están los multinúcleos, virtualización y la cache, entre otras.

Por ultimo están los <u>procesadores</u>, que son el ultimo paso del proceso y la implementación de la microarquitectura.

## Caso Pentium

El procesador Pentium tiene un bus de datos de 64 bits, pero su bus de direcciones es de 32 bits, por lo que sigue siendo un procesador de 32 bits. Por ultimo, este procesador tiene una arquitectura superescalar que le permite ejecutar hasta 3 instrucciones al mismo tiempo si estas son independientes entre si, ya que tiene 3 unidades de ejecución.

## Caso Pentium Pro

El procesador Pentium Pro es especial, ya que mientras que es un procesador de 32 bits, puede manejar direcciones de memoria como si fuese un procesador de 64 bits gracias al PAE. Su bus de datos es de 64 bits mientras que el bus de direcciones es de 36. Este procesador puede manejar mas de 4GB de RAM solo si el sistema operativo implementa un sistema de manejo de memoria especifico, y sigue sin poder crear tareas de mas de 4 GB.

## Physical Address Extension

Fue la solucion temporal de Intel para que sus procesadores puedan ver la misma cantidad de memoria que los procesadores de 64 bits, pero siendo que de 32 bits. Para poder utilizar el PAE se debe habilitar el bit 5 del CR4 y el procesador llega a ver hasta 64GB de memoria física, aunque las direcciones virtuales siguen siendo de 32 bits. Las páginas son de 16M.

## Intel 64 / EM64T

Llamado por sus siglas, Extended Memory 64 Techology, es la solucion actual de Intel para procesadores de 64 bits y compite con la arquitectura AMD64.

Esta arquitectura posee direcciones virtuales de 64 bits y direcciona hasta 16 EB, además de tener registros de 64 bits, instrucción de direccionamiento de memoria de 64 bits y una ALU de 64 bits.

Esta arquitectura tambien introdujo un nuevo modo de funcionamiento: **IA-32e**, que permite al procesador correr dos submodos:

- **Legacy Mode**: tambien llamado modo de compatibilidad con 32 bits y es similar al modo protegido de 32 bits, pero permite acceder a mas de 4GB de memoria mediante el PAE.
- **Long Mode**: Este modo opera en 64 bits y utiliza las direcciones lógicas en 64 bits, pero los operandos por default son los de 32 bits, salvo que se lo aclare.



















