# Demostración

Sea $e$ una arista en un grafo conexo $G$:
$$
\text{ es conexo $\Leftrightarrow e$ es una arista ciclo de $G$}
$$

#### Demo

$\Rightarrow )$ 

Sea $e=\{a,b\}$, queremos probar que si $G-\{e\}$ es conexo $\Rightarrow \exist $ un camino en $G-\{e\}$ entre $a$ y $b$.

Hay un camino simple $a-b$, dicho camino concatenado con $a-e-b$ forman un ciclo en $G$, por lo que $e$ es una arista ciclo.

$\Leftarrow )$

Si $e=\{a,b\}$ es una arista ciclo en $G \Rightarrow$ en $G-\{e\}$ todo par de vertices esta unido por al menos un camino ($G$ es conexo) pues $a$ y $b$ siguen unidos por el resto del ciclo que queda al sacar $e$.

