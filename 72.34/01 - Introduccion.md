# Introducción

## Analisis de Algoritmos

El analisis de algoritmos permite caracterizar la cantidad de recursos computacionales que usara el mismo cuando se aplique a ciuertos datos y evaluar asi su performance. Estos recursos suelen ser **memoria** y **tiempo de ejecucion**.

**Como medir el tiempo de ejecucion?**

Hay dos formas de medir el tiempo de ejecucion: De forma **empirica** y **teorica**. La forma empirica se basa en marcar cuando empieza a correr el programa y cuando termina, con el objetivo de medir el tiempo que tardo en correr en tu computadora. La forma teorica se calcula a base de la complejidad del algoritmo y provee una cota superior al tiempo maximo que va a tardar en ejecutarse el programa.

A la hora de inferir empiricamente es importante ejecutarlo con distintos datasets, ya que un algoritmo puede ser mas rapido com pocos elementos pero cuando tiene una gran cantidad de elementos no lo es. La metrica empirica tiene 2 grandes problemas, por un lado consume tiempo verifican su funcionamiento con datasets muy largos, y por el otro, el tiempo depende de la computadora que lo este ejecutando.

La metrica teorica consiste en usar una descripcion de alto nivel del algoritmo para evaluar su eficiencia independientemente del hardware y software. Se lo describe con una expresion. La idea principal es contar la cantidad de operaciones primitivas y tomar una unidad de tiempo generica. Estas operaciones consisten en comparaciones, operaciones matematicas y asignaciones. Es basicamente [discreta](..\93.59\13 - Complejidad.html). 

**Como medir el consumo de memoria?**

La idea es similar a la metrica teorica del tiempo, consiste en usar una descripcion de alto nivel del algoritmo para evaluar cuanto espacio extra precisa para sus variables. Se lo describe con una expresion en funcion del tama;o de entrada. Para realizar esto se busca una cota para el espacio en memoria (stack y heap) que va a ocupar nuestro algoritmo.

Para poder caracterizar el espacio, tenemos que saber donde se guardan las cosas. Por ejemplo todas las reservas de memoria que se hacen con la palabra reservada `new` se realizan en el **heap**. Por otro lado, el **stack** se utiliza a la hora de pasar parametros, variables auxiliares y para direcciones de retorno.

