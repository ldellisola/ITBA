# Assembly y C

## Compilacion y Linkedicion

A la hora de utilizar tanto archivos escritos en C como rutinas de assembly, se los debe compilar de la siguente forma:

```bash
nasm -f elf32 file1ASM.asm file2ASM.asm ... fileNASM.asm
gcc -c -m32 file1C.c file2C.c ... fileNC.c
gcc -m32 file1C.o file1ASM.o file2C.o file2ASM.o ... fileNC.o fileNASM.o -o exec
```

De esta forma se compilan los archivos de assembly y los de C por separado, pero despues se unen a la hora de linkeditarlos.

El flag `-m32` indica que se va a compilar y linkeditar para 32-bits. Si no se especifica esto se compila para 64 bits.

## Punto de Entrada

A diferencia de usar assembly puro, en este caso no vamos a utilizar el punto de entrada `_start:` ya que el linkeditor `gcc` se encarga de hacerlo para manejar variables del entorno, entre otras cosas. 

Aqui vamos a usar `main:` como punto de entrada, y los pasajes de argumentos se van a realizar como si se tratara de una funcion de C.

## Pasaje de Argumentos

La forma de pasar argumentos a funciones de C depende del tipo de arquitectura (`x86` `x64`) que estemos utilizando. En el caso de `x86`, todos los valores se pasar por el stack, mientras que si hablamos de `x64` estos primero intentan de pasarlos por registros y luego, si necesitan mas, se pasan por el stack

### Pasaje de Argumentos por Registro

Para pasar argumentos por registro se utilizan los registros `RDI`, `RSI`, `RDX`, `R10`, `R8`, `R9`. Además tambien se pueden utilizar los registros `xmm0`, `xmm1`, `xmm2`, `xmm3`, `xmm4`, `xmm5`, `xmm6`, `xmm7` si se trata de variables con punto flotante como puede ser un `float` o un `double`. 

Los primeros registros mencionados pertenecen a la función llamadora, por lo que se debe mantener su valor al terminar la función.

### Pasaje de Argumentos por Stack

Al pasar los argumentos por el stack, se deben pushear de derecha a izquierda.

Por ejemplo, si tengo la función:

```c
func(paramA,paramB,paramC);
```

Como los parámetros se pushean de derecha a izquierda primero tengo que pushear `paramC`, después `paramB` y por ultimo `paramA`

Luego, la funcion que recibe los argumentos, puede acceder a los mismos de la siguente forma:

| Direccion del ESP |           Valor           |
| :---------------: | :-----------------------: |
|       `EBP`       | EBP del Contexto Anterior |
|      `EBP+4`      |   Direccion de Retorno    |
|      `EBP+8`      |     Primer Argumento      |
|     `EBP+12`      |     Segundo Argumento     |
|   `EBP+(n+1)*4`   |     n-simo Argumento      |

Siendo en el ejemplo anterior, `paramA` el primer argumento, `paramB` el segundo argumento y `paramC` el tercer argumento. 

### Retorno de Datos

Para devolver un dato desde una función se toma como convención al registro `EAX`, con algunas excepciones. Si el valor es mayor a 32bits, entonces retorno la parte alta en el registro `EDX` y la parte baja en el registro `EAX`. En caso de devolverse una estructura de datos, se retorna un puntero formado por `EDX:EAX` 

En el caso de 64-bits, la devolucion se ahce mediante los registros `RAX` y `RDX` en el caso que sea un tipo de dato `INTEGER`. Si hablamos de un dato `SSE`, se retorna por los registros `XMM0` y `XMM1`

## Manejo del Stack

 La pila se utiliza para pasar parámetros a funciones, por lo que necesitamos una forma de acceder a ella. Para esto están los registros `ESP` y `EBP`. El registro `ESP` es el encargado de apuntar al tope del stack en todo momento, mientras que el `EBP` se utiliza para poder acceder a las variables o argumentos guardados en el stack sin modificar al `ESP`.

### StackFrame

El stackframe permite a cada función utilizar el stack sin la posibilidad de que estas pierdan su dirección de retorno o accedan a las variables que están fuera de su scope. Este proceso implica guardar el principio de nuestra parte del stack y modificarlo luego para que la próxima función sepa donde comienza su parte del stack (Todo esto se hace con el registro `EBP`).

Entonces, cada función que quiera ser llamada por C tiene que seguir esta forma:

```assembly
push ebp
mov ebp, esp

; El codigo de tu funcion

mov esp,ebp
pop ebp
```

### Alinemiento a Palabra

Cuando el procesador quiere acceder a un dato que esta des-alineado (su tama;o es menor igual a 4 bytes y no esta dentro de la misma posicion del stack), debe hacer 2 lecturas, una para pedir la primera parte de los datos y otra para la segunda parte. Cuando intentamos de escribir y tenemos un dato des-alineado, es todavia peor, ya que debe leer de memoria para guardar el dato y no sobreescribirlo, luego combinar el dato anterior con la primera parte de mi dato y guardarlo, y por ultimo escribir la segunda parte de mi dato.

La forma de solucionar este problema es negar los ultimos 4 bits. Como el stack crece hacia valores menores de `ESP`, seguro esta opcion esta por detras del puntero actual y va a hacer el acceso a memoria mas eficiente.

Esto se realiza con la siguente operacion `and esp,-16` luego de declarar las variables en cualquier funcion.

## Interoperabilidad entre C y Assembly (`32-bits`)

El lenguaje C impone ciertos estandares para poder asegurar que las funciones de assembly funcionen perfectamente junto a las funciones de C. Entre esos estandares se incluye el [StackFrame](#StackFrame) para asegurarse que cada funcion este aislada de cualquier otra funcion. 

Otro estandar que exigen es que se mantenga el valor de los registros `EBX`, `ESI`, `EDI`,`EBP` y `ESP` entre las llamadas a funciones, es decir, que tengan el mismo valor antes y despues de entrar a una funcion.

### Variables

Para hacer que las variables de cada funcion vivan solo en el scope de la misma, se las debe reservar en el stack. Esto se hace haciendo que el stack pointer (`ESP`) crezca, es decir, restandole la cantidad de bytes necesarios. Por ejemplo, si queremos guardar un numero entero en el stack, debemos hacer `sub ESP,4`.

### Llamada de funciones de C en Assembly

```assembly
GLOBAL main
extern printf

section .text
main:

	
	push dword string
	call prinf
	
	
	ret

section .data
string db "hello world",0
```

En este caso, nuestro programa simplemente va a utilizar la función `printf` de C para poder imprimir en un string en pantalla. Para esto pasamos al stack a nuestro string que queremos imprimir, que es parámetro de la función, y luego la llamamos.

### Llamada de funciones de Assembly en C

```c
#include <stdio.h>

extern unsigned int siete(void);

int main(void){
    printf("Numero Siente:%d",siete());
    return 0;
}
```

Desde el punto de vista de C, la función de assembly es simplemente una función mas externa.

```assembly
GLOBAL siete

section .text

siete:
	push ebp
	mov ebp, esp
	
	mov eax,7
	
	mov esp,ebp
	pop ebp
	
	ret
```

Y la función de assembly es una función normal, que podría ser llamada tambien desde assembly.

## Interoperabilidad entre C y Assembly (`64-bits`)

Lo unico que cambia aca son los registros a preservar, ya que se deben mantener los valores de los registros `RBP`, `RSP`, `RBX`, `R12`, `R13` y `R15`.

