# Demostración

Todo circuito $T$ se puede descomponer en ciclos de aristas disjuntas.

#### Demo

La demostración se va a hacer mediante induccion en $\#E_T$

- Caso Base: ==PREGUNTAR==

  - $\#E_T = 1$:

    En este caso se encuentra los circuitos tales que tienen un solo vertice y un lazo. 

  - $\#E_T=2$:

    Tengo 2 casos, puede ser un grafo $W_2$ o un vertice con 2 lazos. En el caso del $W_2$, ya es un ciclo de aristas disjuntas.

- Hipotesis Inductiva:
  $$
  \#E_T \le n
  $$

- Tesis Inductiva:
  $$
  \#E_T = n+1
  $$

Hay 2 casos:

- $T$ es un ciclo:

  Ya es un ciclo de aristas disjuntas

- $T$ no es un ciclo:

  Como $T$ no es un ciclo, por [Proposicion](#Proposicion A), tiene un ciclo interno. 

  Quitamos las aristas que pertenecen al ciclo y los vertices aislados y el resultado puede ser conexo o no.

  De cualquier forma, cada componente resulta un circuito (por [corolario](Corolario - 01.html)) con a lo sumo $n$ aristas.
  
  Entonces, por **hipotesis inductiva**, $T$ se puede descomponer en ciclos de aristas disjuntas.

# Anexo

### Proposicion A

Si $T$ es un circuito, entonces tiene al menos un subcamino que es un ciclo.













