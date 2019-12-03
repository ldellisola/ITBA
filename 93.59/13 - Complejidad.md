# Complejidad

La complejidad de los [algoritmos](#Algoritmo) esta relacionada con los recursos:

- **Temporal**: Cuanto tiempo tarda en ejecutarse el algoritmo.
- **Capacidad**: Cuanta memoria ocupa.

En este caso vamos a ver la complejidad temporal, y la vamos a calcular en funcion de la longitud de la entrada $f(N)$ y para cada entrada podemos tener un:

1. <u>Mejor caso</u>
2. <u>Peor caso</u>
3. <u>Caso promedio</u>

**Notación O**: es la cota superior, por lo que si un algoritmo nos devuelve un polinomio como salida, podemos decir que el orden de esa función es el grado mayor del polinomio.
$$
f(n) \text{ es }O(g(n)) \text{ si existe } C \in \R^+/\mid f(b) \mid \le C \times \mid g(n) \mid
$$

**Notación $\Omega$**: es la cota inferior.
$$
f(n) \text{ es }\Omega(g(n)) \text{ si existe } C \in \R^+/\mid f(b) \mid \ge C \times \mid g(n) \mid
$$
**Notación $\theta$**: Permite acotar inferiormente y superiormente a $f(n)$.
$$
f(n) \text{ es }\theta(g(n)) \text{ si $f(n)$ es $O(g(n))$ y es $\Omega(g(n))$ }
$$
**Ejemplo de Algoritmo**:

```pseudocode
IN: a = [a1, a2, ... , an]
OUT: Max(a1, a2, ... , an)

	max := a[1]
	FOR i:=2	TO	i = n
		BEGIN
			IF max < a[i]
			THEN max = a[i]
		END
```

Podemos ver que cada vez que entro en un for hago $1$ comparación y entra $(n-1)$. Podemos ver que la complejidad es:
$$
O(N)= 2\times (N-1) +1 =2\times N - 1
$$
Y tambien podemos ver que no tiene mejor o peor caso.

```pseudocode
x:=0

FOR	i:=1	TO	i = n
	FOR	j:=1	TO	j = n
		x := x+i
	ENDFOR
ENDFOR
```

Como tiene un loop principal que se recorre $N$ veces, y dentro de el tiene otro loop que se recorre $N$ veces. Por lo que la complejidad será:
$$
(N+1) + (N+1) \times N = (N+1)^2
$$

```pseudocode
IN: N
OUT: N!

fact:= 1
FOR i:= 1	TO	i = n
	fact := fact * i
ENDFOR
```

Tiene un loop principal que se recorre $N$ veces y hace $(N+1)$ veces la comparación con $i$ para ver si llega al valor limite. La complejidad será:
$$
N+1
$$

```pseudocode
Factorial(N: natural)
BEGIN
	IF (N = 1)
	THEN RETURN 1
	ELSE RETURN N * Factorial(N-1)
ENDFOR
```

Es una función recursiva, pero se ve que se compara $(N+1)$ veces, por lo que la complejidad es:
$$
N+1
$$

```pseudocode
FOR i:=1	TO	i = N
	FOR j:=i	TO	j = N
		// STEPS
	ENDFOR
ENDFOR
```

En el primer loop se hacen $(N+1)$ comparaciones, mientras que en el segundo loop, cada vez se hacen menos comparaciones. Esto se pude modelar como la suma de los números enteros entre el $i$ que viene como parámetro y $N$:
$$
\sum_{i=1}^{N+1}i=\frac{(N-1)\times(N-2)}{2} = \frac{N^2 + 3N+2}{2}
$$
Entonces podemos ver que la complejidad es:
$$
N+1 + \frac{N^2 + 3N+2}{2} = \frac 1 2 \times N^2 + \frac 5 2 \times N + 1
$$

```pseudocode
FOR i:= 1	TO	i = n				// (n) comp
	FOR j:= i	TO j = n			// (n-i)+1 comp
		IF <COMP1> AND <COMP2>		//  3 *(n-i) comp 
			IF <COMP3>			   
				// CODE
			END
		END
	END
	FOR k:= 1	TO	k = 2n			// (2n +1) comp
		IF <COMP4>					// (2n) comp
			// CODE
		END
	END
END
```

La complejidad es:
$$
[N] + [4 \times (N-i) + N] + [2 \times (2N) +N] \\
= 10 N + 4(N-i)
$$

**Método de Inserción**

```pseudocode
IN: a[a_1, ... , a_N]

FOR i:=2	TO	i = n
	v:= a[i]
	j:= i
	WHILE a[j-1] > v AND j > 1
		a[j] = a[j-1]
		j = j-1
		a[j] = v
	END
END
```

Aplicamos el algoritmo con la siguiente entrada `[10,15,5,2]`:

```pseudocode
a = [10, 15, 5, 2 ]	STEP 1: i = 2	j = 2	v = 15
a = [10, 5, 15, 2 ]	STEP 2: i = 3	j = 3	v = 5
a = [5, 10, 15, 2 ]	STEP 3: i = 3	j = 2	v = 5
a = [5, 10, 15, 2 ]	STEP 4: i = 3	j = 1	v = 5
a = [5, 10, 2, 15 ]	STEP 5: i = 4	j = 4	v = 2
a = [5, 2, 10, 15 ]	STEP 6: i = 4	j = 3	v = 2
a = [2, 5, 10, 15 ]	STEP 7: i = 4	j = 2	v = 2
a = [2, 5, 10, 15 ]	STEP 8: i = 4	j = 1	v = 2
```

<u>Peor caso</u>: El peor caso se da cuando en el while solo depende de `j`.

Podemos ver que el primer loop hace `N` comparaciones, ya que compara de `2` a `N`. En el while podemos ver que cada vez que se quiera evaluar si el while debe continuar se harán `2` comparaciones. Como el valor de `j` depende de `i`, tenemos que plantear para cada `i` cuantas comparaciones va a requerir el while, gracias a esto llegamos a que para el valor inicial requiere 2 comparaciones y para cuando `i = N`, entonces se puede modelar como la suma de Gauss.

La complejidad es:
$$
N + 2 \times \sum_{i=2}^{N} i = 
N + 2 \times \left( \frac{n \times (n+1)}{2} -1 \right) =
N^2+2N-2
$$
<u>Mejor caso</u>: En el mejor caso, el arreglo esta ordenado, entonces nunca va a entrar en el while. De esta forma solo tiene dos comparaciones cada vez que entra al while además de la comparación del for. La complejidad es:
$$
N + 2 \times (N-1) = 3 N -2
$$
**Método de Selección**

```pseudocode
IN: a[a_1, ... , a_N]

FOR i:=1	TO	i = N			// (n+1) comp
	FOR j:= i+1	   TO	j = N	// (n-i)+1 comp
		IF a[j] < a[i]			// (n-i) comp
			min:= j
			Swap(a[i],a[min])
		END
	END
END
```

No hay mejor o peor caso, solo esta el caso promedio.

Aplico el algoritmo con la siguiente entrada `IN: [10, 15, 5, 2]`:

```pseudocode
a = [10, 15, 5, 2] STEP 1: i = 1  j = 2  min = null
a = [5, 15, 10, 2] STEP 2: i = 1  j = 3  min = 3
a = [2, 15, 10, 4] STEP 3: i = 1  j = 4  min = 4
a = [2, 10, 15, 5] STEP 4: i = 2  j = 3  min = 3
a = [2, 5, 15, 10] STEP 5: i = 2  j = 4  min = 4
a = [2, 5, 10, 15] STEP 6: i = 3  j = 4  min = 4
a = [2, 5, 10, 15] STEP 7: i = 4  j = 5  min = null
```

Veo que para cada valor de `i` la la complejidad del for interno es de $2 \times (n-i) +1$. Entonces para obtener la complejidad del algoritmo hay que sumar la complejidad del for interno `i` veces:
$$
2 \times \sum_{i=1}^N (N-i) + N \\
2 \times \left(\sum_{i=1}^N N + \sum_{i=1}^N1\right) + N \\
N^2+N+1
$$

## Definiciones

### Algoritmo

Un algoritmo es un conjunto de operaciones que pueden ser ejecutadas por una maquina o una persona, que no requiere conocimientos adicionales a los requeridos por las instrucciones o el sentido común. Es un proceso mecánico.

Tiene que cumplir con las siguientes condiciones:

- **Finitud**: El texto que describe el algoritmo tiene que ser finito.
- **Efectividad**: Cada paso del algoritmo debe poder ejecutarse.
- **Determinismo**: Para cada entrada debe haber una unica secuencia de pasos.
- **Terminación**: La ejecución del algoritmo debe detenerse en un numero finito de pasos.