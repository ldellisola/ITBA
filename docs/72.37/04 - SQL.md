# SQL

## Comandos SQL

#### `CREATE TABLE`

Con este comando se crea una tabla con nombre:

```sql
CREATE TABLE name
(
	    name_attr1	type1	[restriction1][defailt1],
    	name_attr2	type2	[restriction2][defailt2],
    	name_attr3	type3	[restriction3][defailt3],
        ...
    CONSTRAINT restriction_name1 PRIMARY KEY(attr_list),
    CONSTRAINT restriction_name_2 UNIQUE(attr_list),
    CONSTRAINT restriction_name3
    			FOREIGN KEY(attr1_list),
     			REFERENCES name_table(attr2_list),
     				ON DELETE expresion1,
     				ON UPDATE expresion2 ;
);
```

Solo puede haber un atributo con `PRIMARY KEY` pero puede haber muchos con `UNOQUE`. El tema es que hay que cuando queremos traer una tabla por su valor de `UNIQUE`, hay que indicar que atributo es.

### `DROP TABLE`

Con este comando se destruye una tabla con sus contenidos

```sql
DROP TABLE table_name [CASCADE | RESTRICT]
```

Si se indica `CASCADE`, borra la tabla indicada y todas las tablas o vistas que las referencian. Si es `RESTRICT`, solo se puede elminar si no tiene dependencias.

### `ALTER TABLE`

Permite editar tablas:

```mssql
ALTER TABLE table_name
	ADD				attr_name type
	ADD CONSTRAINT	  contr_name	const_type    (att_name)
	ALTER
	DROP			attr_name	[CASCADE | RESTRICT]
	DROP CONSTRAINT   attr_name	[CASCADE | RESTRICT]
	
```

Este es un ejemplo de como trabajar con `UNIQUE` y referencias. Tenemos la tabla `empleado`con el campo `nombre `(`UNIQUE`) y la tabla `departamento `con el campo `jefe`. Vamos a unir estas tablas con un `FOREIGN KEY`:

```mssql
alter table departamento
 	add foreign key(jefe) references empleado(nombre);
```

De la misma forma, `departamento` tiene una `PRIMARY KEY` con el atributo `nombre`. Por otro lado `empleado` tiene un campo llamado `trabaja_en`. Vamos a unirlo con `FOREIGN KEY`:

```mssql
alter table empleado
	add foreign key(trabaja_en) references departamento;
```

### `UPDATE`

```mssql
UPDATE table_name SET (attr = newValue, attr2 = newValue) [WHERE condicion]
```

### `SELECT`

Permite hacer querrys sobre la base de datos:

```mssql
SELECT [DISTINCT]
	attr1 [AS newName],
	attr2 [AS newName],
	...
	attrN [AS newName]
	
	FROM table_list
		[WHERE condition]
```

la palabra `AS` permite mantener solo los atributos que queremos, de manera similar a la proyecion. Si queremos qued evuelva todas las columnas, entonces podemos reemplazar las lineas `attr [AS name]` por `*`.

#### `CROSS JOIN`

Hay varias formas de hacerlo, aca hay 3 distitintas:

```mssql
r CROSS JOIN s

(r CROSS JOIN s) as name

r , s
```

#### `Natural Join`

Las tuplas que no matchean no aparecen en el resultado

```sql
r NATURAL JOIN s

(r NATURAL JOIN s) AS new_relacion(...)
```

#### `Theta Join`

Es el join por defecto de SQL.

```mssql
r [INNER] JOIN s ON condition

(r [INNER] JOIN s ON condition ) AS relationship(attr_list_renamed)
```

#### `OUTER JOIN`

Las tuplas que no matchean aparecen con `null`.

```mssql
r LEFT OUTER JOIN s ON condition

r RIGHT OUTER JOIN s ON condition

r FULL OUTER JOIN s ON condition
```

#### `WHERE`

Se pueden usar los opearadores normales (`<,=,>,=<,=>,+,-,*,/`)  además de `IS NULL` e `IS NOT NULL`.

Para operar con strings, se usa el operador `LIKE`. Este operador permite usar wildcards con un solo caracter se usa `_` mientras que si machea con cualquier substring se usa `%`.

Para concatenar strings se usa `||`.

Los operadores `IN`, `=ANY` y `=SOME` son equivalentes. `IN` permite saber si un valor pertenece a un conjunto

```mssql
...
WHERE precio IN (10,20,30)

----------------------------------------------------------------------

SELECT nombre
FROM departamento
WHERE nombre NOT IN
				(SELECT vendido_por FROM articulo)
ORDER BY nombre DESC
```

`=ANY` devuelve verdadero si existe algun elemento del arreglo para el valor que buscamos y `=SOME` devuelve verdadero si hay almenos uno.

`EXISTS` permite saber si existe un valor dentro de una table. Esto funciona distinto que el `ANY` ya que evalua todo lo que ponga entre parentesis. Dice si hay o no tuplas en la tabla creada entre parentesis. Existe el comando `NOT EXISTS`.

```mssql
SELECT *
FROM libro
WHERE EXISTS (SELECT * from editorial
              WHERE libro.codEdit = editorial.code)

----------------------------------------------------------------------

SELECT nombre
FROM departamento
WHERE NOT EXIST  
			 (SELECT * from articulo
             	WHERE cendido_por = nombre)
ORDER BY nombre DESC
```

### Agregacion

Estas clausulas reciben un monton de valores y proveen un unico resolutado para ese grupo. Por ejemplo, suma todos los valores de un campo en una tabla.

Algunos ejemplos son:

- `COUNT`: 
- `SUM`: Devuelve la suma de los valores asignados
- `MAX`: Devuelve el mayor de los valores asignados
- `MIN`: Devuelve el minimo de los valores asignados
- `AVG`: Devuelve el promedio de los valores asignados

Excepto `MIN` y `MAX`, todas aceptan el comando `DISTINCT` dentro de sus querys.

Toda funcion de agregacion menos `COUNT` no se aplica sobre atributos `NULL` (los descarta), si se aplica sobre un conjunto vacio, devuelve una tupla con valor `NULL`.

Hay dos tipos de count: Si se llama a la funcion `COUNT(attrName)`  se descartan los null automaticamente y si esta lista esta vacia devuelve 0. Si se ejecuta `COUNT(*)` no descarta valores `null`.

Reglas para usar agregacion:

1. Las funciones de agregacion solo pueden aparecer dentro de las clausulas `SELECT` o `HAVING`. No pueden anidarse.
2. Si aparece una funcion de agregacion en esas clausulas, todo atrobuto que aparezca en ella debe o bien ser agregado o participar de `GROUP BY`.
3. La clausula `HAVING` no se puede usar si no hay un `GROUP BY`.

#### `GROUP BY`

Permite crear minigrupos en base a una lista de entradas y despues evaluarlo. Por ejemplo, este script devuelve una lista con el precio del item mas caro de cada proveedor.

```mssql
SELECT nombre, MAX(precio)
FROM proveedores
GROUP BY nombre
```



## Consultas

### `UNION`, `INTERSECT`, `EXCEPT`

Estos tres comandos permiten garantizar que no haya elementos repetidos, ya que SQL no lo hace por defecto.

### `Consultas anidadas`

Se puede meter dentro de `WHERE`, `FROM` y `HAVING` otra subquery entre parentesis:

```mssql
SELECT isbn, precioMod
FROM
	(SELECT isbn, precio *0.20
      FROM libro
    	   WHERE precio > 500
    ) AS list(isbn)
```

El select interno crea una nueva tabla temporal la cual va directamente a la entrada del select padre.



