# Primitivas

Son funciones y herramientas que se combinan para crear criptosistemas.

## Primitivas de Cifrado en Bloque

Esta definidos para mensajes de tamaño fijo:

- $\text{Gen}() = k \in \{0,1\}^n$
- $\text{Cod}_k(m) = c \in \{0,1\}^b$
- $\text{Dec}_k(c) = m \in \{0,1\}^b$

Estas limitaciones puede ser superadas de la siguiente forma:

- **Simple Pad**: Permite cifrar texto mas chico que el tamaño de un bloque. Lo completa con 0 y a la hora de descifrarlo es necesario saber el tamaño real del mensaje.
- **Des Pad**: Permite cifrar texto mas chico que el tamaño de un bloque. Agrega un bit 1 y el resto en 0. Ademas se puede agregar un bloque completo de padding.
- **Modos de Encadenamiento**: Permiten extender el uso de primitivas a mensajes mas grandes que el bloque, partiéndolo en mas de un bloque.

La seguridad proviene de 

### Modos de Encadenamiento

#### Electronic Cook Book (ECB)

<img src="Resources/Primitivas/Screen Shot 2022-04-27 at 15.07.40.jpg" alt="Screen Shot 2022-04-27 at 15.07.40" style="zoom:50%;" />

Este metodo trata al mensaje original como un conjunto de bloques independientes y aplica el cifrado a cada uno. **No es CPA-Secure**.

#### Cipher Block Chain (CBC)

Este metodo es serial y utiliza la salida de un bloque como entrada para el proximo. Para el valor inicial requiere de un IV, ademas de la clave:

<img src="Resources/Primitivas/Screen Shot 2022-04-27 at 15.10.05.jpg" alt="Screen Shot 2022-04-27 at 15.10.05" style="zoom:50%;" />

Es **CPA-Secure** con IVs aleatorios.

#### Cipher Feedback (CFB)

Utiliza solo la función $\text{Cod}$ y tiene menor complejidad para dispositivos embebidos.

<img src="Resources/Primitivas/Screen Shot 2022-04-27 at 15.12.06.jpg" alt="Screen Shot 2022-04-27 at 15.12.06" style="zoom:50%;" />

Es **CPA-Secure** con IVs aleatorios.

#### Output Feedback (OFB)

Construye una transformación de flujo a partir de una de bloque, y permite calcular los bits de la transformación por adelantado.

<img src="Resources/Primitivas/Screen Shot 2022-04-27 at 15.39.45.jpg" alt="Screen Shot 2022-04-27 at 15.39.45" style="zoom:50%;" />

Es **CPA-Secure** con IVs aleatorios.

#### Counter

Utiliza un contador para generar secuencias de bits de clave. Permite el acceso aleatorio y es muy util en ambientes con capacidad de procesamiento paralelo.

<img src="Resources/Primitivas/Screen Shot 2022-04-27 at 15.40.35.jpg" alt="Screen Shot 2022-04-27 at 15.40.35" style="zoom:50%;" />

Es **CPA-Secure** si no se repiten los pares (k, nonce).

## Data Encryption System (DES)

Es una primitiva simétrica.

### Como funciona?

DES funciona a base de un concepto llamado **Cajas de Feistel**. La idea de este metodo de encripcion es partir al mensaje en dos mitades. Se transforma a una mitad con una subclave generada y se intercambias las dos mitades de lugar. Este proceso se repite 16 veces.

<img src="Resources/Primitivas/Screen Shot 2022-04-27 at 15.52.36.jpg" alt="Screen Shot 2022-04-27 at 15.52.36" style="zoom:50%;" />

Para generar las subclaves, se parte a partir de una clave de 64 bits. A esta, por cada byte, se remueve el ultimo bit de paridad y se obtiene una clave de 56 bits. Esta clave de 56 bits es dividida en 2 claves de 28 bits, a partir de las cuales se generaran las subclaves.

Para cada subclave generada, primero tengo que shiftear los bits de cada clave en un lugar y luego se realiza un proceso de union que genera una clave de 48 bits, utilizada dentro de la caja de Feistel.

Las cajas de Feistel realizan el siguiente proceso:

<img src="Resources/Primitivas/Screen Shot 2022-04-27 at 15.57.19.jpg" alt="Screen Shot 2022-04-27 at 15.57.19" style="zoom:50%;" />

### Seguridad

Mientras que DES no esta completamente rotos, la seguridad efectiva paso de ser de $2^{56}$, a caer en un ataque que puede romper una clave en cuestion de horas con tan solo $2^{43}$ Intentos. Por eso se dice que es un criptosistema debilitado.

Estos ataques son por medio de criptoanalisis lineal y diferencial.

## 3-DES

Es una primitiva simétrica.

### Como funciona?

Es una variante de DES que consiste en seleccionar 3 claves independientes y calcular:
$$
c = \text{Cod}_{k_1}(\text{Dec}_{k_2}(\text{Cod}_{k_3}(m)))
$$
Esta version es mucho más lenta que la original, 3 veces exactamente.

### Seguridad

Aunque teóricamente la seguridad de este algoritmo debería ser del orden de 168 bits, esta es en realidad del orden de 112 bits debido a un ataque conocido como **man in the middle**.

Es inmune a los ataques realizados sobre DES.

## AES

Es una primitiva simétrica.

### Como funciona?

Es el reemplazo oficial de DES. Esta orientado a resolver bloques de 128 bits, con claves de 128, 192 o 256 bits.

<img src="Resources/Primitivas/Screen Shot 2022-04-27 at 16.12.13.jpg" alt="Screen Shot 2022-04-27 at 16.12.13" style="zoom:50%;" />

Funciona en 4 pasos:

- **Byte sub**: realiza una sustitución de valores segun una tabla derivada de invertir una matriz en campo $GF(2^8)$
- **Shift Row**: Permutation de bits.
- **Mix Column**: Transformación lineal invertible de cada byte en función de los 4 que forman el mismo grupo.
- **Add Round Key**: Xor con la parte de la clave derivada para la ronda en cuestión.

Luego, se itera sobre este modelo. La primera iteración solo realiza el paso *“Add Round key”*, las iteraciones intermedias realizan todos los pasos y la ultima iteración salta a *“Mix Column”*.

Las **Round keys** tienen un tamaño de 32 bits, de las cuales los primeros 16 corresponden a la clave original mientras que los otros son obtenidos a partir de las operaciones anteriores. 

## MAC

Una MAC es una primitiva criptográfica que permite realizar un control de integridad. Estas primitivas están conformadas por una terna de algoritmos:

- $\text{Gen}$: Genera las claves
- $\text{Mac}$: Genera etiquetas para una entrada junto a la clave. No puede ser una función determinística.
- $\text{Vrfy}$: Verifica si la etiqueta es valida para su entrada. 

A diferencia de otras primitivas, si mediante un ataque $\text{Mac-forge}$ se puede falsificar un mensaje, entonces se considera que el MAC esta roto.

### CBC MAC

CBC-Mac, definida para un tamaño fijo de mensajes:

- $\text{Gen}() = k \in \{0,1\}^n$
- $\text{Mac}:$
  - Sea $m = m_1|m_2|\dots|m_j$ y $t_0 = 0\dots0$
  - $t_i = F_k(t_{i-1}\oplus m_i)$
  - $\text{Mac}_k(m) = t_j$
- $\text{Vrfy}_k(m,t) = 1 \iff t =\text{Mac}_k(m) $

Se pueden soportar mensajes de tamaño arbitrario de distintas formas:

- Computando la clave $k' = F_k(|m|)$ y utilizando a esta clave en vez de a la original.
- Utilizando al mensaje $m'= |m|\vert m$ y utilizar a este mensaje en vez del original.
- Generando dos claves $k_1,k_2$ y obtener la etiqueta $ F_{k_2}()(\text{CBC-Mac}_{k_1}(m))$.









