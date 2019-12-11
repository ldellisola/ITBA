# Logica Proposicional

## Satisfacibilidad

- Sea $\alpha \in F, v$ valuacion, decimos que $v$ <u>satisface</u> a $\alpha$ si $v(\alpha)=1$.
- Sea $\alpha \in F$, decimos que $\alpha$ es <u>satisfacible</u> si $\exist v \text{ valuacion }/v(\alpha)=1$
- Sea $\Gamma \sube F$, decimos que $v$ valuacion <u>satisface</u> a $\Gamma$ si $v(\alpha)=1 ~~\forall\alpha \in \Gamma$. Notacion $v(\Gamma)=1$.

### Finitamente Satisfacible

Sea $\Gamma\sube F, \Gamma$ es <u>finitamente satisfacible</u> (f.s.) si todo subconjunto finito de $\Gamma$ es satisfacible.

- **Lema**: Sea $\Gamma \sube F, p_i\in Var$:
  $$
  \Gamma \text{ es f.s.} \Rightarrow R\cup \{p_i\} \text{ es f.s.} \or R\cup \{\neg p_i\} \text{ es f.s.}
  $$
   [Demostración](Demostraciones\06 - Logica Proposicional\Lema - 01.html) 

- **Teorema <u>de Compacidad</u>**: Sean $\Gamma \sube F$:
  $$
  \Gamma \text{ es satisfacible }\Leftrightarrow \Gamma \text{ es f.s.}
  $$
 [Demostración](Demostraciones\06 - Logica Proposicional\Teorema - 04.html) 
  
- **Teorema**: Son equivalentes:
  $$
  \array{
  1)&\Gamma \text{ es f.s } \Leftrightarrow \Gamma \text{ es satisfacible}\\
  2)&\Gamma \text{ no es f.s.} \Leftrightarrow \Gamma \text{ es insatisfacible}\\
  3)&\alpha \in C(\Gamma) \Rightarrow \exist \Gamma' \text{ finito}/ \Gamma' \sube \Gamma \and \alpha \in C(\Gamma')
  }
  $$
   [Demostración](Demostraciones\06 - Logica Proposicional\Teorema - 05.html) 

## Consecuencia

Sea $\Gamma \sube F, \alpha \in F$, decimos que $\alpha$ es consecuencia de $\Gamma$ si se cumple con la propiedad:
$$
v(\Gamma)=1 \Rightarrow v(\alpha)=1~~\forall v \text{ Valuacion}
$$
Al conjunto de formulas que son parte de la consecuencia de un conjunto se lo nota $C(\Gamma)$.

- **Teorema**: Sea $\alpha \in F, \Gamma \sub Formulas$, entonces:
  $$
  \alpha \in C(\Gamma) \Leftrightarrow \Gamma \cup \{\neg \alpha\} \text{ es insatisfacible}
  $$
 [Demostración](Demostraciones\06 - Logica Proposicional\Teorema - 01.html) 
  
- **Teorema**: Sea $\alpha \in F, \Gamma=\{\gamma_1,\dots,\gamma_n\}\sube Formulas$, entonces:
  $$
  \alpha \in C(\Gamma) \Leftrightarrow \beta-((\gamma_1 \and \dots \and \gamma_n) \rightarrow \alpha) \text{ es tautologia}
  $$
 [Demostración](Demostraciones\06 - Logica Proposicional\Teorema - 02.html) 
  
- **Teorema <u>de la deducción</u>**: Sean $\alpha,\beta \in F, \Gamma \sube F,$ entonces:
  $$
  (\alpha \rightarrow \beta) \in C(\alpha) \Leftrightarrow \beta \in C(\Gamma \cup \{\alpha\})
  $$
  [Demostración](Demostraciones\06 - Logica Proposicional\Teorema - 03.html) 



