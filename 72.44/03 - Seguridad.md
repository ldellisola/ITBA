# Seguridad

Primero tenemos que definir que consideramos *“seguro”*. Por mucho tiempo, un cifrado era seguro si no se lo lograba analizar. Los avances de la Segunda Guerra Mundial nos llevan a la criptografía moderna, donde se definen:

- Representaciones formales de criptosistemas
- Definiciones del modelo de amenaza.
- Pruebas de seguridad formales.

Un criptosistema es seguro, si ningún adversario puede computar cualquier función del texto plano a partir del mensaje cifrado que posee. A esta condición se la conoce como la **condición de secreto perfecto**.

## Secreto Perfecto

Dado un criptosistema:

- Gen: $k \larr k$
- Enc: $c \larr Enc_k(m)$
- Dec: $m = Dec_k(c)$

Tiene secreto perfecto si se cumple que para cualquier distribución de probabilidad en $M$, cada mensaje $m$ y cada mensaje cifrado $c$ tal que $Pr[C=c] > 0$:
$$
Pr[M=m|C=c] = Pr[M=m]
$$
Es una forma de decir que el texto plano y el cifrado son probabilísticamente independientes.

Hay cuatro definiciones para poder decir si un criptosistema tiene secreto perfecto:

1. $P(M=m) = P(M=m/C=c)$
2. $P(C=c) = P(C=c/M=m)$
3. $\forall m_0,m_1.P(C=c/M=m_0) = P(C=c/M=m_1)$
4. Si pasa una prueba de Eavesdropping Indistinguishability ($\text{Eav}_{A,\Pi}$)

## Seguridad Computacional

Por los problemas que trae el secreto perfecto, se desarrollo el concepto de seguridad computacional. Este concepto relaja dos aspectos:

- Limita los escenarios a solo los posibles, es decir, si se tardan años en descifrar un mensaje, entonces lo consideramos seguro.
- Limitar garantías. El sistema permite que sea posible descifrar un mensaje con una clave definida al azar.

Este nuevo concepto garantiza seguridad solo contra adversarios limitados y acepta una pequeña probabilidad de que el atacante tenga éxito.

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