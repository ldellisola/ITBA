# Modo  Protegido

Es el modo en el que tengo que poner a un procesador de Intel para que proteja el encapsulamiento de las aplicaciones. Como El sistema operativo no puede estar corriendo todo el tiempo, es tarea del procesador.

## Conmutación de Tareas

Es ir alternando que aplicaciones o que tareas se están ejecutando. El Timer Tick genera una interrupción, que hace que el procesador llame al Scheduler y este luego va a elegir a que aplicación va a llamar. Para poder ejecutar todas estas tareas de forma pseudosimultanea, hay que poder cambiar rápidamente el entorno y las variables de cada tarea. 

Gracias a esto se generan los **contextos** de cada tarea. El contexto es el estado de la tarea, similar a sacarle una snapshot de los registros, flags y el stack en el momento anterior a cambiar la ejecución a otra tarea. Es la tarea del Scheduler de organizar, guardar y restaurar el contexto de cada tarea a la hora de llamar y cortar a una nueva tarea.

## Memory Management Unit (MMU)

El MMU es el encargado de evitar que los programas no puedan escribir ni leer dentro del contexto de otras aplicaciones. Esta implementación tiene un par de validaciones entre la dirección (las que escribe el programador) y la dirección física. Tiene dos partes, a la **Unidad de Segmentación** y a la **Unidad de Paginación**. Estas unidades pueden modificar a los punteros antes de escribir en la memoria física para evitar que se pise memoria y poder mover los contextos mas fácilmente.

Hay una tabla (**descriptor table**) que contiene informacion sobre todos los procesos que están activos en el sistema. Entre la informacion que posee sobre los procesos están los permisos, los datos, el tamaño de la memoria que ocupa y donde empieza y donde termina en la RAM. Esta tabla se asigna permisos a nivel de kernel, por lo que el sistema operativo es el encargado de cargar los datos de la tabla, pero esta tabla puede existir sin un sistema operativo.

Intel definió dos tablas, la **GDT** y la **LDT**, la primera siendo una tabla global y la segunda local.

En la **GDT** se guardan los **Segment Descriptors**, que son las estructuras donde se guarda el contexto de los procesos. Este segmento posee informacion como la dirección en memoria del segmento, el tamaño del segmento y además un valor llamado **DPL** que te indica el nivel de permiso de un proceso. Originalmente había 4 niveles de permiso pero solo se usan 2 actualmente, siendo 0 el nivel de kernel y 3 el de user. No confundir esto con los permisos de administrador, ya que eso depende absolutamente del sistema operativo.

### Descriptores



## Privilegios E/S

Hay instrucciones sensibles que tienen mucho poder, por lo cual solo pueden ser ejecutadas con un nivel de privilegios alto. Este nivel de privilegio se aplica con 2 bits en los ERFLAGS y se usan los mismos niveles de privilegios que se habían especificado antes.

Las instrucciones son: `in`, `out`, `ins`, `outs`, `cli`, `sti`.













