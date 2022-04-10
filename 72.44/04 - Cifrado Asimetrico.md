# Cifrado Asimetrico

## Distribución de Claves

Un criptosistema CCA-Secure permite enviar información manteniendo:

- Confidencialidad
- Integridad

<img src="Resources/04 - Cifrado Asimetrico/Screen Shot 2022-04-07 at 17.30.53.jpg" alt="Screen Shot 2022-04-07 at 17.30.53" style="zoom:50%;" />

Pero requerir que ambas partes conozcan una misma clave. Compartir las claves es un problema, ya que no pueden transmitirse por un canal no seguro.

==falta==

Crear un punto de confianza, llamado Key Distribution Center (KDC) es una opción para solucionar este problema. Son entidades que centralizan el intercambio de claves. Estas entidades comparten una clave con cada entidad que participa, y si A quiere comunicarse con C, tiene que enviar un pedido al KDC.

## Criptografia Asimetrica

Para solucionar este problema, se planteo la criptografia asimetrica. Se basa en la asimetria en ciertos problemas, como por ejemplo, es fácil cerrar un candado pero es difícil abrirlo sin una llave. La idea base es crear dos contraseñas:

- Una contraseña publica, que permite cifrar un mensaje.
- Una contraseña privada que permite descifrar un mensaje cifrado.

La idea es que aunque el atacante conozca a la contraseña de cifrado, no puede descifrar a ningún mensaje.

Este metodo soluciona el problema de la distribución de claves, y permite aplicar dos conceptos conocidos anteriormente:

- Cifrado Asimetrico: cumple la misma función que  el cifrado simétrico
- Firma Digital: Cumple la misma función que las MACs

### Intercambio de Claves

Es un protocolo $\Pi(n)$ Ejecutado por dos partes:

- $\Pi:(n)\rarr \text{Tran},k_a,k_b$
- No tiene entrada, salvo por el parámetro de seguridad.
- La salida del protocolo es:
  - Un conjunto de mensajes encriptados
  - Una clave $K_a$ conocida solo por una de las partes
  - Una clave $K_b$ conocida solo por la otra parte

Se tiene que coincidir la siguiente condición fundamental:
$$
k_a = k_b
$$

#### Seguridad frente a ataques pasivos

Utilizando un Key-Exchange experiment: $\text{KE}_{A,\Pi}$. Dado un adversario $A$ y una primitiva de intercambio de claves $\Pi$:

1. Se ejecuta $\Pi$, sea $k=k_a=k_b$
2. Se genera $b \larr \{0,1\}$
3. Si $b = 0 \Rarr k' \larr \{0,1\}^n$ si  $b=1 \Rarr k'=k$
4. $A$ obtiene $\text{Trans}$ y $k'$, y emite $b'=\{0,1\}$

Entonces $\text{KE}_{A,\Pi}=1 \iff b=b'$ ($A$ gana):
$$
\text{Si } Pr[\text{KE}_{A,\Pi}=1] < o.5 + \epsilon \Rarr \Pi \text{ es seguro}
$$

## Diffie-Hellman

El algoritmo de intercambio de Diffie-Hellman es el siguiente:

Sea $Z_q = \{0,1,\dots,q-1\}$

1. $A$ Define $G,q,p$ Donde $G$ es un grupo, $q$ el tamaño y $g$ un generador.
2. $A$ elije $x\larr Z_q$ y calcula $h_1 = g^x$
3. $A$ envia a $B:(G,q,g,h1)$
4. $B$ elije $y\larr Z_q$ y calcula $h_2 = g^y$
5. $B$ envia a $A:(h2)$
6. $A$ calcula $k_a = h_2^x$
7. $B$ calcula $k_b = h_1^y$

### La Seguridad

Dado $g^x,g^y$ no debería ser posible obtener $x$ o $y$, ya que este es el problema del logaritmo discreto y no tiene una solución eficiente. 

Ademas se necesita la conjetura de decisión DH:

- Dados $g,g^x,g^y$, un adversario no puede distinguir $g^{xy}$ de un valor aleatorio.

Esta conjetura se formulo años después de la publicación del algoritmo. Hoy en día se lo conoce como un problema NP-Hard

La versión original requiere de un canal de transmisión autentificado, mientras que en la práctica esto se soluciona con firmas digitales.

## Criptosistema Asimétrico

Se define como una terna de algoritmos:

- $\text{Gen}:()\rarr \text{pk},\text{sk}$ (Public key, secret key)
- $\text{Enc}(\text{cifrado}):\text{Enc}_{pk}(m)$
- $\text{Dec(descifrado)}: \text{Dec}_{sk}(c)$

### Prueba de Indistinguibilidad

<img src="Resources/04 - Cifrado Asimetrico/Screen Shot 2022-04-07 at 18.09.41.jpg" alt="Screen Shot 2022-04-07 at 18.09.41" style="zoom:50%;" />

### Consecuencias

Un atacante que conoce a la clave publica puede cifrar cualquier mensaje, entonces en estos tipos de criptosistemas si $\Pi$ es indistinguible para un adversario pasivo, $\Pi$ es CPA-Secure. Como CPA-Secure requiere que los cifrados sean no determinísticos, entonces los criptosistemas asimétricos no pueden ser determinísticos



























