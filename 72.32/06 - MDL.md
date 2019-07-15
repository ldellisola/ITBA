# Inferencia de Estructura

Hay muchas colecciones de documentos XML tanto generados por computadoras o por personas que no tienen una estructura para ser validadas, por lo que hay formas de generar estar estructuras de forma automatica. El problema de esto es como definimos que una estructura es buena para validar a otros documentos XML. Para resolver esto se plantearon 3 puntos:

- **Compresion**: Debido a que cada elemento tiene un tag de inicio y uno de fin, esto hace que el archivo de la estructura sea mas pesado de lo que deberia, entonces se puede almacenar la estructura por un lado (DTD) y por otro la version de la instancia XML comprimida.
- **Consultas**: No es necesario descargar todo el archivo XML para ver si un elemento esta dentro de el, sino que se puede verificar si el elememento existe en la estructura. Y de estar, se puede traer del documento solo la parte que necesitamos.
- **Informacion Comun**: Permite que la informacion del mismo tipo sea representada de la misma forma. Se puede crear una estructura a partir de varios documentos XML y que esta valide a todas las distintas formas del elemento a traves de los documentos.

## Inferencias Sencillas

La inferencia de un DTD a partir de una coleccion de documentos XML es muy importante. Existen diferentes formas de realizar dicha inferencia. 

### Método Promiscuous

La forma mas sencilla de hacer un DTD a partir de distintos xML es tomar todos los elementos distintos de los XML y declararlos como `ANY`. De esta forma cualquier elemento puede tener a cualquier subelemento. El problema de este metodo es que **genera un DTD muy general** y va a validar a muchos documentos que no son parte de la coleccion.

### Metodo Ad-Hoc

Este metodo se fija como esta definido cada elemento en su propio documento y lo agrega al DTD creado, permitiendo que solo los documentos que pertenecen a la coleccion sean validados por este DTD, pero es muy complicado como para que una persona lo lea.

### Algoritmo XTRACT

El algoritmo XTRACT es la evolucion natural de los metodos vistos anteriormente, ya que crea el DTD mas eficiente posible mientras que trata de que siga siendo legible por una persona. El algoritmo se compone por 3 pasos:

1. **Generalización**: Se emplean tecnicas para encontrar patrones en la coleccion y para producir expresiones regulares.
2. **Factorización**: Se intenta de factorizar y reducir las expresiones encontradas en el paso anterior para encontrar la version mas optima.
3. **MDL**: Se aplica el algoritmo MDL para elegir al DTD ideal entre los DTDs que produjeron los pasos anteriores.

## Algortimo MDL

El algoritmo MDL se utiliza para buscar el DTD que requiere una menor cantidad de bits para ser representado. Estos son los pasos:

1. Cuantos bits se necesitan para codificar al elemento?

Para ver cuanto bit se necesitan para codificar al elemento hay que asignarle a cada elemento (incluidos los caracteres propios del DTD) una codificacion unica y esta va a ocupar una cantidad determinada de bits. Esto se calcula de la siguente forma:

Sea $i$ la cantidad de elementos, b la cantidad de bits que necesito:
$$
b = ⌈log_2⁡(i+7) ⌉ 
$$

2. Cuantos bits se necesitan para codificar el contenido del elemento?

Hay que contar el total de elementos y caracteres que hay en la declaracion de los subelementos del elemento a analizar, y luego multiplicar el valor por la cantidad de bits que se necesitan para codificar cada elemento. Por ejemplo, para codificar la siguente regla se calcula de la siguente forma:

```xml
<!ELEMENT elemento (subE1,subE2)*>
```

Podemos ver que tenemos 2 parentesis, 2 subelementos, 1 coma y un ansterisco, entonces esta regla va a ocupar $6 \times b$ bits.

3. Cuanto cuesta codificar cada una de las secuencias?

Para codificar a la secuencia hay que contar cuantas veces iteramos por el ciclo y, en cada iteracion, cual de los elementos de la disyuncion elegimos.

Para indicar cuantas veces iteramos por el ciclo, se deben escribir en 1s. Por ejemplo, si se itera 3 veces por la secuencia, se escribe `11`, indicando que el numero solo va a ocupar 2 bits, luego se utiliza al `0` como separador y se escribe el numero 3 en binario (`11`). Entonces nos quedaria de la siguente forma:

```
11 0 11
```

Para codificar los elekemntos se debe hacer una codificacion unica para cada uno, por ejemplo, si hay 3 opciones, puedo representarlo con 2 bits. Al primer elemento le doy el codigo `00`, al segundo `01` y al tercero `10`. Entonces quedaria:

```
00 01 10
```

Por ultimo, para codificar a una sequencia donde hay que iterar 3 veces y hay 3 elementos, la cadena quedaria:

```
11 0 11 00 01 10
```

 y si sumamos los bits que utilizamos veriamos que es necesario utilizar 11 bits.

4. Cuanto cuesta codificar todas las secuencias de este DTD?

Luego de hacer el paso anterior para cada secuencia, hay que sumar la cantidad de bits que ocupa cada secuencia para cada DTD.

5. Que DTD es el mas eficiente?

Hay que suma todos los valores de los distintos pasos para cada DTD y comparlos entre si. El DTD que ocupe menos bits va a ser el optimo.















