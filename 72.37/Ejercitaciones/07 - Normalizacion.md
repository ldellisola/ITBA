# Normalizacion

## 1

Demostrar las reglas de Inferenca para dependencias funcionales a partir de los axiomas de armstrong.

- <u>Reflexividad:</u>
  $$
  Y \subseteq X \Rightarrow X \rightarrow Y
  $$

- <u>Aumentación:</u>
  $$
  X \rightarrow Y \Rightarrow XZ \rightarrow YZ
  $$

- <u>Transitividad:</u>
  $$
  \left .
  	\array{
  	X \rightarrow Y \\
  	Y \rightarrow Z
  	}
  \right \}
  \Rightarrow 
  X \rightarrow Z
  $$

A partir de esas reglas demostrar:

- **Union:**
  $$
  \left .
  	\array{
  		X \rightarrow Y\\
  		X \rightarrow Z
  	}
  \right \}
  
  \Rightarrow 
  X \rightarrow YZ
  $$
  Demo:
  $$
  \array{
  	(1)	&	X \rightarrow Y \\
  	(2)	&	XZ \rightarrow YZ \\
  	(3) &	X \rightarrow Z  \Rightarrow X\rightarrow XZ\\
  	(4) &	\left . \array{
  					X \rightarrow XZ\\
  					XZ \rightarrow YZ
  					}
  			\right \} \Rightarrow X \rightarrow YZ
  }
  $$
  $(1)$ Por dato.

  $(2)$ Por aumentacion.

  $(3)$ Por dato $X \rightarrow Z$ y por reflectividad $X\rightarrow X$

  $(4)$ Por transitividad

- **PseudoTransitividad:**
  $$
  \left .
  	\array{
  		X \rightarrow Y \\
  		UY \rightarrow Z
  	}
  \right \}
  \Rightarrow XU \rightarrow Z
  $$
  Demo:
  $$
  \array{
  	(1)	&	X \rightarrow Y \\
  	(2)	&	XU \rightarrow YU \\
  	(3) &	\left \{
  				\array{
  					XU \rightarrow YU \\
  					YU \rightarrow Z
  				}
  			\right . \\
  	(4)	&	XU \rightarrow Z 
  }
  $$
  $(1)$ Por dato

  $(2)$ Por aumentacion

  $(3)$ Por dato

  $(4)$ Por transitividad

- **Descomposicion:**
  $$
  X \rightarrow YZ
  
  \Rightarrow
  \left\{
  	\array{
  		X \rightarrow Y \\
  		X \rightarrow Z
  	}
  \right.
  $$
  Demo:

  Por reflexividad, si $X \rightarrow YZ$, entonces $YZ \subset X$. Entonces: $X \rightarrow Z$ y $X\rightarrow Y$