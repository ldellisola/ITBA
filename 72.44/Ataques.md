# Ataques

## Ataque de Texto Cifrado

El adversario solo dispone de los mensajes cifrados y tiene que conseguir los mensajes de texto plano.

**Ciphertext-only Attack**

## Ataque de Texto Plano Conocido

El atacante conoce un mensaje de texto plano y su version codificada. A partir de esto debe obtener un mensaje de texto plano a partir de otro mensaje cifrado.

**Known-Plaintext Attack**

## Ataque de Texto Plano Escogido

El adversario puede obtener el texto cifrado de cualquier mensaje de texto plano. A partir de esto tiene que descifrar un mensaje de texto cifrado diferente.

**Chosen-Plaintext attack**

## Ataque de Texto Cifrado Escogido

El adversario puede obtener el texto plano a partir de cualquier texto cifrado que quiera. A partir de eso debe descifrar un mensaje distinto.

**Chosen-Ciphertext Attack**

Chosen Ciphertext Attack $\text{CCA}_{A,\Pi}$:

Dado un nivel de seguridad $n$, un adversario $A$ y un criptosistema $\Pi(n)$:

1. Se genera una clave $k$
2. $A$ obtiene $f(x) = \text{Cod}_k(x)$ Y $g(x) = \text{Dec}_k(x)$
3. $A$ emite $(m_0,m_1)$
4. $A$ elige a un mensaje $m_b/b \in \{0,1\}$
5. Se calcula $c = \text{Cod}_k(m_b)$
6. $A$ tiene que decidir a partir de $c$ si el mensaje cifrado es de $m_0$ o $m_1$.

Si el atacante puede acierta con una probabilidad mayor a $0.5 + \text{neg}(n)$, entonces el criptosistema $\Pi$ no paso la prueba.

# Pruebas de Seguridad

## Prueba de Indistinguibilidad

Eavesdropping Indistiguishability test: $Eav_{A,\Pi}$.

Sea $A$ un adversario y $\Pi_k$ un criptosistema, esta prueba consiste en:

1. $A$ emite $m_0,m_1$ segun su criterio
2. Se genera una clave $k$
3. $A$ elige a un mensaje $m_b/  b \in \{0,1\}$
4. Se calcula $c = \text{Cod}_k(m_b)$ y se lo envia a $A$.
5. A partir del mensaje cifrado $c$, $A$ tiene que adivinar si es el mensaje cifrado de $m_0$ o $m_1$.

Simplificando, la idea consiste en generar dos mensajes y luego el atacante tiene que adivinar a quien pertenece el texto cifrado. 

Si el atacante puede acierta con una probabilidad mayor a $0.5$, entonces el criptosistema $\Pi$ no paso la prueba.

Algunos ataques de este estilo son:

- **Chosen-Plaintext Indistinguishability test**: $\text{CPA}_{A,\Pi}$:
  - Si un criptosistema lo pasa, entonces es **CPA-Secure**.
  - Un criptosistema deterministico no puede ser CPA-Secure.

## Prueba de Multiples Cifrados

Multiple Message Eavesdropping Test: $Mul_{A,\Pi}$

Sea $A$ un adversario y $\Pi_k$ un criptosistema, esta prueba consiste en:

1. $A$ emite dos cadenas de mensajes $(m_{00}m_{01}\dots m_{0i}),(m_{10}m_{1}\dots m_{1i})$
2. Se genera una clave $k$.
3. $A$ elige a una cadena de mensajes $m_{bj}/ b\in\{0,1\}$
4. Se calcula $c_j = \text{Cod}_k(m_{bj})$
5. A partir de la cadena de cifrados $c_j, 0\leq j \leq i$, $A$ debe adivinar si es el mensaje cifrado a partir de la cadena $m_{0j}$ o $m_{1j}$.

La idea consiste en tener codificar a una serie de mensajes de texto plano, para luego operar sobre ellos y poder estimar si provienen de la primera cadena o la segunda.

Si el atacante puede acierta con una probabilidad mayor a $0.5$, entonces el criptosistema $\Pi$ no paso la prueba.

## Prueba de Autenticación de Mensajes

Message Authentication Experimento: $\text{Mac-forge}_{A,\Pi}$

Dado un nivel de seguridad $n$, un adversario $A$ y un criptosistema $\Pi(n)$:

1. Se genera un clave $k$.
2. $A$ Obtiene $f(x) = \text{Mac}_k(x)$
3. $A$ realiza cualquier evaluación sobre la función $f(x)$ y las guarda en el set $Q$.
4. $A$ emite $(m,t)$, siendo estos un mensaje y su etiqueta.

Si $\text{Vrfy}(m,t)=1$ y $m \not \in Q$, entonces la MAC se considera rota.

## Prueba de resistencia a Colisiones

Collision Resistance: $\text{Hash-Coll}_{A,H}$

Dado un nivel de seguridad $n$, un adversario $A$ y una familia de funciones de hash $H^x(n)$:

1. Se selecciona una función $s \in S$
2. $A$ obtiene $s$, y por lo tanto $H(x) = H^s(x)$
3. $A$ emite $x,x'$

El atacante gana si emite $x \neq x'$ pero $H^s(x) = H^s(x')$. Si la probabilidad de que esto pase es menor a un valor insignificante en relación a $n$, entonces la función $H$ es libre de colisiones.













