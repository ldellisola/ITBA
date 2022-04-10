# Cifrado Simetrico

## One Time Pad (OTP)

Atribuido a Verman en 1917

<img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-10 at 16.22.19.png" alt="Screen Shot 2022-03-10 at 16.22.19" style="zoom:50%;" />

Cumple con la propiedad de secreto perfecto, entonces para cualquier par de texto plano y cifrado, no se puede encontrar una relación entre si.

Existe un isomorfismo entre todos los sistemas que tienen secreto perfecto, es decir que se pueden reducir al OTP. El problema es que el secreto perfecto es impráctico.

### Problemas

- Solo puede cifrar un mensaje tan grande como la clave.

- No se pueden reusar las claves, ya que se pierde el secreto perfecto y es vulnerable.
- La clave debe ser aleatoria.

## Seguridad Computacional

Por los problemas que trae el secreto perfecto, se desarrollo el concepto de seguridad computacional. Este concepto relaja dos aspectos:

- Limita los escenarios a solo los posibles, es decir, si se tardan años en descifrar un mensaje, entonces lo consideramos seguro.
- Limitar garantias. El sistema permite que sea posible descifrar un mensaje con una clave definida al azar.

Este nuevo concepto garantiza seguridad solo contra adversarios limitados y acepta una pequeña probabilidad de que el atacante tenga éxito.

## Criptosistemas de Flujo
Estos criptosistemas de flujos no son seguros bajo [múltiples cifrados](#Multiples Cifrados), ya que:
$$
\array{
c_1 = m_1 \oplus G(s)\\
c_2 = m_2 \oplus G(s) \\
}

 \implies
c_1 \oplus c_2 = m_1 \oplus m_2
$$

## Generadores Pseudoaleatorios

La idea de estos algoritmos deterministicos es que la secuencia de salir parezca aleatoria. Comienzan con una seed y luego genera el resto de la secuencia con operaciones xor:

<img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-10 at 17.10.57.png" alt="Screen Shot 2022-03-10 at 17.10.57" style="zoom:50%;" />

Básicamente es una función a la cual nadie le encontró una forma de que no pase un test de aleatoriedad.

<img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-10 at 17.15.21.png" alt="Screen Shot 2022-03-10 at 17.15.21" style="zoom:50%;" />

En términos matemáticos, no se pudieron probar la existencia de este tipo de funciones.


## Pruebas de Seguridad

Ponen a prueba alguna característica en particular del sistema. Son una serie de pasos que prueban un algoritmo. El atacante puede ganar o perder la prueba, y esta puede ser repetida, esto permite medir la probabilidad de éxito de un atacante.

### Prueba de indistinguibilidad

Esta prueba tiene un algoritmo adversario y un criptosistema, y se sigue por estas reglas:

<img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-10 at 17.24.11.png" alt="Screen Shot 2022-03-10 at 17.24.11" style="zoom:50%;" />

La idea simplemente consiste en generar dos mensajes, encriptarlos y luego el atacante tiene que elegir que mensaje cifrado proviene de cada mensaje de texto plano. Un criptosistema gana esta prueba cuando la probabilidad de que un adversario gane esta prueba es $0.5$.

## Nivel de Seguridad

El nivel de seguridad es una variable que relaciona la cota en el poder de un adversario con la probabilidad de éxito que tendrá. Dado un nivel de seguridad **n**, se espera que:

- Un adversario corra algoritmos de orden PPT(**n**)

- La probabilidad de excito sea una función despreciable en **n**:
  $$
  \epsilon(n) \text{ es despreciable} \iff \lim\epsilon(n) < \frac{1}{n^k}
  $$

### Estado de un Criptosistema

- **Criptosistema Seguro**: Cumple con las expectativas de su modelo de seguridad.
- **Criptosistema Debilitado**: Existen adversarios con probabilidades no despreciables de éxito, pero el esfuerzo es muy grande o las condiciones son muy difíciles.
- **Criptosistema Quebrado**: Existen adversarios con probabilidades no despreciables de éxito en tiempos practicables.

Un criptosistema puede ser seguro y quebrado al mismo tiempo, ya que puede pasar una prueba de seguridad y no otra.

## Multiples Cifrados

Es una prueba para tratar de romper cifrados.  Se llama **multiple message eavesdropping test**: $\text{Mul}_{A,\pi}$:

Dado un adversario $A$ y un criptosistema $\pi$:

<img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-17 at 16.18.18.png" alt="Screen Shot 2022-03-17 at 16.18.18" style="zoom:50%;" />

Entonces si:
$$
\text{Mul}_{A,\pi} = 1 \Rarr b = b'
$$
Y $A$ gana.

Si $Pr[\text{Mul}_{A,\pi} =1] = 0.5 + \epsilon$, entonces $\pi$ es indistinguible.

## Cifrado Probabilistico

Si una función de cifrado es determinista, entonces no es segura bajo múltiples cifrados. El adversario puede aplicar el método anterior para cualquier criptosistema donde $e_k(x)$ es constante.

Es importante no reutilizar la clave, entonces se agrega un valor a la función generadora, que no deberá repetirse para una misma clave, a esto lo llamamos **nonce** o **IV**.

Hay dos formas de implementar esto, mediante:

- **Modo sincronizado** 

  <img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-17 at 16.30.58.png" alt="Screen Shot 2022-03-17 at 16.30.58" style="zoom:50%;" />

- **Modo no sincronizado**

  <img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-17 at 16.31.18.png" alt="Screen Shot 2022-03-17 at 16.31.18" style="zoom:50%;" />

### Ataques

#### Ataque de Texto Plano Escogido

El atacante tiene la capacidad de engañar al sistema para que le cifre cualquier mensaje. Básicamente tiene acceso a una función que puede generar cifrados sin tener la clave.

Dado un adversario $A$ y un cirptosistema $\pi$, el ataque $\text{CPA}_{A,\pi}$ consiste en: 

<img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-17 at 16.45.24.png" alt="Screen Shot 2022-03-17 at 16.45.24" style="zoom:50%;" />

$\text{CPA}_{A,\pi} = 1$ si $b=b'$ (A gana)

Propiedades del CPA:

- Un criptosistema deterministic no puede ser CPA-Secure.

- Si un criptosistema es CPA-Secure para un mensaje, también lo es para múltiples mensajes.

- Si podemos encontrar un criptosistema que sea CPA-Secure para mensajes de tamaño limitado, existe una construcción que nos permite extenderlo a mensajes de tamaño arbitrario. Esto se hace partiendo el mensaje de mayor tamaño en pequeñas partes que pueden ser cifrados con el sistema actual, y ese set de mensajes cifrados es CPA-Secure:

  <img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-17 at 16.53.04.png" alt="Screen Shot 2022-03-17 at 16.53.04" style="zoom:50%;" />

## Cifrado en Bloque

Las primitivas de cifrados en bloque serian como pequeños bloques deterministicos, que funcionan con varias falencias conocidas. En estos criptosistemas, los bloques y las claves tienen una cantidad fija de caracteres, no son de longitud ilimitada.

<img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-17 at 16.55.14.png" alt="Screen Shot 2022-03-17 at 16.55.14" style="zoom:50%;" />

Para crear criptosistemas de bloque podemos combinar varias de estas primitivas para eliminar las limitaciones y las fallas de seguridad. Un ejemplo de esto es la extension de los criptosistemas de cifrado en bloques y extenderla a una longitud arbitraria. Esto se logro con **padding** y **chainning**. 

Con padding se pueden guardar mensajes mas cortos que el tamaño del bloque:

- **Simple Pad**: Simplemente completa con 0, y es necesario saber el tamaño real del mensaje.
- **Des Pad**: Agregamos un bit 1 al principio y luego completamos con 0s. Este algoritmo es determinístico y no se necesita saber el tamaño del mensaje.

Con chainning, se pueden guardar mensajes de mayor tamaño que un bloque. Para lograrlo solamente se parte el mensaje original en varias partes menores que el tamaño del bloque.

### Modos de Encadenamiento

El metodo de encadenamiento **ECB** no es CPA-Secure, y trata al mensaje original como un conjunto de bloques independientes:

<img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-17 at 17.04.14.png" alt="Screen Shot 2022-03-17 at 17.04.14" style="zoom:50%;" />

Simplemente se parte al mensaje en partes y se lo cifra con la misma clave a todos los bloques. Fallan por que estas primitivas de bloque son deterministas.

El metodo de encadenamiento **CBC** implica separar el mensaje en bloques modificarlo, antes de cifrarlo. La idea es tomar como entrada tanto el texto plano actual como el bloque cifrado anterior:

<img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-17 at 17.08.07.png" alt="Screen Shot 2022-03-17 at 17.08.07" style="zoom:50%;" />

Para el bloque inicial, se requiere un IV aleatorio. 

El mecanismo **CFB** se utiliza cuando hay poca disponibilidad de memoria. La idea es tratar a estos criptosistemas de bloque como si fueran sistemas de flujo. Para el primer bloque se encripta el IV con la clave y luego se realiza un xor con el texto plano. Para los próximos bloques, se cifran el bloque anterior y luego se realiza un xor con el mensaje actual.

<img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-17 at 17.15.48.png" alt="Screen Shot 2022-03-17 at 17.15.48" style="zoom:50%;" />

El mecanismo **OFB** es similar (y también se usa con consicioes de memoria limitada), pero con la diferencia que el se utiliza el cifrado del bloque anterior, sin hacer un xor con el mensaje de texto plano:

<img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-17 at 17.17.51.png" alt="Screen Shot 2022-03-17 at 17.17.51" style="zoom:50%;" />

El encadenamiento **counter** utiliza un contador para generar una secuencia de vitalidad de clave. Se concatena la clave con el valor de un contador llamado nonce y se utiliza eso para poder cifrar al texto plano. 

<img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-17 at 17.22.47.png" alt="Screen Shot 2022-03-17 at 17.22.47" style="zoom:50%;" />

Este modo permite el acceso aleatorio y es muy útil en ambientes con capacidad de procesamiento paralelo.

### Seguridad de Cifrado por Bloques

Las pruebas son por deducción a propiedades de la primitiva subyacente. Se trata de encontrar casos donde las falencias de las primitivas base no fueron arregladas. 

Para que no se rompan estos métodos, la primitiva se debe comportar como una función pseudoaleatoria. Esto significa que no es posible distinguir a la función $f(x) = \text{Enc}_k(x)$ De una función tomada al azar del conjunto de funciones del mismo dominio.

- CBC es CPA-Secure con IVs aleatorios
- OFB y CFB son CPA-Secure con IVs aleatorios
- Counter es CPA-Secure si no se repite el par clave, nonce.

## Data Encryption Standard (DES)

DES fue desarrollado por IBM y adoptado por el gobierno de EEUU como un estándar para usos no militares. Este sistema trabaja con textos planos binarios, con una entrada y salida de 64 bits. La clave es de 64 bits, con 56 bits efectivos.

DES sigue un modelo mas general (Red de Feistel), donde se parte el texto en dos partes e ir transformando una parte del texto, para luego invertirlo.

<img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-17 at 18.01.21.png" alt="Screen Shot 2022-03-17 at 18.01.21" style="zoom:50%;" />

Este proceso se repite 16 veces. La función de transformación se define de la siguiente forma:

<img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-17 at 18.03.50.png" alt="Screen Shot 2022-03-17 at 18.03.50" style="zoom:50%;" />

## 3-DES

Es una variante fuerte de DES que consiste en seleccionar 3 claves distintas e independientes. La idea es que en vez de tener que romper una sola llave, el atacante debería romper 3 claves:
$$
c = \text{Enc}_{k_1}(\text{Dec}_{k_2}(\text{Enc}_{k_3}(p)))
$$
En realidad, este metodo brinda una seguridad del orden de 112 bits, debido a un ataque conocido como meet-in-the-middle (medio fuerza bruta). Pero este criptosistema es inmune a los métodos de ataque diferencial y lineal. 

Otro problema de este método es que es 3 veces más lento que DES.

## AES

AES fue el reemplazo de DES al ser seleccionado ganador de un concurso internacional abierto. Este criptosistema es orientado a bloques de 128 bits, con claves que pueden ser de 128, 192 o 256 bits. 

<img src="Resources/02 - Cifrado Simetrico/Screen Shot 2022-03-17 at 18.25.35.png" alt="Screen Shot 2022-03-17 at 18.25.35" style="zoom:50%;" />

Hoy en dia la primitiva base de AES es la recomendada a utilizar.

Se dividen a los 128 bits en 4 bloques compuestos por 4 bytes donde se realiza una transformacion estática. Se permutan los bits entre los bloques y luego se realiza una transformación lineal invertible de cada byte en función de los 4 que forman el mismo grupo. Finalmente se agrega una clave utilizando un xor con cada parte de la clave.



