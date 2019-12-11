# Demostración

Sea $\Gamma$ es $M.C.$:
$$
\Gamma \vdash \alpha \Leftrightarrow \alpha \in \Gamma
$$
$\Leftarrow )$

Quiero ver que $\Gamma \vdash\gamma$ . Voy a hacer una prueba:
$$
\array{
(1) &&&\gamma && \text{ Por Dato}
}
$$
Entonces veo que $\Gamma \vdash \gamma$

$\Rightarrow )$

Sabemos por dato que:
$$
\Gamma \vdash\gamma
$$
Usando la [observacion](Observacion - 02.html), podemos decir que:
$$
\Gamma \cup\{\neg\gamma\} \text{ es inconsistente}
$$
Entonces, vemos que:
$$
\neg \gamma \not\in \Gamma 
$$
Por utlimo, gracias a esta [observación](Observacion - 04.html):
$$
\gamma \in \Gamma
$$
