# Demostración

Si en la red el $val(f)=cap(k)$ para algun corte:
$$
f = f^* \and k = k^*
$$

#### Demo

$$
val(f) \leq cap(k) ~~~\forall k \in <V_f,V_s>\\
val(f) = \sum_{e \in <V_f,V_s}f(e)-\sum_{e\in <V_s,V_f>}f(e) \leq
\sum_{e \in <V_f,V_s>}f(e) \leq \sum_{e \in <V_f,V_s>} cap(e) \leq cap(k)\\

val(f^*) \leq cap(k^*) \leq cap(k) = val(f) \leq val(f^*) \leq cap(k^*)\\
\Rightarrow k = k^*\\
\Rightarrow f = f^*
$$

