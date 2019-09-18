# Assembly y C

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

### Retorno de Datos

Para devolver un dato desde una función se toma como convención al registro `EAX`, con algunas excepciones. Si el valor es mayor a 32bits, entonces retorno la parte alta en el registro `EDX` y la parte baja en el registro `EAX`. En caso de devolverse una estructura de datos, se retorna un puntero formado por `EDX:EAX` 

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

## Interoperabilidad entre C y Assembly

## Llamada de funciones de C en Assembly

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

## Llamada de funciones de Assembly en C

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















