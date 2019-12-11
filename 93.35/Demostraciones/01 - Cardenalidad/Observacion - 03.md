# Demostración

$$
\text{$A\sub B$ y $A$ es infinito $\Rightarrow B$ es infinito }
$$

#### Demo

(<u>Demostracion por Absurdo</u>)

Supongo que $B$ es finito, entonces tengo 2 casos:

- $\array{(1)&B = \empty}$

  Como $B=\empty$ y $A\sub B \Rightarrow A = \empty$ Pero por dato $A$ es infinito, entonces es **ABS!**.  

- $\array{(2)& \exist k \in \N/B \sim I_k}$

  Defino la funcion inclusion:
  $$
  inc:A\rightarrow B/ inc(x)=x \text{ (inyectiva)}
  $$
  Como $B\sim I_k$, podemos ver que:
  $$
  \exist f:B \rightarrow I_k\text{ (biyectiva)}
  $$
  Si componemos 2 funciones inyectivas, obtenemos una funcion inyectiva:
  $$
  f_oinc:A\rightarrow I_k \text{ (inyectiva)}
  $$
  Pero como necesitamos una funcion biyectiva, acotamos el codominio para que coincida con la imagen de la funcion compuesta ($C= Im(f_oinc)$)
  $$
  f_oinc:A \rightarrow C \text{ (biyectiva)}
  $$
  Entonces obtenemos lo siguente:
  $$
  A \sim C \sub I_k
  $$
  Y gracias a la [observación anterior](Observacion - 02.html) ($\exist m/C \sim I_m$), obtenemos que:
  $$
  A \sim C \sim I_m
  $$
  Y esto indica que $A$ es un conjunto finito, pero por dato $A$ es infinito, entonces es **ABS!**.



$\therefore B$ es infinito 