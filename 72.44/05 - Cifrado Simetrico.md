# Cifrado Simétrico

Es una terna de algoritmos:

- $\text{Gen}()$
- $\text{Cod}_k(m)$
- $\text{Dec}_k(c)$

La salida de la función generadora se define como el espacio de claves $K$. La entrada de la función de cifrado es el espacio de mensajes y la entrada de la función de descifrados de define como el espacio de los mensajes cifrados.

En este sistema, siempre se tiene que cumplir que:
$$
\forall m,k \text{ validos }:Dec_k(Enc_k(m))=m
$$

## One Time Pad (OTP)

Existe un isomorfismo entre OTP y todos los criptosistemas que tienen secreto perfecto.

- $\text{Gen}(): k \in \{0,1\}^*$
- $\text{Cod}_k(m)= m \oplus k$
- $\text{Dec}_k(c) = c \oplus k$

### Ejemplo

```
m = "11010101100"
k = "10011010101"

c = m xor k
c = "01001111001"
```

### Seguridad

Este criptosistema tiene secreto perfecto con dos condiciones:

- Las claves no se pueden reusar
- Las claves deben ser aleatorias

No son **CCA-Secure**

## Criptosistemas de Flujo

- $\text{Gen}() = s$
- $\text{Cod}_s(m) = G(s) \oplus m$
- $\text{Dec}_k(c) = G(s)\oplus c$

Donde la función $G$ es un generador pseudoaleatorio a partir de una seed $s$. Se basan el el OTP, pero lo modifican para añadir un poco de aleatoriedad al proceso. 

La diferencia radica en que, debido a que $s$ no se utiliza en el proceso de xor, la salida del generador pseudoaleatorio puede ser más grande, permitiendo que cifremos mensajes mucho más grandes que la clave.

### Ejemplo

```
Equivalente a OTP
```

### Seguridad

No tienen secreto perfecto, sino que se basa en seguridad computacional.

Son susceptibles a un ataque de cifrado multiple.
$$
\array{
c_1 = m_1 \oplus G(s)\\
c_2 = m_2 \oplus G(s) \\
}

 \implies
c_1 \oplus c_2 = m_1 \oplus m_2
$$
Son **CPA-Secure** si utilizan un parametro extra, llamado IV, para evitar reutilizar exactamente la misma seed en el generador.

No son **CCA-Secure**

## Data Encryption System (DES)

DES funciona a base de un concepto llamado **Cajas de Feistel**. La idea de este metodo de encripcion es partir al mensaje en dos mitades. Se transforma a una mitad con una subclave generada y se intercambias las dos mitades de lugar. Este proceso se repite 16 veces.

<img src="Resources/05 - Cifrado Simetrico/Screen Shot 2022-04-27 at 15.52.36.jpg" alt="Screen Shot 2022-04-27 at 15.52.36" style="zoom:50%;" />

Para generar las subclaves, se parte a partir de una clave de 64 bits. A esta, por cada byte, se remueve el ultimo bit de paridad y se obtiene una clave de 56 bits. Esta clave de 56 bits es dividida en 2 claves de 28 bits, a partir de las cuales se generaran las subclaves.

Para cada subclave generada, primero tengo que shiftear los bits de cada clave en un lugar y luego se realiza un proceso de union que genera una clave de 48 bits, utilizada dentro de la caja de Feistel.

Las cajas de Feistel realizan el siguiente proceso:

<img src="Resources/05 - Cifrado Simetrico/Screen Shot 2022-04-27 at 15.57.19.jpg" alt="Screen Shot 2022-04-27 at 15.57.19" style="zoom:50%;" />

### Seguridad

Mientras que DES no esta completamente rotos, la seguridad efectiva paso de ser de $2^{56}$, a caer en un ataque que puede romper una clave en cuestion de horas con tan solo $2^{43}$ Intentos. Por eso se dice que es un criptosistema debilitado.

Estos ataques son por medio de criptoanalisis lineal y diferencial.

## 3-DES

Es una variante fuerte de DES que consiste en seleccionar 3 claves distintas e independientes. La idea es que en vez de tener que romper una sola llave, el atacante debería romper 3 claves:
$$
c = \text{Cod}_{k_1}(\text{Dec}_{k_2}(\text{Cod}_{k_3}(m)))
$$
Esta version es mucho más lenta que la original, 3 veces exactamente.

### Seguridad

Aunque teóricamente la seguridad de este algoritmo debería ser del orden de 168 bits, esta es en realidad del orden de 112 bits debido a un ataque conocido como **man in the middle**.

Es inmune a los ataques realizados sobre DES.

## AES

Es el reemplazo oficial de DES. Esta orientado a resolver bloques de 128 bits, con claves de 128, 192 o 256 bits.

<img src="Resources/05 - Cifrado Simetrico/Screen Shot 2022-04-27 at 16.12.13.jpg" alt="Screen Shot 2022-04-27 at 16.12.13" style="zoom:50%;" />

Funciona en 4 pasos:

- **Byte sub**: realiza una sustitución de valores segun una tabla derivada de invertir una matriz en campo $GF(2^8)$
- **Shift Row**: Permutation de bits.
- **Mix Column**: Transformación lineal invertible de cada byte en función de los 4 que forman el mismo grupo.
- **Add Round Key**: Xor con la parte de la clave derivada para la ronda en cuestión.

Luego, se itera sobre este modelo. La primera iteración solo realiza el paso *“Add Round key”*, las iteraciones intermedias realizan todos los pasos y la ultima iteración salta a *“Mix Column”*.

Las **Round keys** tienen un tamaño de 32 bits, de las cuales los primeros 16 corresponden a la clave original mientras que los otros son obtenidos a partir de las operaciones anteriores. 