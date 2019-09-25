# Assembly

En la arquitectura Intel x86 no se pueden mover datos de una posición de memoria a otra posición de memoria con una sola instrucción. La instrucción que no se puede hacer es:

```assembly
Mov	[bx],[ax]
```

Esto se debe a que la memoria no puede procesar informacion, es solo un lugar donde se guardan cosas, por lo que no puede encargarse de estas tareas.

En assembler se puede declarar una variable sin inicializarla:

```assembly
Variable db ?
```

Para declararla e inicializarla al mismo tiempo:

```assembly
Variable db 99h
```

Para declarar variables globales hay que definir la zona de datos `bss` y reservar bytes de variables globales

```assembly
section .bss
placeholder resb 10
```

## Compilacion y Linkedicion

Para compilar se deben correr los siguentes comandos:

```bash
nasm -f elf32 file1.asm file2.asm ... fileN.asm
ld -m elf_i386 file1.o file2.o ... fileN.o -o exec
```

Los flags `-f` y `-m` indican la arquitectura para la cual se van a compilar y linkeditar este binario. Si queremos hacerlo en 32-bits, entonces tenemos que indicar `-f elf32` y `-m elf_i386`. Si queremos hacerlo para arquitecturas de 64-bits no es necesario utilizar los flags por que por defecto utiliza 64-bits.

Por otro lado el flag `-o` indica el nombre del archivo luego te haber terminado la linkedicion.

## Secciones

Los archivos `.asm` se definen en distintas secciones, entre las cuales estan `.text`, `.data`, `.bss` y `.rodata`. Cada una de estas secciones tiene el siguiente uso:

- `.text`: Es la zona del archivo donde se escribe el codigo. La informacion de esta zona no debe ser modificada durante la ejecucion y si lo es se va a generar un error.
- `.data`: Esta zona se utiliza para guardar informacion que luego puede ser modificada, pero no puede tener codigo a ejecutar.
- `.rodata`: Similar a `.data`, esta zona contiene informacion y no puede tener codigo a ejecutar, pero la informacion que contiene es read-only.
- `.bss`: Esta seccion sirve para reservar memoria no inicializada.

### Instrucciones para Reservar Memoria

Los operadores de reserva de memoria solo indican el tamaño del bloque donde van a guardar la informacion, por lo que se les puede pasar un solo valor a guardar, una sucesion de valores o hasta un string. Existen los siguentes operadores:

- `db`: Reserva bloques de 1 byte.
- `dw`: Reserva bloques de 2 bytes.
- `dd`: Reserva bloques de 4 bytes

Tambien existen `dq` y `dt` pero no se ven en esta materia.

A la hora de reservar memoria no inicializada (En la seccion `.bss`), tambien tenemos disitntas instrucciones dependiento del tamaño de bloque de la informacion que vamos a guardar. La diferencia es que en estas instrucciones no se indica que vamos a guardar, sino cuanta memoria queremos. Tenemos las siguientes operaciones:

- `resb`: Reserva memoria con bloques de 1 byte.
- `resw`: Reserva memoria con bloques de 2 bytes.

Tambien existen `resq`, `resy` y `resz` pero no se ven en esta materia.

Por ultimo tenemos a la operacion `equ`, que es el equivalente al define de C.

## Modos de Direccionamiento

El assembly del Intel 80386 tiene varios modos de direccionamiento:

- Inmediato: Cuando se pasa un valor a un registro directamente. Por ejemplo: `mov eax, 123`.
- De Registro: Cuando se copian valores de un registro a otro. Por ejemplo: `mov eax, ebx`.

- Directo: Se trata cuando se desreferencia a una posición de memoria directamente, sin haberla cargado en un registro. Por ejemplo: `mov ax,[1234h]` .
- Indirecto: Funciona de forma similar al directo, pero en este caso se desreferencia al valor de una variable. Por ejemplo: `mov ax,[eax]`
- Indexado: Permite tomar el direccionamiento indirecto y sumarle un índice, para acceder a otra posición de memoria. Por ejemplo: `mov ax, [eax+4]` 

## Escritura y Lectura de Memoria

Al leer o escribir en memoria, se van a escribir o leer una cantidad de bytes igual a la del registro que esta siendo utilizado, por ejemplo: `mov ax,[100h]` va a copiar 2 bytes (`100h` y `101h`) a `ax`.

## Punto de Entrada

El punto de entrada es la primer funcion que ejecuta el sistema operativo al correr el binario. En assembly este se llama `_start:`. 

### Argumentos de Linea de Comando

El punto de entrada es el unico que realmente tiene acceso a los argumentos que se enviaron por linea de comando. Estos se pasan por el stack de la siguente forma:

| Posicion del Stack |             Valor guardado              |
| :----------------: | :-------------------------------------: |
|       `ESP`        |         Cantidad de Argumentos          |
|      `ESP+4`       |            Path al Programa             |
|      `ESP+8`       |       Direccion del 1er Argumento       |
|   `ESP+(n+2)*4`    |        Direccion del n-Argumento        |
|                    |                  NULL                   |
|                    | Direccion de la 1ra Variable de Entorno |
|                    | Direccion de la 2da Variable de Entorno |
|                    |  Direccion de la n-Variable de Entorno  |
|                    |                  NULL                   |

Es una buena practica copiar la direccion inicial del `ESP` al `EBP` para poder acceder rapidamente a estas variables luego, ya que a medida que se utiliza el stack, estas variables son cada vez mas complicadas de acceder.

## Stack

El stack es necesario para poder llamar a funciones, de esta forma se puede conocer el "historial" de funciones y a que direccion de memoria el programa tiene que ir luego de terminar de ejecutar una funcion.

## System Calls

En  Linux todos los periféricos son tratados como archivos y se manejan con System Calls:

| Return on success | Nombre  | `EAX` | `EBX`           | `ECX`  | `EDX`       |
| ----------------- | ------- | ----- | --------------- | ------ | ----------- |
|                   | `EXIT`  | `1h`  | error code      |        |             |
| Bytes Read        | `READ`  | `3h`  | File Descriptor | Buffer | Buffer Size |
| Bytes Written     | `WRITE` | `4h`  | File Descriptor | String | String Size |
| File Descriptor   | `OPEN`  | `5h`  | Path to File    | Flags  | Mode        |
| `0`               | `CLOSE` | `6h`  | File Descriptor |        |             |

Para utilizar cualquiera de estas system calls, hay que utilizar a las interrupciones. En Assembly de Intel, corriendo sobre Linux, se debe llamar a la siguente instruccion `int 80h`



