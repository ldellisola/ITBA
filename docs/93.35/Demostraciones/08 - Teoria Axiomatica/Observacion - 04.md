# Demostración

Si $\Gamma$ es $M.C. \Rightarrow$ 
$$
\array{\gamma\in \Gamma \veebar \neg\gamma\in\Gamma && \forall \gamma \in F}
$$

#### Demo

La demostración se hace por el absurdo utilizando la Ley de Morgan para la negación.

Supongamos que $\neg(\gamma \in \Gamma ~~\veebar ~~\neg\gamma \in \Gamma)$:

Hay 2 casos:

1. $\gamma \not\in \Gamma ~~ \veebar~~\neg\gamma \not\in\Gamma$

   Como $\gamma \not\in \Gamma$ y $\Gamma$ es $MC$, utilizando a la [observación anterior](Observacion - 01.html):
   $$
   \Gamma \cup\{\gamma\} \text{ es inconsistente}\\
   \Rightarrow \Gamma \vdash \neg \gamma
   $$
   Como $\neg\gamma \not\in \Gamma$ y $\Gamma$ es $MC$, utilizando a la [observación anterior](Observacion - 02.html):
   $$
   \Gamma \cup\{\neg\gamma\} \text{ es inconsistente}\\
   \Rightarrow \Gamma \vdash  \gamma
   $$
   $\therefore \Gamma$ es inconsistente. **ABS!**

2. $\gamma \land \neg\gamma \in \Gamma$

   Como $\Gamma \vdash \gamma$ y ademas $\Gamma \vdash \neg\gamma$:
   $$
   \Gamma \text{ es inconsistente}
   $$
   **ABS!**

$\therefore \gamma \in \Gamma ~~\veebar~~ \neg\gamma \in\Gamma$ 