# Cifrado Asimétrico

Un cifrado asimétrico es una terna de algoritmos:

- $\text{Gen}()=k_p, k_s$
- $\text{Cod}() = \text{Cod}_{k_p}(m)$
- $\text{Dec}() = \text{Dec}_{k_s}(c)$

Donde

- $k_p$ es la clave publica, con ella se puede cifrar un mensaje.
- $k_s$ es la clave secreta, con ella se pueden descifrar los mensajes.

### Seguridad

En este tipo de cifrados, el nivel de seguridad viene de la mano de los tamaños de los conjuntos utilizados:

- En RSA $n = p \times q$
- En El Gamal $n = p$

Estos campos numéricos tienen que ser mayores a 1024 bits.

Un atacante que conoce a la clave publica puede cifrar cualquier mensaje, entonces en estos tipos de criptosistemas si $\Pi$ es indistinguible para un adversario pasivo, $\Pi$ es CPA-Secure. Como CPA-Secure requiere que los cifrados sean no determinísticos, entonces los criptosistemas asimétricos no pueden ser determinísticos

## RSA

RSA es un método de cifrado asimétrico implementado de la siguiente forma:

- $\text{Gen}()$:
  1. Elegir $p,q, \text{ primos}$
  2. $n = p \times q$
  3. $\phi = (p-1) \times (q-1)$
  4. Elijo $e$ primo que no divide a $\phi$
  5. Calculo $d / e \times d \mod \phi = 1$
  6. Calculo $k_p=(n,e)$
  7. Calculo $k_s = (n,d)$
- $\text{Cod}_{k_p}(m) = m^e \mod n$
- $\text{Dec}_{k_s} (c)=  c^d \mod n$

Este cifrado es determinístico, por lo que trae varios problemas. Entre ellos se encuentran que si $e,m$ son pequeños ($m^w < n$), entonces se puede calcular el logaritmo. De la misma forma, si dos pares de claves comparten el mismo $n$, es posible recuperarlo y luego obtener la clave privada.

## PKCS

Es el RSA Labs Public Key Cryptography Standard. Define una  version con padding aleatorio de RSA:

- Sea $k$ la longitud de $n$ en bytes. Solo se permiten cifrar mensajes de hasta $n-11$ Bytes. 

- Sea $D$ la longitud de $m$ en bytes:
  $$
  m'= 00000000||00000000||r||00000000||m
  $$
  Donde $r = k-D-3$ bytes aleatorios.

Se cree que este método es CPA-Secure.

## El Gamal

Este metodo esta basado en Diffie-Hellman:

- $\text{Gen}()$
  1. Elijo $p$ primo
  2. Elijo $a \in \{0,\dots,p-1\},g$ aleatoriamente.
  3. Calculo $K = g^a$
  4. $k_p = (g,p,K)$
  5. $k_s = (a)$
- $\text{Enc}_{k_p}(m)$:
  1. Elijo un $b \in \{2,\dots,p-1\}$
  2. $c_1 = g^b$
  3. $c_2 = K^b \times m$
  4. Devuelvo $(c_1,c_2)$
- $\text{Dec}_{k_s}(c) = c_1^{p-1-a}c_2 \mod p$

Si la prueba de decision de Diffie-Hellman es difícil en $\{0,\dots,p-1\}$.

A diferencia de RSA, este algoritmo es probabilístico y permite reusar los parámetros. Ademas, no esta limitado a campos numéricos y se puede aplicar sobre anillos de polinomios o curvas elípticas.