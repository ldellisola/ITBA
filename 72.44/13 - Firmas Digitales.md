# Firmas Digitales

Las firmas digitales son similares a las Macs, en el sentido que su objetivo es preservar la integridad de un mensaje, pero tienen las siguientes ventajas:

- Son publicamente verificables.
- Son transferibles.
- Quien firma no puede negar haberlo hecho.

Una forma digital es una terna de algoritmos:

- $\text{Gen}(n) = (k_p,k_s)$
- $\text{Sign}_{k_s}(m)  \rarr s$
- $\text{Vrfy}(m,s) \rarr \{0,1\}$

## RSA-Signature

Es idéntico a la implementación de RSA pero invierte los papeles de las claves.

- $\text{Gen}()$:
  1. Elegir $p,q, \text{ primos}$
  2. $n = p \times q$
  3. $\phi = (p-1) \times (q-1)$
  4. Elijo $e$ primo que no divide a $\phi$
  5. Calculo $d / e \times d \mod \phi = 1$
  6. Calculo $k_p=(n,e)$
  7. Calculo $k_s = (n,d)$
- $\text{Sign}_{k_s}(m) = m^d \mod n$
- $\text{Vrfy}_{k_p} (m,s)=  m == (s^e \mod n)$

Este metodo es bastante inseguro.

## Hashed RSA

Para solucionar los problemas de RSA-Signature, se introduce una función de hash libre de colisiones $H$:

- $\text{Gen}()$:
  1. Elegir $p,q, \text{ primos}$
  2. $n = p \times q$
  3. $\phi = (p-1) \times (q-1)$
  4. Elijo $e$ primo que no divide a $\phi$
  5. Calculo $d / e \times d \mod \phi = 1$
  6. Calculo $k_p=(n,e)$
  7. Calculo $k_s = (n,d)$
- $\text{Sign}_{k_s}(m) = H(m)^d \mod n$
- $\text{Vrfy}_{k_p} (m,s)=  H(m) == (s^e \mod n)$

El problema de este modelo es que no posee una prueba de seguridad a menos que se asuma un modelo ideal de $H$.

## Digital Signature Standard

- $\text{Gen}():$

  1. Seleccionar $H(x)$, siendo esta una función de Hash SHA1 o SHA2.

  2. Seleccionar alguno de los siguientes tamaños de clave $(KL,N)$:

     - $(1024,160)$
     - $(2048,224)$
     - $(2048,256)$
     - $(3072,256)$

  3. Elegimos un numero primo $q$ de $N$ bits

  4. Elegimos un numero primo $p$ de $KL$ bits, tal que $p-1$ sea múltiplo de $q$.

  5. Elegimos un numero $h \in \{2,\dots,p-2\}$ tal que en el proximo paso $g \neq 1$.

  6. Calculamos $g$:
     $$
     g = h^{(p-1)/q} \mod p
     $$

  7. Obtengo $x \in \{1,\dots,p-1\}$

  8. Obtengo $y = g^x \mod p$

  9. Se genera $k_p=(p,q,g,y)$

  10. Se genera $k_s=(p,q,g,x)$

- $\text{Sign}_{k_s}(m):$

  1. Obtengo $k \in \{1,\dots,p-1\}$

  2. Se calcula $r$:
     $$
     r = (g^k \mod p)\mod q
     $$

  3. Se calcula $s$:
     $$
     s = k^{-1} \times (H(m) + x\times r) \mod q
     $$

  4. Se genera la firma $(r,s)$

- $\text{Vrfy}_{k_p}(m,(r,s))$:

  1. Verificar que $0<r<q$ y que $0<s<q$

  2. Obtengo $u_1 = (H(m) \times s^{-1}) \mod q$

  3. Obtengo $u_2 = r\times (s-1) \mod q$

  4. $r == ((g^{u_1} \times y^{u_2} \mod p) \mod q)$

     



















