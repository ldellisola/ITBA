# Lenguaje S

El lenguaje S tiene 4 tipos de variables fundamentales, siendo estas las variables de entrada `X1, X2, X3, ...`, las variables auxiliares `Z1, Z2, Z3, ...` y por ultimo la variable de salida `Y`. Las variables no se declaran, su valor es un numero perteneciente a los naturales y todas (salvo las de entrada) comienzan inicializadas en 0.

Luego existe otro elemento llamado etiquetas, que se enumeran de la siguiente forma `A1, B1, C1, D1 ,E1 ,A2, ...` y cada una de ellas marca un lugar al cual el código puede saltar durante una operación de `GOTO`.

Por ultimo hay solo 3 instrucciones mediante las cuales se puede operar:

- **Incremento**: 

  ```
  V <- V + 1
  ```

- **Decremento**

  ```
  V <- V - 1
  ```

  Como las variables son números reales, si se aplica esta operación sobre el `0`, el valor de la variable no cambia.

- **Salto**

  ```
  IF V!=0 GOTO L
  ```

  Siendo `L` una etiqueta a la cual debe saltar si se cumple con la condición.

Tambien existen pseudo instrucciones llamadas **Macros**, que representan a una lista finita de instrucciones. Se llama expandir a una macro al proceso de reemplazar a la macro por todas las instrucciones que la componen en el programa

## Definiciones

- **Programa**: Un programa es una sucesión finita de instrucciones `I1, I2, ..., In` que se escriben una debajo de la otra.

## Macros Comunes

1. **Salto incondicional**

   ```
   GOTO L:
   		Z1 <- Z1 + 1
   		IF Z1!=0 GOTO L
   ```

2. **Asignación de 0**

   ```
   V <- 0:
   	[A1]	V <- V - 1
   			IF V!=0 GOTO A1
   ```

3. **Asignación**

   ```
   W <- V
   	// CLASE
   ```

   