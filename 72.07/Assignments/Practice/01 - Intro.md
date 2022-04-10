# Intro

## 1

> Encuentre todos los archivos alojados en el directorio /var/log (incluyendo subdirecto-
> rios) que contenga el texto boot. Quédese observando nuevas entradas en dichos archi-
> vos.

```bash
$ sudo grep -rl boot /var/log/
$ sudo grep --recursive --files-with-matches boot /var/log/
```

## 2

> El programa que se describe en copy.c copia el contenido de un archivo en otro; permi-
> tiéndole al usuario especificar el tamaño del buffer utilizado.
> Mida el tiempo de ejecución (utilizando time(1)) cuando se utiliza un buffer de tamaño 0
> (sendfile), 1, 512, 1024, 2048, 4096.
> ¿A qué se debe la diferencia de tiempos? ¿Cual es la principal ventaja de la llamada de
> sistema sendfile?

| buffer size | time     |
| ----------- | -------- |
| 0           | 0m0.018s |
| 1           | 0m9.901s |
| 512         | 0m0.056s |
| 1024        | 0m0.037s |
| 2048        | 0m0.033s |
| 4096        | 0m0.026s |

La diferencia principal se debe a que con `sendfile`, se evita hacer una llamada de `read` y otra de `write` por lo que no se tienen que transferir información desde y hacia el user space 

La diferencia de tiempo de los otros modos se debe a la cantidad de llamadas `read` y `write` que se deben hacer para completar la transferencia, cuanto mas grande es el buffer, menos llamadas se tienen que hacer. 

## 3

> ¿Cómo se codifica los caracteres en un documento texto plano?¿Qué diferencias entre
> las codificaciones ASCII, ISO-8859-1, UNICODE? ¿Cuales son su ventajas y desventajas?

Se codifica como se te canta el culo. Las ventajas es que con Unicode podes codificar mas caracteres. chau

## 4

> ¿Es lo mismo hablar de UNICODE y de UTF-8? ¿son conceptos que refieren a diferentes
> cosas?

La diferencia es que UNICODE es el set de caracteres, mientras que UTF-8 es la codificación.

## 5

> ¿Qué criterio utilizaría para decidir utilizar UTF-8, UTF-16 o UTF-32?

Ambas codificaciones son de longitud variable, por lo que todos pueden representar todos los caracteres de Unicode. 

La diferencia esta en que si se piensan usar caracteres no ASCII, hay que usar dos caracteres UTF-8 mientras que solo seria un caracter UTF-16. La velocidad de decodificación es mucho mas rápida.

En un texto donde la mayoría de los caracteres son ASCII, tiene mucho mas sentido utilizar UTF-8.

UTF-32 es de longitud fija y debe ser utilizada en los casos donde eso sea una ventaja.

## 6

> Ejecute las siguientes directivas Java:
>
> ```java
> System.out.println("\u1F355");
> System.out.println("\u1F355".length());
> ```
>
> ¿De qué code point se trata?
> ¿Cuantos caracteres reporta el programa? ¿Considera que es correcto? ¿Por qué?
> Realizar la misma prueba en una consola Javascript (En Google Chrome presionar F12,
> seleccione el menú Console y ejecute "\u1F355".length. ¿Obtiene el mismo resultado?

Se trata del emoji de la pizza. El programa reporta que tienen 2 caracteres, por que java no lo puede imprimir bien por que es una basura. Javascript es la misma basura

## 7

> La sección 2.2 título Efficiency del [UNICODE9] se lee:
>
> > All Unicode encoding forms are self-synchronizing and non-overlapping.
> > This makes randomly accessing and searchi ng inside streams of charac-
> > ters efficient.
>
> Siendo UTF-8 una forma de codificar Unicode. ¿Por qué una codificación que se auto
> sincroniza es una ventaja en un acceso aleatorio de datos?

Ni idea capo

## 8

> ¿En qué consisten la discusión de Little-Endian contra Big-Endian

Depende como se guardan los nibbles dentro de un byte. Little-endian guarda primero el ultimo unible y después el primero, mientras que bígaros-endian lo hace al revés

## 9

> Cuando decimos que un archivo es de texto plano o un archivo binarios, ¿de qué estamos
> hablando?
> Brinde ejemplos de cada cada categoría.
> En el caso de archivos de texto plano: provea ejemplos donde la codificación de caracteres
> sea ASCII, donde sea UTF-8, y donde el mismo formato permite especificar la codificación
> dentro del mismo archivo. En este último caso describa como lo hace

Estamos hablando de si el archivo esta codificado de forma binaria, con 1s y 0s, o si esta codificado en ASCII o UTF





