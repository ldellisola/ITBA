# Memoria Virtual

La memoria virtual es un concepto que genera el procesador, no el sistema opertivo, este ultimo solo utiliza al concepto. Esto trae a la paginacion dentro de la ecuacion, esto permite transformar las direcciones de memoria virtuales que se asignan a cada proceso en posiciones de memoria fisica, pero solo el procesador se entera de esta cambio. Estas direcciones virtuales pueden apuntar a la misma o distintas direcciones fisica que otro proceso. Un ejemplo de esos son las librerias estandar, que puede que varios procesos la requieran pero no es eficiente que se cargue toda la libreria por cada vez que se linkeditea contra esa funcion, por lo que multiples procesos pueden leer a la misma posicion de memoria fisica.

Para acceder a las paginas en los procesadores Intel de 32 bits, se hace de forma indexada. Para acceder a una pagina se debe acceder por una posicion de memoria, donde los 12 bits mas significativos son la direccion de la memoria, seguidos por 10 bits que indican a que pagina se quiere acceder y por ultimo 10 bits donde se indica el offset para indicar a que posicion de memoria se quiere acceder, dentro de cada pagina.



### Ejemplo

Nosotros vamos a tomar el tamaño de la pagina como `4kb`, por lo que un procesador de 32bits, que puede manejar hasta 4 Gb de memoria, va a tener $2^{20}=\frac{2^{32}}{2^{12}}=2^{10}\times 2^{10}$ paginas. Por lo que hay $2^{10}$ grupos de paginas, que cada uno contiene $2^{10}$ paginas.