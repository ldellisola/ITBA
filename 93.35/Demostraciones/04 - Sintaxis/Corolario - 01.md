# Demostración

Sea $\alpha \in F/ c(\alpha)>0 \Rightarrow$
$$
\exist \beta \in F/ \alpha = \neg \beta \or \exist \beta_1,\beta_2 \in F \text{ unicos}/ \alpha=(\beta_1 * \beta_2)
$$
Siendo $*\in \{\lor,\land,\rightarrow\}$

#### Demo

Hay 3 casos:

1. $\alpha = \neg \beta_1 = \neg \beta_2 \Rightarrow \beta_1 = \beta_2$

2. $\alpha = (\beta_1 * \beta_2) = (\gamma_1 \Delta \gamma_2)$

   Hay 3 posibles casos:

   1. Supongo que $long(\beta_1) > long(\gamma_2)$

      Entonces $\exist H'\text{ expresion}/\beta_1 = \gamma_1H'$, y $H'$ empueza con $\Delta$

      Entonces $\beta_1 \in F$, por  [teorema](Teorema - 03.html), la expresion a la izquierda de $\Delta$ en $\beta_1$ tiene peso menor a 0.
      
      Entonces $P(\gamma_1)>0$
      
      **ABS!**, por que $\gamma_1 \in F$
      
   2. Supongo que $long(\beta_1) < long(\gamma_1)$
   
      ==ANALOGO AL PRIMER CASO==
   
   3. $long(\beta_1) = long(\gamma_1)$
   
      Como:
      $$
      (\beta_1 * \beta_2) = (\gamma_1 \Delta \gamma_2)\\
      \array{\beta_1 = \gamma_1 &&* =\Delta&&\beta_2 = \gamma_2}
      $$
   
3. $\alpha = \neg \beta = (\gamma_1 \Delta \gamma_2)$

   **ABS!** por que no empiezan con el mismo simbolo.



 