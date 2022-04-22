# Mac y Hash

## 1

> Analizar por qué no poseen seguridad los siguientes MAC:
>
> - $\text{Mac}_k(m) = G(k) \oplus m, G(k)\text{ es un generador pseudoaleatorio}$
>   



> - $\text{Mac}_k(m) = k \oplus \text{first\_k\_bits}(m)$



> - $\text{Mac}_k(m) = \text{Enc}_k(|m|)$



## 2

> Considerar el siguiente algoritmo de código de autenticación de mensaje (MAC).
>
> - El mensaje *m* es dividido en bloques de 128 bits cada uno (completando con bits en cero si es necesario)
>
> - Se efectúa un XOR entre todos los bloques, obteniendo un único bloque de resultado *R* de 128 bits. La función MAC se aplica luego al bloque *R* , en lugar de aplicarse a *m* .
>
> 1. Describir por lo menos una manera de encontrar dos mensajes $m \neq m'$ tales que los mensajes aún con diferentes significados tienen el mismo valor de MAC.	

La operación xor no depende del orden de los miembros, por lo que:
$$
\text{ABC} \oplus \text{DEF} \oplus \text{GHI} = \text{GHI} \oplus \text{ABC} \oplus \text{DEF}
$$
Podemos aprovechar este problema para romper a esta función, a pesar de que la función MAC utilizada luego sea segura. Por ejemplo, si tenemos los siguientes mensajes:

- `0xF0F0F0F0F0F0F0F0A1A1A1A1A1A1A1A1`
- `0xA1A1A1A1A1A1A1A1F0F0F0F0F0F0F0F0`

Como tienen los mismos bloques, pero en distinto orden, $R$ va ser el mismo para ambos, igual que la función MAC

> 2. Implementar el algoritmo y probarlo para la situación propuesta en (1)

Tomo los siguientes mensajes:

- $m=$`0xF0F0F0F0F0F0F0F0A1A1A1A1A1A1A1A1`
  $$
  R =\text{0xF0F0F0F0F0F0F0F0} \oplus \text{0xA1A1A1A1A1A1A1A1} = \text{0x5151515151515151}
  $$
  

- $m’=$`0xA1A1A1A1A1A1A1A1F0F0F0F0F0F0F0F0`
  $$
  R' = \text{0xA1A1A1A1A1A1A1A1} \oplus  \text{0xF0F0F0F0F0F0F0F0} = \text{0x5151515151515151}
  $$

Entonces para ambos mensajes, $m \neq m'$, pero $R = R'$, por lo que la función MAC se van aplicar sobre el mismo valor, produciendo el mismo mensaje.

## 3

>  Considerar la siguiente función de hash h():
>
> - La función acepta mensajes de cualquier longitud.
> - La función retorna una cadena de bits de 32 ceros si la entrada tiene un número par de caracteres, y retorna una cadena de bits de 32 unos si la entrada tiene un número impar de caracteres.

$$
h(x) = 
\left\{
\array{
	\{0\}^{32} & |x|\mod 2  = 0 \\
	\{1\}^{32} & |x|\mod 2  = 1 \\
}
\right.
$$

> 1. ¿es esta una función de hash válida para criptografía? Analizar los tres niveles de seguridad.

No es una función de hash valida para criptografía:

- **Resistencia a preimagenes**: Cumple con esta propiedad, ya que a partir de una cadena completa de $1$s o $0$s es imposible encontrar el mensaje inicial.
- **Resistencia a segundas imagenes**: No cumple con esta propiedad, ya que todos los mensajes de longitud par tienen la misma imagen, al igual que los de longitud impar.
- **Resistencia a colisiones**: No cumple con esta propiedad, ya que cualquier cadena de $1$s tiene infinitos mensajes que la pueden generar.

> 2. ¿cuál es la probabilidad de que dos entradas $x_1$ y $x_2$ elegidas aleatoriamente colisionen en h()?

La probabilidad es del 50%, ya que una cadena elegida aleatoriamente puede ser de longitud par o impar.

## 4

> 1. Describir la construcción **CBC-MAC** e indicar para qué sirve.

Una CBC-MAC es una MAC creada a partir del metodo CBC. Esta función se define como:

- $\text{Gen}: k \larr {0,1}^n$
- $\text{Mac}$:
  - Sea $m = m_1|m_2|\dots|m_r$ un mensaje partido en $r$ bloques.
  - Sea $t_0 = 00\dots0$ del mismo tamaño del bloque.
  - $t_i = F_k(t_{i-1} \oplus m_i)$
  - $\text{Mac}_k(m) = t_r$
- $\text{Vrfy}: \text{Vrfy}_k(m,t) = 1 \iff \text{Mac}_k(m)=t$ 

Esta función MAC es solo segura para mensajes de igual longitud ==Preguntar por que.==, aunque hay extensiones de las mismas que son seguras para mensajes de longitud arbitraria.

> 2. Comparar **CBC-MAC** con **CBC-mode** para encripción.

La CBC-MAC y el CBC-mode para encripción son el mismo algoritmo con dos excepciones. Para calcular la MAC, solo nos interesa que se genere una imagen única del mensaje original, por lo que solo nos quedamos con el ultimo bloque. Esto permite que no se pueda realizar el proceso inverso para obtener el mensaje original. Ademas, los IVs utilizados durante la encripción son reemplazados por 0s al calcular la MAC.

> 3. ¿Cuáles son, según Katz, las opciones seguras de uso de CBC-MAC?

==No entiendo que pregunta==

> 4. ¿Para qué sirve la “Transformación de Merkle-Darmgard”?

Es un modelo iterativo que permite realizar hashes de mensajes. La idea consiste en primero preprocesar el mensaje para ajustar el tamaño del bloque y agregar un bloque con el tamaño, para luego pasar por una función de compresión, que reduce el mensaje a un cierto tamaño.

Esta función de compresión es similar a las funciones de hash, pero opera sobre bloques muchos más pequeños, y la seguridad proviene de una función de encriptación que opera dentro de la misma.

## 5

> Con el comando dgst se puede obtener el hash (digesto o resumen) de un mensaje. Luego se puede usar, entre otras cosas, para firma digital.
>
> 1. Calcular el hash MD5 de una frase (por ejemplo “hoy es el primer lunes de abril”)

```bash
$ echo "Hoy es el primer lunes de abril" | openssl dgst -md5
(stdin)= 916f4c31aaa35d6b867dae9a7f54270d
```

> 2. Calcular el hash SHA-1 de la misma frase.

```bash
$ echo "Hoy es el primer lunes de abril" | openssl dgst -sha1 
(stdin)= 63bbfea82b8880ed33cdb762aa11fab722a90a24
```

> 3. ¿Qué diferencias se observan?

Son valores completamente distintos, la diferencia principal esta en la longitud del output del hash.

## 6

> Se tienen los nombres de alumnos y el hash de sus notas. Decir cuál es la nota de cada alumno. 
>
> Tener en cuenta que la nota se colocó en números y en letras, en la forma `nota_en_numeros nota_en_letras` (por ejemplo, 3 tres). Las notas son valores enteros, del 1 al 10. Se usó elalgoritmo SHA1:
>
> ```
> acuña: 			1daae8480ce1df09603d3db5388b900e8ce4b880
> centurion: 	164c22fd426d4215fc47d38964de80100a24f5ff
> hernandez: 	135fc9d048e923597cc806a51ebdcb1ccac553bf
> palacios: 	c736e54648efc18698499026ba1779e7785378a2
> rossi: 			c2fa01c8fdf749547317e985625f2512b2c4e0a6
> sanchez: 		7c1dfd9e7a101bc419752f623aa2c09352cac070
> garcía: 		86a76e0399c99c1d5b8c8751b7d5240b24b271f3
> zubeldia: 	c736e54648efc18698499026ba1779e7785378a2
> ```

Utilizando OpenSSL puedo calcular el hash de todas las notas:

```bash
$ openssl dgst -sha1 nota*.txt
"10 diez"  = c736e54648efc18698499026ba1779e7785378a2
"1 uno"    = 86a76e0399c99c1d5b8c8751b7d5240b24b271f3
"2 dos"    = 7c1dfd9e7a101bc419752f623aa2c09352cac070
"3 tres"   = 5be26a99a22052c8359de008244174f9ccd1c234
"4 cuatro" = 56ce34e0fb3b0a8f2432a510486af465ac915b3a
"5 cinco"  = c2fa01c8fdf749547317e985625f2512b2c4e0a6
"6 seis"   = 164c22fd426d4215fc47d38964de80100a24f5ff
"7 siete"  = 1daae8480ce1df09603d3db5388b900e8ce4b880
"8 ocho"   = 135fc9d048e923597cc806a51ebdcb1ccac553bf
"9 nueve"  = 70785b313d28667133dcb6b387f1de716172b087
```

Entonces podemos ver que tienen las siguientes notas:

```
acuña: 			7
centurion: 	6
hernandez: 	8
palacios: 	10
rossi: 			5
sanchez: 		2
garcía: 		1
zubeldia: 	10
```

