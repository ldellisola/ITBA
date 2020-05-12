# Working Set Theory

Fue desarrollado por Peter Denning. La idea es que cada proceso trabaja en cada momento en unas zonas de codiog y datos bien delimitados, es decir, tienen buena localidad. El problema es que la localidad va cambiando a medida que el procesos se ejecuta. La idea es no darle mas paginas a un procesos que las paginas de su localidad actual.

Esto se logra calculando una aproximacion a la localidad de un proceso. El conjunto de paginas conel que ha trabajado recientemente un procesos se calcula como:
$$
WS(t,\Delta) = \text{paginas accedidas entre $t$ y $t-\Delta$}
$$
Si $\Delta$ tiene el tama;o adecuado, es una aproximacion muy fuiel a la localidad actual.

Otra forma de definirlo es con las paginas accedidas en los ultimos $k$ accesos a memoria

### Algoritmo WSClock

Es un algoritmo de reemplazo de paginas basado en el WS. Es similar al algoritmo de segunda oportudidad, pero con marcas de tiempo U. El algoritmo ejecuta los siguentes pasos:

- Si $R=1$, fijamos $U= \text{reloj actual}$ , $R = 0$ y seguimos buscando.
- Si $R = 0$ y $U \ge \text{reloj} - \Delta$
- ...
- ==FALTA==

### Prelimpieza

El tiempo de copiar a disco una pagina *sucia* puede generar un gran retardo en la gestion de un fallo de pagina. La solucion a este problema es que cuando el sistema operativo tenga tiempo, vaya guardando en disco las paginas modificadas para evitar realizar ese trabajo.

Actualmente la localidad de los procesos ha ido disminuyendo, entonces el concepto de working set es mas debil que en el pasado. Hoy en dia la memoria virtual y la cache de disco se han unidicado en un unico sistema, y ademas se permite crear pagians de tama;o variable. 

El mayor problema son los fallos de TLB y de pagina que son mas graves (Hay mayori diferencia de velocidad entre niveles de jerarquia de memoria)



## Importancia a la hora de generar mas page faults

- tama;o de pagina

- tama;o de memoria

- Velocidad de procesador
- Mas tama;o de TLB