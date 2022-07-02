# Alfabetos

Se define al **alfabeto** como un conjunto finito de símbolos o caracteres, mientras que la **cadena** es una colección o conjunto ordenado de elementos de un alfabeto.

## Operadores

Existen los siguientes operadores sobre alfabetos:

- $\Sigma^*$: Sea $\Sigma$ un alfabeto, $\Sigma^*$ representa el conjunto total de cadenas que se pueden construir concatenando elementos de ese alfabeto. Incluye la cadena vacía $\lambda$

- $a\cdot b$: Es el operador de **concatenación entre símbolos y cadenas**, definido de la siguiente forma:
  $$
  \_\cdot\_: \Sigma \times \Sigma^* \rarr \Sigma^*
  $$

- $a+b:$ Es el operador de **concatenación entre cadenas**, definido de la siguiente forma:
  $$
  \_+\_: \Sigma^* \times \Sigma^* \rarr \Sigma^*
  $$
  Cumple con las siguientes propiedades:

  Sea $a\in \Sigma, \alpha,\beta,\gamma \in \Sigma^*:$

  -  $\lambda + \beta = \beta$
  - $a \cdot \alpha + \beta = a \cdot (\alpha  + \beta)$
  - $\alpha + (\beta + \gamma) = (\alpha + \beta) + \gamma$

- **Agregar a la cola**:
  $$
  \array{
  \text{concat}(\_,\_): \Sigma \times \Sigma^* \rarr \Sigma^*/ \\
  \alpha = \text{concat}(a,\alpha') \iff \alpha = \alpha' \cdot a
  }
  $$

- **Cabeza**:
  $$
  \array{
  \text{head}(\_):\Sigma^+ \rarr \Sigma/\\ 
  a = \text{head}(\alpha) \iff \alpha = a \cdot \alpha'
  }
  $$

- **Cuerpo**:
  $$
  \array{
  \text{body}(\_):\Sigma^*\rarr \Sigma^*/\\
  \alpha' = \text{body}(\alpha) \iff \alpha = a \cdot \alpha'
  }
  $$

- **Reversa**:
  $$
  \_^R: \Sigma^* \rarr \Sigma^* /
  (\alpha)^R = \left\{
  \array{
  \lambda & \alpha = \lambda \\
  (\alpha'\cdot a) & \alpha = a \cdot \alpha'
  }
  \right.
  $$

## Demos

### Asociatividad de la Concatenación de Cadenas

Sean $\alpha,\beta,\gamma \in \Sigma^*,$ entonces $\alpha + (\beta + \gamma) = (\alpha + \beta) + \gamma.$ 

Para esta demo hay que hacer Inducción por la longitud de $\alpha:$

- **Caso Base**: $\alpha = \lambda$
  $$
  \array{
  \alpha + (\beta + \gamma)& =&\lambda + (\beta + \gamma) \\
  &=& (\beta + \gamma) \\
  &=& \beta + \gamma \\
  &=& (\lambda + \beta) + \gamma \\
  &=& (\alpha + \beta) + \gamma
  }
  $$

- **Paso Inductivo**: La hipótesis inductiva es verdadera para cadenas de longitud $n$.

  Sea $a \in \Sigma, \alpha = a \cdot \alpha' / |\alpha'| = n$
  $$
  \array{
  \alpha + (\beta + \gamma)& =&a\cdot \alpha' + (\beta + \gamma) \\
  &=& a\cdot (\alpha' + (\beta + \gamma)) \\
  \text{por HI}&=&  a\cdot ((\alpha' + \beta) + \gamma)\\
  &=& a\cdot (\alpha' + \beta) + \gamma \\
  &=&  (a\cdot \alpha' + \beta) + \gamma \\
  &=& (\alpha + \beta) + \gamma
  }
  $$

### Proposición $\alpha + \lambda = \alpha$

Demostrado por Inducción estructural en la longitud de $\alpha$:

- **Caso Base**: $\alpha = \lambda$
  $$
  \array{
  \alpha + \lambda &=& \lambda+ \lambda\\
  &=&\lambda\\
  &=&\alpha\\
  }
  $$

- **Paso Inductivo**: La hipótesis inductiva es verdadera para cadenas de longitud $n$

  Sea $a \in \Sigma, \alpha = a \cdot \alpha'/|\alpha'| = n$
  $$
  \alpha + \lambda &=& a \cdot \alpha'+ \lambda\\
  &=&a\cdot(\alpha'+\lambda)\\
  \text{por HI}&=&a \cdot (\alpha')\\
  &=& a\cdot \alpha'\\
  &=& \alpha
  $$