# Sistemas Axiomaticos

Un sistema axiomatico $S$ es un conunto de axiomas y reglas de inferencia.

Notacion: $\Gamma \vdash_S \alpha$ quiere decir que $\alpha$ es deducible a partir de $\Gamma$ dentro de $S$.

## Sistema Axiomatico Consistente

Un sistema axiomatico $S$ es consistente si:
$$
\not \exist \alpha \in F/\array{&\empty\vdash_{S}\alpha &\and& \empty \vdash_S \neg \alpha }
$$

- **Teorema**: Sea $S$ es sistema axiomatico dado por $AX_1,AX_2,AX_3$ y $MP$, entonces es consistente

