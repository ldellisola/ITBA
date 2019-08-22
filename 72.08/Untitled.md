# Clase 2

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



___

En  Linux todos los perisfericos son tratados como archivos y se manejan con las mismas 4 operaciones de System Calls:

- `OPEN`
- `CLOSE`
- `READ`
- `WRITE`

