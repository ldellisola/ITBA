# Assembly

En la arquitectura Intel x86 no se pueden mover datos de una posicion de memoria a otra posicion de memoria con una sola instruccion. La instruccion que no se puede hacer es:

```assembly
Mov	[bx],[ax]
```

Esto se debe a que la memoria no puede procesar informacion, es solo un lugar donde se guardan cosas, por lo que no puede encargarse de estas tareas.

En assembler se puede declarar una variable sin inicialzarla:

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

## Modos de Direccionamiento

El assembly del intel 80386 tiene varios modos de direccionamiento:

- Inmediato: Cuando se pasa un valor a un registro directamente. Por ejemplo: `mov eax, 123`.
- De Registro: Cuando se copian valores de un registro a otro. Por ejemplo: `mov eax, ebx`.

- Directo: Se trata cuando se desreferencia a una posicion de memoria directamente, sin haberla cargado en un registro. Por ejemplo: `mov ax,[1234h]` .
- Indirecto: Funciona de forma similar al directo, pero en este caso se desreferencia al valor de una variable. Por ejemplo: `mov ax,[eax]`
- Indexado: Permite tomar el direccionamiento indirecto y sumarle un indice, para acceder a otra posicion de memoria. Por ejemplo: `mov ax, [eax+4]` 

## Escritura y Lectura de Memoria

Al leer o escribir en memoria, se van a escribir o leer una cantidad de bytes igual a la del registro que esta siendo utilizado, por ejemplo: `mov ax,[100h]` va a copiar 2 bytes (`100h` y `101h`) a `ax`.

## Perisfericos

En  Linux todos los perisfericos son tratados como archivos y se manejan con las mismas 4 operaciones de System Calls:

- `OPEN`
- `CLOSE`
- `READ`
- `WRITE`

