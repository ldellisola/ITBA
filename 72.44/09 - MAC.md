# MAC

Una MAC es una primitiva criptográfica que permite realizar un control de integridad. Estas primitivas están conformadas por una terna de algoritmos:

- $\text{Gen}$: Genera las claves
- $\text{Mac}$: Genera etiquetas para una entrada junto a la clave. No puede ser una función determinística.
- $\text{Vrfy}$: Verifica si la etiqueta es valida para su entrada. 

A diferencia de otras primitivas, si mediante un ataque $\text{Mac-forge}$ se puede falsificar un mensaje, entonces se considera que el MAC esta roto.

## Implementaciones

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

### HMAC

Es una MAC construida a partir de una función de hash. Dado una función de hash $H(x)$ libre de colisiones:

- $\text{Gen}() = k,s$
- $\text{Mac} = H^s((k \oplus \text{opad})|| H^s((k \oplus \text{ipad})|| m ) )$

Donde $\text{opad}=\text{0x36...36}, \text{ ipad} = \text{0x5c...5c}$

Este tipo de Mac es infalsificable y no es susceptible a un ataque del tipo $\text{Mac-forge}$.

# Cifrado Autentificado

El objetivo de esta operación es combinar al cifrado con el control de integridad. Hay 3 formas de realizar esta operación:

1. **Cifrar y autentificar:**
   $$
   c = \text{Cod}_{k_1}(m)\\
   t=\text{Mac}_{k_2}(m)
   $$
   Este método no es seguro, ya que $t$ puede brindar información de $m$.

2. **Autentificar, y luego cifrar**:
   $$
   c = \text{Cod}_{k_1}(m ||\text{Mac}_{k_2}(m))
   $$
   Este método puede ser seguro, pero requiere de una prueba de seguridad.

3. **Cifrar, y luego autentificar**:
   $$
   c = \text{Cod}_{k_1}(m), t=\text{Mac}_{k_2}(c)
   $$
   Este método siempre es seguro.

Sea $\Pi_e(\text{Gen}_e,\text{Cod},\text{Dec})$ un criptosistema CPA-Secure y $\Pi_m(\text{Gen}_m,\text{Mac}, \text{Vrfy})$ una Mac infalsificable, se define al criptosistema:

- $\text{Gen}(): k_1 = \text{Gen}_e(), k_2 = \text{Gen}_m()$
- $\text{Cod}(m): c = \text{Cod}_{k_1}(m), t = \text{Mac}_{k_2}(c)$
- $\text{Dec}(): m = (\text{Vrfy}_{k_2}(c,t) = 1~~?~~ \text{Dec}_{k_1}(c) ~~:~~ \text{null} )$

Este criptosistema es **CPA-Secure**.

## Aplicación

En la practica, solo se deberían usar cifrados con autentificado. Los mensajes con cifrado normal pueden ser manipulados.

## Encadenamiento CCM

Este método se llama Counter with CBC-MAC y se basa en autentificar y luego encriptar:
$$
e_k(\text{cbc-mac}_k(M)||m)
$$







