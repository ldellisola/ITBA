# Teoria Axiomática

Sean $\alpha,\beta,\gamma \in F$, se definen los siguientes 3 axiomas:

1. $(\alpha \rightarrow(\beta\rightarrow \alpha))$
2. $(\alpha \rightarrow (\beta\rightarrow \gamma)) \rightarrow ((\alpha \rightarrow \beta)\rightarrow(\alpha \rightarrow \gamma))$
3. $(\neg \alpha \rightarrow \neg \beta) \rightarrow ((\neg \alpha\rightarrow \beta)\rightarrow \alpha)$

- **Observación**: Los tres axiomas son tautologías.

## Prueba

Una prueba es una sucesión finita de fórmulas $\alpha_1,\dots,\alpha_n$ tal que $\alpha_i$ es un axioma o se obtiene a partir del modus ponens (MP) entre $\alpha_j$ y $\alpha_k$, $j,k<i$

## Demostrable

Sea $\alpha \in F, \alpha $ es demostrable si $\exist \alpha_1,\dots,\alpha_n=\alpha$ prueba. Notación $\Gamma \vdash \alpha$

- **Teorema**: $\alpha \text{ es demostrable} \Rightarrow \alpha \text{ es una tautologia.}$

   [Demostración](Demostraciones\08 - Teoria Axiomatica\Teorema - 01.html) 

- **Teorema**: Sea $\alpha \in F, \Gamma \sube F$, decimos que $\alpha$ es deducible o demostrable a partir de $\Gamma$ si existe una sucesión finita de fórmulas $\alpha_1,\dots,\alpha_n=\alpha$ tal que:
  $$
  \array{
  1)	&	\alpha_i \text{ es un axioma}\\
  2)	&	\alpha_i \in \Gamma\\
  3)	&	\alpha_i \text{ se obtiene por MP a partir de dos formulas anteriores}
  }
  $$
  Notación: $\Gamma\vdash\alpha$, $\alpha$ se deduce de $\Gamma$.

- **Observación**: $\alpha$ es un teorema equivale a decir $\empty \vdash \alpha$, tambien se lo nota como $\vdash\alpha$.

- **Observación**: Sea $\Sigma \sube \Gamma$ y $\Sigma \vdash \alpha \Rightarrow \Gamma \vdash \alpha$

- **Teorema <u>de la Deducción</u>**: Sea $\alpha,\beta \in F, \Gamma \sube F$:
  $$
  \Gamma \vdash (\alpha\rightarrow\beta) \Leftrightarrow \Gamma \cup \{\alpha\} \vdash \beta
  $$
 [Demostración](Demostraciones\08 - Teoria Axiomatica\Teorema - 02.html) 
  
- **Teorema <u>de la Correctitud</u>**: 
   $$
   \Gamma \vdash \alpha  \Rightarrow \alpha \in C(\Gamma)
   $$
    [Demostración](Demostraciones\08 - Teoria Axiomatica\Teorema - 03.html) 
   
- **Teorema <u>de la Completitud</u>**:
   $$
   \alpha \in C(\Gamma) \Leftrightarrow \Gamma \vdash \alpha
   $$
    [Demostración](Demostraciones\08 - Teoria Axiomatica\Teorema - 05.html) 

## Conjunto Consistente

Sea $\Gamma \sube F$
$$
\Gamma \text{ es consistente si }\not\exist \alpha\in F/\Gamma\vdash \alpha \and \Gamma \vdash \neg \alpha
$$

- **Observación**: $\Gamma$ es satisfacible $\Rightarrow \Gamma$ es consistente

   [Demostración](Demostraciones\08 - Teoria Axiomatica\Observacion - 01.html) 

- **Observación**: $\Gamma \cup \{\neg \gamma\}$ no es consistente $\Leftrightarrow \Gamma \vdash \gamma$

    [Demostración](Demostraciones\08 - Teoria Axiomatica\Observacion - 02.html) 

- **Observación**: $\Gamma \cup \{\gamma\}$ no es consistente $\Leftrightarrow \Gamma \vdash \neg \gamma$

    [Demostración](Demostraciones\08 - Teoria Axiomatica\Observacion - 03.html) 

- **Teorema**: $\Gamma \text{ es consistente} \Leftrightarrow \Gamma \text{ es satisfacible}$

     [Demostración](Demostraciones\08 - Teoria Axiomatica\Teorema - 04.html) 

### Conjunto Maximal Consistente (M.C.)

Sea $\Gamma \sube F, \Gamma$ es maximal consistente si:
$$
\array{
1)	&	\Gamma \text{ es consistente}\\
2)	&	\alpha \in F \Rightarrow \alpha \in \Gamma \or \Gamma\cup \{\alpha\} \text{ no es consistente}
}
$$

- **Observación**: Si $\Gamma$ es $M.C. \Rightarrow \gamma\in \Gamma \veebar \neg\gamma\in\Gamma$

    [Demostración](Demostraciones\08 - Teoria Axiomatica\Observacion - 04.html) 

- **Observación**: Sea $\Gamma$ es $M.C.$:
  $$
  \Gamma \vdash \alpha \Leftrightarrow \alpha \in \Gamma
  $$
   [Demostración](Demostraciones\08 - Teoria Axiomatica\Observacion - 05.html) 
  
- **<u>Lema de Lindenbaum</u>**: Dado un $\Gamma$ consistente $\Rightarrow \exist \Gamma' M.C./ \Gamma' \sube \Gamma$

   [Demostración](Demostraciones\08 - Teoria Axiomatica\Lema - 01.html) 



















