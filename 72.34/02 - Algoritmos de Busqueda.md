# Algoritmos de Busqueda de Texto

## Algoritmos Foneticos

Los algoritmos foneticos son algoritmo que buscan comparar palabras en base a como suenan en vez del texto que esta escrito. Dentro de estos se encuentran **soundex** y **metaphone**

### Soundex

Soundex funciona reemplazando letras por numeros y luego generando un codigo especial de 4 caracteres, que describe a una palabra. Luego se puede usar este codigo para verificar si dos string sdistintos son similares o no.

Para implementar soundex hay que seguir los siguientes pasos:

1. Guardar la primer letra y eliminar todas las ocurrencias de los siguentes caracteres: *A, E, I, O, U, Y, H, W*

2. Para todas las letras salvo la primera, tengo que reemplazarlas segun la siguente tabla:

   |         Letras         | Sonido |
   | :--------------------: | :----: |
   |       B, F, P, V       |   1    |
   | C, G, J, K, Q, S, X, Z |   2    |
   |          D, T          |   3    |
   |           L            |   4    |
   |          M, N          |   5    |
   |           R            |   6    |

3. Si antes de aplicar el paso 1 habia dos o mas letras con el mismo sonido adyacentes, entonces solo me quedo con la primera aparicion.

4. Si hay dos sonidos iguales separados por *H* o *W*, entonces solo me quedo con la primera aparicion. Si hay dos sonidos iguales separados por una vocal, entonces me quedo con las dos instancias.

5. Si al finalizar todos los pasos el codigo te queda menor a 4 caracteres (primer letra y 3 sonidos), entonces completar con 0s al final del codigo. Si el codigo tiene mas de 4 caracteres, quedarse con la primer letra y los primeros 3 sonidos.

Este algoritmo produciria los siguentes resultados:

| Palabra  | Codigo |
| :------: | :----: |
|  ROBERT  |  R163  |
|  RUBIN   |  R160  |
| ASHCRAFT |  R261  |
| PFISTER  |  P236  |

Aca esta la implementacion en Java 1.8 del algoritmo:

```java
// Guardo la primera letra del string
String firstLetter = searchableText.substring(0,1);
		
// Reemplazo las letras que suenan similar por valores numericos
// Esta busqueda todavia teien que ser procesada.
char arr[] = (searchableText.replaceAll("(A|E|I|O|U|Y)","0"))
						.replaceAll("(H|W)", "9")
						.replaceAll("(B|P|V|F)","1")
						.replaceAll("(C|G|J|K|Q|S|X|Z)", "2")
						.replaceAll("(D|T)", "3")
						.replace('L', '4')
						.replaceAll("(M|N)", "5")
						.replace('R', '6').toCharArray();
		
// Si encuentro una H o W, que esta entre dos letras con el mismo sonido, entonces
// agrego una H o W en la letra anterior
for(int i = 1 ; i < arr.length-1 ; i++) {
	if(arr[i] == '9' && arr[i-1] == arr[i+1]) {
		arr[i-1] = '9';
	}
}
		
// Si hay dos letras iguales, borro las repetidas y solo dejo una
for(int i = 0 ; i < arr.length-1 ; i++) {		
	int t = i+1;	
	while(t < arr.length && arr[i] == arr[t]) {
		arr[t]='0';
		t++;
	}	
}
		
		// Calculo la el sonido de la primer letra
String temp = firstLetter.replaceAll("(A|E|I|O|U|Y)","0")
						.replaceAll("(H|W)", "9")
						.replaceAll("(B|P|V|F)","1")
						.replaceAll("(C|G|J|K|Q|S|X|Z)", "2")
						.replaceAll("(D|T)", "3")
						.replace('L', '4')
						.replaceAll("(M|N)", "5")
						.replace('R', '6');
		
boolean addLetter = false;
// Si el sonido de la primer letra es igual al que quedo despues de procesar al sting, escribo el 
// caracter en el primer lugar. (saco el sonido).
// Si son distintos, voy a tener que eliminar el primer sonido
if(temp.charAt(0) == arr[0]) {
	arr[0] = firstLetter.charAt(0);
}else {
	addLetter = true;
}
// Elimino los sonidos 0 y 9
String str = new String(arr).replaceAll("(0|9)", "");
		
// Agrego al primer letra en caso de que no sean iguales los sonidos
if(addLetter) {
	str = firstLetter + str;
}
				
// Aseguro que devuelva un codigo de 4 caracteres
while(str.length()<4 ) {
	str += '0';
}
		
return str.substring(0, 4);
```

### Metaphone

Metaphone es otro algoritmo fonetico, pero la diferencia en este caso es que no genera un codigo de 4 caracteres, sino que para cada string se genera una codificacion especial, y esta codificacion es la que va a ser utilizada para calcular la simialridad.

No se vio en clase este algoritmo por que tiene muchas reglas, por eso utilizamos una libreria de Java que lo calculaba. Pero para ver si dos strings eran similares, tuvimos que implementarlo nosotros. 

Esta implementacion en sencilla, simplemente tomas a la codificacion mas larga  y luego vas iterando sobre ambas, si tienen el mismo caracter en la misma posicion, aumentas un contador. Luego de iterar por el arrelgo de menor tama;o, se divide la cantidad de matches (contador) que se consiguieron por la longitud de la codificacion mas larga. Cuanto mas cercano a 1 sea el valor, mas similares son.

Aca se muestra una implementacion en Java de esta comparacion:

```java
String encA = GenerateEncoding(a);
String encB = GenerateEncoding(b);		
double max, actual=0;
		
if(encA.length() > encB.length()) {
	max = encA.length();
	for(int i = 0 ; i < encB.length() ; i++)
		if(encA.charAt(i) == encB.charAt(i))
			actual++;
}else {
	max = encB.length();
	for(int i = 0 ; i < encA.length() ; i++)
		if(encA.charAt(i) == encB.charAt(i))
			actual++;
}
		
return actual/max;
```

## Otros Algoritmos

Los siguentes algoritmos tambien permiten encontrar la similaridad entre strings pero no lo hacen de manera fonetica.

### QGram

QGram consiste en partir a las palabras en tokens de longitud Q y luego ser cuantos de esos tokens estan presentes en cada palabra.

El algoritmo para crear estos tokens se puede ver en la siguente implementacion de java:

```java
List<String> tokens = new LinkedList();

for(int i = 1-q; i < input.length(); i++) {
	StringBuilder bld = new StringBuilder();

    // Caso en el que no hay suficientes caracteres por que es el comienzo del string
	if(i<0) {
		int t = i;
		while(t < 0) {
			bld.append('#');
			t++;
		}
		while(Math.abs(t-i) < q) {
			bld.append(input.charAt(t++));
		}
     // Caso general, hay suficientes caracteres para llenar el token
	}else if(i > input.length() - q) {
		int t = i;
		while(t < input.length()) {
			bld.append(input.charAt(t++));
		}
		while(Math.abs(t++-i) < q) {
			bld.append('#');
		}
	}
    // Caso particular donde el stirng esta terminando y no hay suficientes caracteres para completar
    // el token
	else {
		int t = i;
		while(Math.abs(t-i) < q) {
			bld.append(input.charAt(t++));
		}
	}
	tokens.add(bld.toString());		
}	
return tokens;
```

Para calcular la similaridad entre dos listas de tokens generados con el algoritmo anterior solo necesito contar la cantidad de tokens que se repiten en ambos y los que no, por lo que se calcula como:
$$
\frac{\#A\cap B}{\#A\cup B}
$$
Aca se puede ver una implementacion en java de este calculo:

```java
Double a= (double) (TriGramA.size() + TrigramB.size() - GetNonIntesectors());
Double b = (double)(TriGramA.size() + TrigramB.size());

return Double.valueOf(a /b );
```

### Levenshtein Distance

Este algoritmo sirve para calcular la distancia (diferencia) que existe entre dos palabras. Para calcular esto se debe construir una matriz donde en la fila superior este ubicado el primer string y en la primer columa el segundo string:

```java
                                        *	     C  H  A  U 
                                        * 	  0  1  2  3  4	
                                        *  H  1				
                                        *  O  2
                                        *  L  3
                                        *  A  4
```

Luego, el resto de las posiciones de la matriz se calcula con la siguente regla:

Tomo el menor valor de los siguentes:

- La posicion en diagonal hacia atras + 1 si las letras actuales son distintas, o + 0 si son iguales.
- El valor en la posicion inmediata superior + 1.
- El valor en la posicion inmediata izquierda + 1.

En este ejemplo, para calcular el valor de la posicion `[C,H]` voy a realizar los siguentes calculos:

- `valor en diagonal = 0` y `C != H` entonces el resolutado es `0 + 1 = 1`
- `valor superior = 1 + 1 = 2`
- `valor izquierda = 1 + 1 = 2`

Y como el minimo valor de estos es `1`, entonces `[C,H] = 1`.

La matriz de este ejemplo terminaria como:

```java
                                      	* 	     C  H  A  U
                                      	*     0  1  2  3  4
                                      	*  H  1  1  1  2  3
                                      	*  O  2  2  2  2  3
                                      	*  L  3  3  3  3  3
                                      	*  A  4  4  4  3  4
```

Y la distancia entre los dos strings seria `4`, es decir el elemento en el tope inferior derecho.

Ahora se va a mostrar una implementacion en java:

```java
// SetUp
iSize = a.length()+1;
jSize = b.length()+1;
		
// Genero una matriz, poniendo una palabra como titulo de las filas y la otra como titulo de las columnas
		
int[][] matrix = new int[iSize][jSize];
	
for(int i = 0 ; i < a.length()+1 ; i ++) {
	matrix[i][0] = i;
}
for(int i = 0 ; i < b.length()+1 ; i ++)
{
	matrix[0][i] = i;
}
	
a = a.toUpperCase();
b = b.toUpperCase();

int values[] = new int[3];
			
for(int i = 1; i < a.length() + 1 ; i ++ ) {
	for(int j = 1; j < b.length()+1 ; j++) {
		
		// Si los caracteres anteriores son iguales, entonces la distancia puede ser
		// la distancia anterior. Si son distintos es la anterior +1
		values[0] = matrix[i-1][j-1] + (a.charAt(i-1) == b.charAt(j-1)? 0:1);
		// La distancia tambien puede ser la de arriba +1
		values[1] = matrix[i-1][j] + 1;
		// o la de abajo +1
		values[2] = matrix[i][j-1] + 1;
			
		// Elijo el menor valor de los 3
		Arrays.sort(values);
		matrix[i][j] =values[0];				
			
	}
}

return matrix[iSize-1][jSize-1];
```

### KMP 

??