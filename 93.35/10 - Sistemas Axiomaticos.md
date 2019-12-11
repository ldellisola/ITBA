# Sistemas Axiomáticos

Un sistema axiomático $S$ es un conjunto de axiomas y reglas de inferencia.

Notación: $\Gamma \vdash_S \alpha$ quiere decir que $\alpha$ es deducible a partir de $\Gamma$ dentro de $S$.

## Sistema Axiomático Consistente

Un sistema axiomático $S$ es consistente si:
$$
\not \exist \alpha \in F/\array{&\empty\vdash_{S}\alpha &\and& \empty \vdash_S \neg \alpha }
$$

- **Teorema**: Sea $S$ es sistema axiomático dado por $AX_1,AX_2,AX_3$ y $MP$, entonces es consistente

   [Demostración](Demostraciones\08 - Teoria Axiomatica\Teorema - 06.html) 

