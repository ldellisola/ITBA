# Demostración

Sea $X$ infinito no numerable, $A$ numerable, entonces:
$$
X-A \sim X
$$

#### Demo

Tenemos 2 casos:

1.  $A \sub X$

   Puedo definir a $X$ como:
   $$
   X = X-A \cup A
   $$
   Y podemos ver que $X-A$ es infinito no numerable, por que $A$ es finito numerable.

   Suponemos que $X-A$ es numerable:

   Como $X = X-A \cup A$, $A$ es numerable y $X-A$ es numerable, podemos decir que $X$ es numerable. **ABS!**.
   $$
   \Rightarrow X-A \text{ es no numerable}\\
   \therefore X = X-A\cup A \sim X-A
   $$
   

2. $A \not\sub X$

   Puedo definir a $A$ como:	
   $$
   A = (A \cap X) \cup (A-X)=\overline A \cup (A-X)
   $$
   Entonces veo que $X-A=X-\overline A$ y que $\overline A \sub X$ y caigo en el caso 1.