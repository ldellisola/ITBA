# Demostración  

$$
\text{$\Gamma \cup \{\neg \gamma\}$ no es consistente $\Leftrightarrow \Gamma \vdash \gamma$}
$$

#### Demo

La ida se hace usando la definición de consistente, el teorema de la deducción y una prueba. La vuelta es sencilla.

$\Leftarrow )$

Por dato:
$$
\Gamma \vdash \gamma
$$
Entonces, si agrego $\{\neg \gamma\}$ al conunto de pruebas obtengo que:
$$
\Gamma \cup \{\neg \gamma\} \vdash \gamma
$$
Ademas, se cumple que:
$$
\Gamma \cup \{\neg\gamma\} \vdash \neg \gamma
$$
Entonces, podemos ver que el conjunto $\Gamma \cup \{\neg \gamma\}$ es inconsistente

$\Rightarrow)$

Por dato:
$$
\Gamma\cup\{\neg\gamma\} \text{ es inconsistente}
$$
Es decir:
$$
\exist \alpha \in F/\Gamma\cup\{\neg\gamma\} \vdash \alpha \land \Gamma\cup\{\neg\gamma\} \vdash \neg \alpha
$$
Entonces, por teorema de la deducción:
$$
\array{
(A)&& \Gamma\vdash (\neg\gamma \rightarrow\alpha)\\
(B)&& \Gamma\vdash (\neg\gamma \rightarrow \neg \alpha)
}
$$
Hago una prueba de $\Gamma \vdash \gamma$:
$$
\array{
(1)&&& (\neg \gamma \rightarrow\neg \alpha)\rightarrow((\neg\gamma\rightarrow\alpha)\rightarrow\gamma) &&& \text{Axioma 3}\\
(2)&&& (\neg \gamma \rightarrow \neg\alpha) &&& \text{Por dato (B)}\\
(3)&&& (\neg \gamma \rightarrow \alpha)\rightarrow \gamma &&& \text{Por MP entre (1) y (2)}\\
(4)&&& (\neg \gamma \rightarrow \alpha) &&& \text{Por dato (A)}\\
(5)&&& \gamma &&& \text{Por MP entre (3) y (4)}
}
$$
Entonces, $\Gamma \vdash \gamma$

