

# Java

## Interfaz Funcional

Una **interfaz funcional** es una interfaz que tiene un solo método a implementar. Para indicar que una interfaz es funcional, se usa el atributo `@FunctionalInterface`.

También se agregaron los siguientes tipos de datos para soportar el paradigma funcional en Java, como:

- `Predicate<T>` es una función booleana que devuelveverdadero o falso.
- `Consumer<T>` es una función que ejecuta una acción sobre un objeto
- `Function<T,R>` representa a una función de un solo parámetro.
- `Supplier<T>` provee una instancia de un objeto `T`.
- `UnaryOperator<T>` 
- `BinaryOperator<T>`

También agregaron **métodos estaticos** a las interfaces y la habilidad de definir **métodos por default** en interfaces. En este ultimo caso puede existir conflictos y se resuelven de la siguiente manera:

1. Si el conflicto es entre una clase y una interfaz, toma presedencia el método de la clase.
2. Si el conflicto es entre dos interfaces del mismo arbol de herencia, toma precendencia el que esta más abajo en el arbol.
3. Si el conflicto es entre dos interfaces que definen el mismo default method pero no tienen el mismo arbol de herencia, entonces la clase que lo implementa debe implementar el método.

## Lambdas

Una **lambda** es una instancia de una interfaz funcional. Esta función implementa el método abstracto. Estas funciones también puede ser almacenadas como variables.

Las lambdas pueden acceder a variables fuera de su scope, pero no pueden modificarlas.

## Streams

Los streams tienen una fuente, una serie de operaciones y un colector. La fuente puede ser cualquier coleccion que tenga implementado el método `stream()` y hay varias opciones para las operaciones:

- `map`
- `flatMap`
- `limit`
- `distinct`
- `filter`
- `sorted`

Las operaciones de coleccion pueden devolver un solo elemento o una colección nueva.

