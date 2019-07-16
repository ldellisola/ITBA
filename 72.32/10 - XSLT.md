# XSLT

XSLT es un lenguaje pensado para transformar documentos XML en otro tipo de documentos como pueden ser HTML, XHTML, PDF, etc.

## Templates

XSLT es un lenguaje declarativo, que se organiza en **templates** (Similares a funciones). Cada template provee reglas para realizar una transformación especifica y constituye a una unidad lógica. 

Se requiere un procesador de XSLT para aplicar dichos templates a la estructura jerárquica de un documento XML, los templates declaran precisamente a que nodos del árbol se aplicaran las reglas.

Las templates se pueden definir de dos formas distintas, pero ambas tienen el mismo efecto:

- Utilizando `stylesheet`

```xml
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	Reglas XSLT
</xsl:stylesheet>
```

- Utilizando `Transform`

```xml
<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	Reglas XSLT
</xsl:transform>
```

Hay dos tipos de templates: Anónimos y Con Nombre.

### Templates Anónimos

Este tipo de templates no necesitan tener nombre, pero tampoco tienen que estar dentro de otro template.  Se los define de la siguiente forma:

```xml
<xsl:template match="xpathExpression">
  	<xsl:param name="param1"/>
    ...
</xsl:template>
```

Y luego se los puede invocar de la siguiente forma:

```xml
<xsl:apply-template select="xpathexpression">
	<xsl:with-param name="param1"> value1 </xsl:with-param>
    ...
</xsl:apply-template>
```

Los parámetros son opcionales y pueden tener infinitos. Ahora, como sabe a que template anónimo llamar? XSLT compara a todos los templates anónimos y selecciona al primero cuya expresión `match` sea igual a la de `select`.

### Templates con Nombre

Son similares a los templates anónimos pero en vez de tener el atributo `match` tienen el atributo `name`, y luego se las llama por el nombre.

Así es la sintaxis:

```xml
<xsl:template name="TemplateName">
  	<xsl:param name="param1"/>
    ...
</xsl:template>
```

Y así se lo invoca:

```xml
<xsl:call-template name="TemplateName">
	<xsl:with-param name="param1"> value1 </xsl:with-param>
    ...
</xsl:call-template>
```

### Template Hibrido

Tambien se pueden combinar ambos templates haciendo que time una expresión y tenga un nombre. De esta forma puede ser invocado tanto como un template con nombre como a uno anónimo.

```xml
<xsl:template name="TemplateName" match="xpathExpression">
  	<xsl:param name="param1"/>
    ...
</xsl:template>
```

## Algoritmo de Evaluación

El procesador comienza con el nodo raíz y aplica un template a todos los nodos hijos. De no existir esta regla para alguno de los templates, se aplica el **element default template** que consiste en sacar su contenido en la salida y buscar un template para cada uno de sus hijos. Si hay mas de una template que puede tomar a uno de los hijos, XSLT llama a la template mas especifica.

El algoritmo tambien recorre el árbol de arriba a abajo y de izquierda a derecha

## Sentencias para Crear las Reglas de los Templates

### Generación de nuevos tags

Para generar un nuevo elemento se utiliza el constructor de `element`. Para darle un valor se lo debe poner dentro del tag.

```xml
<xsl:element name="ElementName"/>
```

Para generar un nuevo atributo se utiliza el constructor de `attribute` dentro de un elemento. Para darle un valor se le puede asignar dentro del tag o simplemente utilizando el atributo `select`.

```xml
<xsl:attribute name="AttrName"/>
```

### Extracción del Valor de un Nodo

Se utiliza la función `value-of`:

```xml
<xsl:value-of select="XPathExpression"/>
```

### Loop

Permite iterar sobre una colección de nodos o elementos.

```xml
<xsl:for-each select="XPathExpression"/>
```

### Orden dentro de un loop

Permite ordenar los elementos dentro de un `for-each`. Tiene un argumento opcional llamado `order` que permite asignarle un valor ascendiente (`ascending`) o descendiente (`descending`). El `select` indica sobre que conjunto de nodos se va a operar.

```xml
<xsl:sort select="XPathExpression"/>
```

### Decisión

Permite el uso de la sintaxis `if` y `switch`. 

La sintaxis del `switch ` es:

```xml
<xsl:choose test="var">
	<xsl:when test="expression">
    ...
    </xsl:when>
    ...
    <xsl:otherwise>
    ...
    </xsl:otherwise>
</xsl:choose>
```

En el caso del `if`, no tiene `else`:

```xml
<xsl:if test="Condition">
...
</xsl:if>
```

### Variables

Se crea una variable con un nombre y un valor. A la hora de usarla se debe utilizar el símbolo `$` antes del nombre. Las variables definidas fuera de un template son **globales**. El valor puede asignarse con `select` o poniéndolo dentro del tag.

```xml
<xsl:variable name="NameVar" select="value"/>
```

```xml
<xsl:variable name="NameVar">
	value
</xsl:variable>
```

### Salida

Se le puede decir a XSLT a que tipo de documento quiero que me escriba todo lo que estoy haciendo. Esto se hace con el elemento `output` como hijo de `stylesheet` o `transform`.



