# Cifrado en Bloque

Esta definidos para mensajes de tamaño fijo:

- $\text{Gen}() = k \in \{0,1\}^n$
- $\text{Cod}_k(m) = c \in \{0,1\}^b$
- $\text{Dec}_k(c) = m \in \{0,1\}^b$

Estas limitaciones puede ser superadas de la siguiente forma:

- **Simple Pad**: Permite cifrar texto mas chico que el tamaño de un bloque. Lo completa con 0 y a la hora de descifrarlo es necesario saber el tamaño real del mensaje.
- **Des Pad**: Permite cifrar texto mas chico que el tamaño de un bloque. Agrega un bit 1 y el resto en 0. Ademas se puede agregar un bloque completo de padding.
- **Modos de Encadenamiento**: Permiten extender el uso de primitivas a mensajes mas grandes que el bloque, partiéndolo en mas de un bloque.

## Modos de Encadenamiento

### Electronic Cook Book (ECB)

<img src="Resources/08 - Cifrado en Bloques/Screen Shot 2022-04-27 at 15.07.40.jpg" alt="Screen Shot 2022-04-27 at 15.07.40" style="zoom:50%;" />

Este metodo trata al mensaje original como un conjunto de bloques independientes y aplica el cifrado a cada uno. **No es CPA-Secure**.

### Cipher Block Chain (CBC)

Este metodo es serial y utiliza la salida de un bloque como entrada para el proximo. Para el valor inicial requiere de un IV, ademas de la clave:

<img src="Resources/08 - Cifrado en Bloques/Screen Shot 2022-04-27 at 15.10.05.jpg" alt="Screen Shot 2022-04-27 at 15.10.05" style="zoom:50%;" />

Es **CPA-Secure** con IVs aleatorios.

### Cipher Feedback (CFB)

El mecanismo CFB se utiliza cuando hay poca disponibilidad de memoria. La idea es tratar a estos criptosistemas de bloque como si fueran sistemas de flujo. Para el primer bloque se encripta el IV con la clave y luego se realiza un xor con el texto plano. Para los próximos bloques, se cifran el bloque anterior y luego se realiza un xor con el mensaje actual.

<img src="Resources/08 - Cifrado en Bloques/Screen Shot 2022-04-27 at 15.12.06.jpg" alt="Screen Shot 2022-04-27 at 15.12.06" style="zoom:50%;" />

Es **CPA-Secure** con IVs aleatorios.

### Output Feedback (OFB)

Construye una transformación de flujo a partir de una de bloque, y permite calcular los bits de la transformación por adelantado. Es similar a CFB, pero con la diferencia que el se utiliza el cifrado del bloque anterior, sin hacer un xor con el mensaje de texto plano:

<img src="Resources/08 - Cifrado en Bloques/Screen Shot 2022-04-27 at 15.39.45.jpg" alt="Screen Shot 2022-04-27 at 15.39.45" style="zoom:50%;" />

Es **CPA-Secure** con IVs aleatorios.

### Counter

Utiliza un contador para generar secuencias de bits de clave. Se concatena la clave con el valor de un contador llamado nonce y se utiliza eso para poder cifrar al texto plano. Permite el acceso aleatorio y es muy util en ambientes con capacidad de procesamiento paralelo.

<img src="Resources/08 - Cifrado en Bloques/Screen Shot 2022-04-27 at 15.40.35.jpg" alt="Screen Shot 2022-04-27 at 15.40.35" style="zoom:50%;" />

Es **CPA-Secure** si no se repiten los pares (k, nonce).

## Criptosistemas de Bloque

Utilizan primitivas de cifrado en bloque como lo son DES, AES y 3-DES, y las unen junto a un modo de encadenamiento.

Si este modo de encadenamiento es CBC, Counter, OFB o CFB, entonces es **CPA-Secure**.

No son **CCA-Secure**.

### Seguridad

Las pruebas son por deducción a propiedades de la primitiva subyacente. Se trata de encontrar casos donde las falencias de las primitivas base no fueron arregladas. 

Para que no se rompan estos métodos, la primitiva se debe comportar como una función pseudoaleatoria. Esto significa que no es posible distinguir a la función $f(x) = \text{Enc}_k(x)$ De una función tomada al azar del conjunto de funciones del mismo dominio.

