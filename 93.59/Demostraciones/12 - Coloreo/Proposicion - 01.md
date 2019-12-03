# Demostración

Sea $G$ conexo y $k$ critico, $\Rightarrow$ $gr(v_i) \ge k-1~~\forall v_i\in G$.

#### Demo

Supongamos que hay un vértice $v$ tal que $gr(v)<k-1$ y que $g(v)=k-2$.

Como $G-\{v\}$ es $k-1$ coloreable y como los adyacentes a $v$ sin $k-2$ coloreables, estos no usan los $k-1$ colores.

$\Rightarrow$ queda 1 color que se puede asignar a $v$ y “*agregar*” a $G-\{v\}$ con lo que $G$ quedaría pintado con $k-1$ colores (Coloreo propio

$\Rightarrow$ $G$ no es k critico. **ABS!** (Contradice la hipótesis).

