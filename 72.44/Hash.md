# Hash

Las funciones de hash criptográficas son pares de algoritmos:

- $\text{Gen}()= s$
- $\text{Hash}_s(m) = h \in \{0,1\}^L$

Siendo $L$ la longitud del hash y $s$ no  es una clave, sino que es un selector. En muchas implementaciones hay un solo selector disponible.

Estas funciones son análogas a las MACs, pero no tienen clave.

Las funciones de hash tienen 3 propiedades:

- **Resistencia a preimagenes**:
  $$
  \forall y \text{ es computacionalmente imposible hallar } x/h(x) = y
  $$

- **Resistencia a segundas imagenes**:
  $$
  \forall x \text{ es computacionalmente imposible hallar} x'\neq x/h(x) = h(x')
  $$

- **Resistencia a Colisiones**:
  $$
  \text{Es computacionalmente imposible hallar } x,x'/h(x) = h(x') \land x \neq x'
  $$

Muchas de las funciones de hash están basadas en el **modelo general iterativo**. Este tiene una fase de preprocesamiento donde se agrega el tamaño del mensaje y luego se ajusta el mismo. Por ultimo se opera iterativamente sobre una función de compresión. 

<img src="Resources/Hash/Screen Shot 2022-04-27 at 18.43.52.jpg" alt="Screen Shot 2022-04-27 at 18.43.52" style="zoom:50%;" />

## MD5

Implementa el modelo iterativo, con una entrada de hasta $2^{64}$ bits y genera una secuencia de salida de 128 bits. Esta función esta rota.

## SHA-1

Construida sobre MD5, esta función expande el tamaño de salida hasta 160 bits.

## SHA-3





























