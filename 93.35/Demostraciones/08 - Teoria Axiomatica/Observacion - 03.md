# Demostración

$$
\text{ $\Gamma \cup \{\phi\}$ no es consistente $\Leftrightarrow \Gamma \vdash \neg \phi$

}
$$

#### Demo

La ida se hace usando la definición de consistente, el teorema de la deducción y una prueba. La vuelta es sencilla.

$\Leftarrow )$

Por dato:
$$
\Gamma \vdash \neg\gamma
$$
Entonces, si agrego $\{\neg \gamma\}$ al conunto de pruebas obtengo que:
$$
\Gamma \cup \{ \gamma\} \vdash \neg\gamma
$$
Ademas, se cumple que:
$$
\Gamma \cup \{\gamma\} \vdash  \gamma
$$
Entonces, podemos ver que el conjunto $\Gamma \cup \{\neg \gamma\}$ es inconsistente

$\Rightarrow)$

Por dato:
$$
\Gamma\cup\{\gamma\} \text{ es inconsistente}
$$
Es decir:
$$
\exist \alpha \in F/\Gamma\cup\{\gamma\} \vdash \alpha \land \Gamma\cup\{\gamma\} \vdash \neg \alpha
$$
Entonces, por teorema de la deducción:
$$
\array{(A)&& \Gamma\vdash (\gamma \rightarrow\alpha)\\(B)&& \Gamma\vdash (\gamma \rightarrow \neg \alpha)}
$$
Hago una prueba de $\Gamma \vdash \neg\gamma$:
$$
\array{
(1)&&& (\neg\neg \gamma \rightarrow\neg \neg \alpha)\rightarrow((\neg\neg\gamma\rightarrow\neg\alpha)\rightarrow\neg\gamma) &&& \text{Axioma 3}\\
(2)&&& ( \gamma \rightarrow \alpha) \rightarrow(\neg\neg\gamma \rightarrow \neg\neg\alpha) &&& \text{Visto en clase}\\
(3)&&& (\gamma \rightarrow \alpha) &&& \text{Por dato (A)}\\
(4)&&& (\neg \neg\gamma \rightarrow \neg\neg \alpha) &&& \text{MP entre (2) y (3)}\\
(5)&&& (\neg\neg \gamma \rightarrow\neg\neg \alpha) \rightarrow\neg\gamma &&& \text{MP entre (1) y (4)}\\
(6)&&& (\gamma \rightarrow \neg\alpha)\rightarrow (\neg\neg\gamma \rightarrow\neg\alpha) &&& \text{Visto en clase}\\
(7)&&& \gamma \rightarrow \neg \alpha &&& \text{Por dato (B)}\\
(8)&&& \neg\neg\gamma\rightarrow\neg\alpha &&& \text{MP entre (6) y (7)}\\
(9)&&& \gamma &&& \text{MP entre (8) y (5)}
}
$$


Entonces, $\Gamma \vdash \gamma$

