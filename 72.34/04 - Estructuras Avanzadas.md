# Estructuras Avanzadas

## Hash Table

....

### Resolucion de Colisiones

Cuando el factor de carga (cantidad de entradas) llega a cierto punto, se tiene que duplicar el tama;o y rehashear a las claves existentes. Esto se hace para evitar las colisiones

- **Closed Hashing**: Dentro de la misma tabla se guardan los elementos que colisionaron.

  En esta implementacion, los lugares de la tabla sin valor esta almacenado el valor null. Cuando ocurre una colision, hay varias formas de resolverlo:

  - <u>Rehasheo Lineal</u>: Si hay una colision en la posicion `i`, entonces trata de almacenarlo en la posicion `i+1`, y sigue recorriendo la tabla hasta encontrar un lugar vacio para guardarlo.
  - <u>Rehasheo Cuadratico</u>: Same pero es con $i^2$.

  A la hora de **borrar** un elemento, lo tengo que buscar primero. En este caso, no puedo borrar simplemente una ranura, sino que tengo que proteger a las otras entradas que tuvieron colision con esta. En el caso de que el proximo elemento tenga baja fisica, entonces significa que el elemento no actuo como puente y puedo eliminarlo con baja fisica. En el caso de que el proximo elemento no tenga baja fisica, es posible que el elemento que quiero borrar sea puente para otros elementos, entonces lo tengo que eliminar mediante una baja logica, es decir marcarlo como ocupado pero sin valor.

  La busqueda es similar, en el sentido que la unica forma que puedo dejar de buscarlo es cuando encuentra una baja fisica, ya que si encontramos bajas logicas es posibles que estas actuen como puentes y fueron eliminados.

- **Open Hashing**: Fuera del hashing se almacenan los elementos que colisionaron. Estos suelen ser almacenados en una lista, arbol u otra estructura.