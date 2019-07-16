# XQuery

XQuery nació para resolver algunas de las insuficiencias de XPath, ya que esta puede **agrupar**, **ordenar** y **crear nodos**. XQuery esta basado en XPath 2.0 y es un superset de XPath 1.0.

Tambien permite consultar informacion en otros documentos, agregando como primer nodo de la expresión a `doc("file.xml")`, de la misma forma permite abrir al mismo tiempo a todos los documentos XML de un directorio con el comando `collection("directory")`. Esta ultima función tambien se puede utilizar para leer los documentos XML linkeados en un archivo XML especial. Para este caso, el documento XML debe estar estructurado de la siguiente forma:

```xml
<collection>
	<doc href="doc1.xml"/>
    <doc href-"doc2.xml"/>
</collection>
```

## Expresiones

### Expresiones Primarias

Hay 3 tipos de expresiones primarias:

- **Literal**: Una instancia de un tipo atómico tal como fue definido en XML Scheme (`String`, `int`, etc)
- **Llamada a una función**.
- **Variable**: La variable debe comenzar con el símbolo `$`.

### Expresiones XPath

Son las mismas que se vieron en la [clase de XPath](08 - XPath.html) 

### Secuencia

Las secuencias están formadas por 0 o mas ítems, no pueden ser anidadas y tampoco se puede diferenciar entre una secuencia de un solo ítem y un ítem por separado. Se pueden afectar con los operadores de **unión**, **intersect** y **except**.

#### Operador Coma (`,`)

Evalúa a cada una de las expresiones de forma recursiva y concatena todos los resultados en una secuencia. Por ejemplo, la expresión `(1,(2,4,(5)),(),3)` devuelve `1 2 3 4 5`.

#### Operador `to`

Similar al rango de Ruby, genera un rango entre 2 números. Por ejemplo, la expresión `(2 to 4)` devuelve `2 3 4`. No se pueden hacer rangos que vayan de un numero mayor a un numero menor.

### Expresión Condicional

Son las clásicas expresiones `if Condition then do1 else do2` pero es necesario poner el `else`.

### Nuevos Nodos

Se pueden generar de forma directa o invocando a los constructores. Si se desea que se evalúa el contenido del nodo, entonces hay que envolverlo entre llaves `{ }`. 

Así se construye de forma directa:

`<elem>{1+2}</elem>` devuelve un elemento con el valor 5 $\rightarrow$ `<elem>5</elem>`

Si se quiere hacer con el constructor, hay que llamar al constructor de `element`.

### Expresiones Aritméticas/Relacionales

Para las expresiones aritméticas, se utilizan las mismas que vimos con XPath: `+`, `-`, `*`, `div`, `mod`.

Luego hay dos tipos de operaciones muy similares, las **value comparison** y las **general comparison**.

En el caso de las  **value comparison** se utilizan los operadores `eq`, `ne`, `lt`, `le`, `gt`, `ge`. Sirven para comparar 2 valores sueltos, para lo cual se aplica el siguiente algoritmo:

- Se atomizan los operandos  (se genera una secuencia de valores subyacentes). Si uno de los operandos atómicos es una secuencia vacía, entonces el resultado es una secuencia vacía.

- Si hay una secuencia de longitud mayor a 1 se lanza error, pero si ambas tienen longitud 1, se compara la semántica esperada.

Luego, las **general comparison** utiliza a los operadores `=`, `!=`, `<`, `<=`, `>`, `>=`. Estos **operadores nunca lanzan error**, sino que devuelven verdadero o falso. En el caso que no se pueda realizar la comparación, se devuelve falso.

### Expresiones FLWOR

Es un conjunto de expresiones que contienen a `for`, `let`, `where`, `order by` y `return`.

Para este tipo de expresiones es necesario utilizar al menos 1 `for` o un `let` y al final de todo un `return`. La expresión `for` permite iterar sobre una secuencia, mientras que `let` no itera sobre la secuencia, sino que se le asigna un valor.

`order by` se utiliza para ordenar a los elementos de la secuencia dentro del `for`, mientras que el `where` permite filtrar elementos. Por ejemplo, si quiero tomar una lista de alumnos, obtener solo la lista de alumnos que aprobaron y ordenarlos por su atributo `ID`, así se hace:

```xquery
for $var in doc("test.xml")/alumno
	where $var/@nota > 4
	order by $var/@ID
return $var
```

### Expresiones Cuantificadas

Hay dos tipos de expresiones cuantificadas, los **cuantificadores existenciales** y los **cuantificadores universales**. Los primeros devuelven `true` si al menos uno de los elementos cumplen con la condición, mientras que los segundos solo lo hacen si todos los elementos la cumplen. Otra diferencia es que al tener 0 elementos, los existenciales devuelven `false` y los universales `true`.

La sintaxis de los cuantificadores existenciales es:

```xquery
some $var in expression satisfies (Condition)
```

Por otro lado, la de los cuantificadores universales es:

```xquery
every $var in expression satisfies (Condition)
```

## Funciones

Ahora podemos declarar e invocar funciones localmente. Los parámetros pueden declarase sin anunciar su tipo y los tipos que pueden devolver son los mismos que el XML Scheme, `node`, `element` o `attribute`.

La sintaxis si no se indica el tipo es:

```xquery
declare function local:Nombre($par1,...) as tipo{
	XQuery Expression
};
```

Si se quiere indicar el tipo:

```xquery
declare function local:Nombre($par1 as Type1,...) as tipo{
	XQuery Expression
};
```

Y para poder invocar a una función solo es necesario llamar al namespace y luego a la función, de esta forma:

```xquery
local:Nombre(par1,...)
```
