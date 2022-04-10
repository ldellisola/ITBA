# Algoritmo de Mejoramiento Iterativo

Es un … ==??==

Para lograr llegar a una solución optima, podemos hacer pequeños cambios randomizados a nuestra solución original para que nos den como resultado una mejor solución.

Estos algoritmos **usan muy poca memoria**, y pueden ser apropiados para **espacios de soluciones muy grandes o infinitos**.

## Ejemplos

### Hill Climbing

La idea de este algoritmo es siempre moverse por una pendiente positiva. Este algoritmo tiende quedarse fácilmente estancado en máximos locales. Este algoritmos es del tipo Heurística Local, ya que solo se evalúa la valuación de los nodos hijos inmediatos del 

El algoritmos es el siguiente:

```pseudocode
solution: Solution = GetRandomSolution();
do:
  nextSolutions: Set[Solution]  = solution.moveRandomInAlldirections();
  solution = nextSolitions.GetBest();
while solution.IsGoodEnough();
```

Existen diferentes variantes de este algoritmos:

- **Simple Hill Climbing**: Elige la primer solución de la frontera con mejor valuación que el estado actual.
- **Steepest Hill Climbing**: Siempre elige la solución de la frontera con mejor valuación del set actual.

### Simulated Annealing

Es similar a Hill climbing pero utiliza una función de temperatura para elegir al principio soluciones con peor resultado, con la esperanza de que eventualmente termine ofreciendo llegar al máximo global. Esta temperatura disminuye a medida que el algoritmo va avanzando.

```pseudocode
temp: Temperature = Temperature.GetInitial();
solution: Solution = GetRandomSolution();

while solution.NotFinished():
	repeat N times:
		newSol
```

==FALTA POR QUE LA CHABONA NO QUIERE SUBIR EL PPT ANTES DE LA CLASE==

### Beam Search

Es similar a Hill Climbing pero empieza con $k$ nodos iniciales. Analizamos el entorno de esos nodos iniciales y generamos una frontera. Luego se seleccionan las mejores $k$ soluciones de esa frontera y se repite el proceso.

- **Stocastic beam search**: Busca resolver el problema de que beam search se puede quedar atrapado en un máximo local. Para hacer esto elige a los nodos con una probabilidad proporcional a su valuación. De esta forma los nodos “malos” pueden llegar a elegirse.
- **Algoritmos Geneticos**: Son una variante de 