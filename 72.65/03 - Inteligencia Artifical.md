# Inteligencia Artifical



## Maquina de Estados

Es un aproach bastante simple donde la entidad tiene distintos comportamientos y en base al estado seleccionado va a realizar una accion u otra. Las ventajas son es que son muy faciles de programar, pero solo sirven para comportamiento simple y son muy poco reusables.

## Arboles de Comportamiento

Son una alternativa mas avanzada a las maquinas de estado. Se utiliza el patron composite, donde si un nodo es hoja, seria una accion completa, mientras que si es un nodo intermedio, todavia tiene varios caminos por los cuales se pueden recorrer.

En los nodos hojas se programan las acciones (granulares) del agente y los chequeos del entrono.

Los nodos composites se dividen en dos tipos:

- Sequencia: Ejecuta a los hijos en un orden determinado y necesita que todos los hijos se ejecuten de forma exitosa para que este nodo devuelva success.
- Selector: Ejecuta todos los hijos pero no necesita que todos los hijos devuelven success, entonce si un hijo falla va al proximo. El nodo falla solo si todos los hijos fallan.
- Decorator: Tiene un solo hijo y la idea es hacer algo especial con ese hijo, como por ejemplo mantenerlo ejecutando todo el tiempo o invertir el resultado de un nodo hijo.

## Funciones de evaluacion

Son funciones que permiten saber que estrategia le conviene ejecutar al agente.