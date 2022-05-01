# Ataques

Existen 4 tipos de ataques a primitivas o criptosistemas. Si dicho criptosistema es susceptible a uno de ellos, entonces no se considera seguro.

### Ataque de Texto Cifrado

También conocido como **Ciphertext-only Attack**, el adversario solo dispone de los mensajes cifrados y tiene que conseguir los mensajes de texto plano.

### Ataque de Texto Plano Conocido

También conocido como **Known-Plaintext Attack**, el atacante conoce un mensaje de texto plano y su version codificada. A partir de esto debe obtener un mensaje de texto plano a partir de otro mensaje cifrado. Ambos mensajes cifrados deben haber sido creados con la misma clave.

### Ataque de Texto Plano Escogido (CPA)

También conocido como **Chosen-Plaintext attack**, el adversario puede obtener el texto cifrado de cualquier mensaje de texto plano. A partir de esto tiene que descifrar un mensaje de texto cifrado diferente.

Si un criptosistema no es susceptible a este tipo de ataques, entonces se lo conoce como **CPA-Secure**. Dentro de este grupo no se pueden encontrar los criptosistemas determinísticos.

Si un criptosistema es CPA-Secure para un mensaje, entonces lo es para múltiples mensajes. Ademas, si un criptosistema es CPA-Secure para un tamaño de mensaje limitado, este se puede extender a un tamaño arbitrario con la siguiente construcción:
$$
m = m_0m_1\dots m_j \\
\text{Cod}_k(m) = \text{Cod}_k(m_0)\dots\text{Cod}_k(m_j)
$$

### Ataque de Texto Cifrado Escogido (CCA)

También conocido como **Chosen-Ciphertext Attack**, el adversario puede obtener el texto plano a partir de cualquier texto cifrado que quiera. A partir de eso debe descifrar un mensaje distinto.

Si un criptosistema no es susceptible a este tipo de ataques, entonces se lo conoce como **CCA-Secure**.

# Pruebas de Seguridad

Las pruebas de seguridad son una serie de pasos que prueban a un algoritmo contra un tipo de ataque especifico. El atacante puede ganar o perder la prueba y también la puede repetir tantas veces como quiera. 

La medida real sobre un criptosistema no es si pasa la prueba o no, sino que porcentaje de veces el atacante gana la prueba.

## Prueba de Texto Cifrado Escogido

Esta prueba conocida como $\text{CCA}_{A,\Pi}$, esta basada en un ataque de texto cifrado escogido. Dado un nivel de seguridad $n$, un adversario $A$ y un criptosistema $\Pi(n)$:

1. Se genera una clave $k$
2. $A$ obtiene $f(x) = \text{Cod}_k(x)$ Y $g(x) = \text{Dec}_k(x)$
3. $A$ emite $(m_0,m_1)$
4. $A$ elige a un mensaje $m_b/b \in \{0,1\}$
5. Se calcula $c = \text{Cod}_k(m_b)$
6. $A$ tiene que decidir a partir de $c$ si el mensaje cifrado es de $m_0$ o $m_1$.

Si el atacante puede acierta con una probabilidad mayor a $0.5 + \text{neg}(n)$, entonces el criptosistema $\Pi$ no paso la prueba.

## Prueba de Indistinguibilidad

### Chosen Plain-Text 

Esta prueba es conocida como $\text{CPA}_{A,\Pi}$, esta basada en un ataque de texto plano escogido. 

Dado un adversario $A$, un nivel de seguridad $n$ y un criptosistema $\Pi(n)$:

1. Se genera una clave $k$
2. $A$ obtiene $f(x) = \text{Cod}_k(x)$
3. $A$ genera $(m_0,m_1)$
4. $A$ selecciona un mensaje $m_b/b\in \{0,1\}$
5. Se calcula $c = \text{Cod}_k(m_b)$
6. $A$ emite $b' \in \{0,1\}$ tratando de adivinar si el texto cifrado es para el mensaje $m_0$ o $m_1$

Si el atacante $A$ acierta a que $b'=b$, se dice que el adversario gano la prueba y se lo nota como $\text{CPA}_{A,\Pi} = 1$.

Se dice que el criptosistema $\Pi$ es indistinguible si:
$$
\Pr[\text{CPA}_{A,\Pi} = 1] < 0.5 + \text{neg}(n)
$$

### Eavesdropping

Esta prueba es conocida como Eavesdropping Indistinguishability Test ($\text{Eav}_{A,\Pi}$).

Sea $A$ un adversario y $\Pi_k$ un criptosistema, esta prueba consiste en:

1. $A$ emite $m_0,m_1$ según su criterio
2. Se genera una clave $k$
3. $A$ elige a un mensaje $m_b/  b \in \{0,1\}$
4. Se calcula $c = \text{Cod}_k(m_b)$ y se lo envia a $A$.
5. A partir del mensaje cifrado $c$, $A$ tiene que adivinar si es el mensaje cifrado de $m_0$ o $m_1$.

Si el atacante $A$ acierta a que $b'=b$, se dice que el adversario gano la prueba y se lo nota como $\text{Eva}_{A,\Pi} = 1$.

Se dice que el criptosistema $\Pi$ es indistinguible si:
$$
\Pr[\text{Eav}_{A,\Pi} = 1] < 0.5 + \text{neg}(n)
$$
Simplificando, la idea consiste en generar dos mensajes y luego el atacante tiene que adivinar a quién pertenece el texto cifrado. 

En caso de realizar este ataque a un cifrado asimétrico, se debe utilizar la clave publica $k_p$.

### Chosen Cipher-Text

Esta es una prueba conocida como $\text{CCA}_{A,\Pi}$ y esta basada en un ataque de texto cifrado escogido.

Dado un adversario $A$, un nivel de seguridad $n$ y un criptosistema $\Pi(n)$:

1. Se genera una clave $k$
2. $A$ obtiene $f(x) = \text{Cod}_k(x), g(x) = \text{Dec}_k(x)$
3. $A$ emite $(m_0,m_1)$ y obtiene $c = \text{Cod}_k(m_b)/b \in \{0,1\}$
4. $A$ crea $c'$ a partir de $c$ y lo envia a descifrar, obteniendo $m'$
5. $A$ emite $b' \in \{0,1\}$ tratando de adivinar si $m'$ es el mensaje $m_0$ o $m_1$

Si el atacante $A$ acierta se dice que el adversario gano la prueba y se lo nota como $\text{CCA}_{A,\Pi} = 1$.

Se dice que el criptosistema $\Pi$ es indistinguible si:
$$
\Pr[\text{CCA}_{A,\Pi} = 1] < 0.5 + \text{neg}(n)
$$

### Prueba de Multiples Cifrados

Multiple Message Eavesdropping Test: $\text{Mul}_{A,\Pi}$

Sea $A$ un adversario y $\Pi_k$ un criptosistema, esta prueba consiste en:

1. $A$ emite dos cadenas de mensajes $(m_{00}m_{01}\dots m_{0i}),(m_{10}m_{1}\dots m_{1i})$
2. Se genera una clave $k$.
3. $A$ elige a una cadena de mensajes $m_{bj}/ b\in\{0,1\}$
4. Se calcula $c_j = \text{Cod}_k(m_{bj})$
5. A partir de la cadena de cifrados $c_j, 0\leq j \leq i$, $A$ debe adivinar si es el mensaje cifrado a partir de la cadena $m_{0j}$ o $m_{1j}$.

Si el atacante $A$ acierta, se dice que el adversario gano la prueba y se lo nota como $\text{Mul}_{A,\Pi} = 1$.

Se dice que el criptosistema $\Pi$ es indistinguible si:
$$
\Pr[\text{Mul}_{A,\Pi} = 1] < 0.5 + \text{neg}(n)
$$

La idea consiste en tener codificar a una serie de mensajes de texto plano, para luego operar sobre ellos y poder estimar si provienen de la primera cadena o la segunda.

## Prueba de Falsificación

### Prueba de Autenticación de Mensajes

Message Authentication Experimento: $\text{Mac-forge}_{A,\Pi}$

Dado un nivel de seguridad $n$, un adversario $A$ y un criptosistema $\Pi(n)$:

1. Se genera un clave $k$.
2. $A$ Obtiene $f(x) = \text{Mac}_k(x)$
3. $A$ realiza cualquier evaluación sobre la función $f(x)$ y las guarda en el set $Q$.
4. $A$ emite $(m,t)$, siendo estos un mensaje y su etiqueta.

Si $\text{Vrfy}(m,t)=1$ y $m \not \in Q$, entonces la MAC se considera rota.

### Prueba de Seguridad de una Firma Digital

Conocido como $\text{Sig-forge}_{A,\Pi}$.

Dado un nivel de seguridad $n$, un adversario $A$ y una firma digital $\Pi(n)$:

1. Se genera una clave $k=(k_p,k_s) = \text{Gen}()$
2. Se obtiene la función de firma $f(x) = \text{Sign}_{k_s}(x)$ y la clave publica $k_p$.
3. $A$ realiza las evaluaciones que quiera de $f(x)$ y las guarda en el conjunto $Q$.
4. $A$ emite el par mensaje, firma $(m,s), m \not \in Q$.

Si $\text{Vrfy}_{k_p}(m,s) = 1$, entonces el ataque fue exitoso.





## Prueba de resistencia a Colisiones

Collision Resistance: $\text{Hash-Coll}_{A,H}$

Dado un nivel de seguridad $n$, un adversario $A$ y una familia de funciones de hash $H^x(n)$:

1. Se selecciona una función $s \in S$
2. $A$ obtiene $s$, y por lo tanto $H(x) = H^s(x)$
3. $A$ emite $x,x'$

El atacante gana si emite $x \neq x'$ pero $H^s(x) = H^s(x')$. Si la probabilidad de que esto pase es menor a un valor insignificante en relación a $n$, entonces la función $H$ es libre de colisiones.

## Prueba de Intercambio de Claves

Utilizando un Key-Exchange experiment: $\text{KE}_{A,\Pi}$. Dado un adversario $A$ y una primitiva de intercambio de claves $\Pi$:

1. Se ejecuta $\Pi$, sea $k=k_a=k_b$
2. Se genera $b \larr \{0,1\}$
3. Si $b = 0 \Rarr k' \larr \{0,1\}^n$, si  $b=1 \Rarr k'=k$
4. $A$ obtiene $\text{Trans}$ y $k'$, y emite $b'=\{0,1\}$

Entonces $\text{KE}_{A,\Pi}=1 \iff b=b'$ ($A$ gana):
$$
\text{Si } Pr[\text{KE}_{A,\Pi}=1] < o.5 + \epsilon \Rarr \Pi \text{ es seguro}
$$



