# Teoria Axiomatica

Sean $\alpha,\beta,\gamma \in F$, se definen los siguentes 3 axiomas:

1. $(\alpha \rightarrow(\beta\rightarrow \alpha))$
2. $(\alpha \rightarrow (\beta\rightarrow \gamma)) \rightarrow ((\alpha \rightarrow \beta)\rightarrow(\alpha \rightarrow \gamma))$
3. $(\neg \alpha \rightarrow \neg \beta) \rightarrow ((\neg \alpha\rightarrow \beta)\rightarrow \alpha)$

- **Observacion**: Los tres axiomas son tautologias.

## Prueba

Una prueba es una sucesion finita de formulas $\alpha_1,\dots,\alpha_n$ tal que $\alpha_i$ es un axioma o se obtiene a partir del modus ponens (MP) entre $\alpha_j$ y $\alpha_k$, $j,k<i$

## Demostrable

Sea $\alpha \in F, \alpha $ es demostrable si $\exist \alpha_1,\dots,\alpha_n=\alpha$ prueba. Notacion $\Gamma \vdash \alpha$

- **Teorema**: $\alpha \text{ es demostrable} \Rightarrow \alpha \text{ es una tautologia.}$

- **Teorema**: Sea $\alpha \in F, \Gamma \sube F$, decimos que $\alpha$ es deducible o demostrable a partir de $\Gamma$ si existe una sucesion finita de formulas $\alpha_1,\dots,\alpha_n=\alpha$ tal que:
  $$
  \array{
  1)	&	\alpha_i \text{ es un axioma}\\
  2)	&	\alpha_i \in \Gamma\\
  3)	&	\alpha_i \text{ se obtiene por MP a partir de dos formulas anteriores}
  }
  $$
  Notacion: $\Gamma\vdash\alpha$, $\alpha$ se dedice de $\Gamma$.

- **Observacion**: $\alpha$ es un teorema equivale a decir $\empty \vdash \alpha$, tambien se lo nota como $\vdash\alpha$.

- **Observacion**: Sea $\Sigma \sube \Gamma$ y $\Sigma \vdash \alpha \Rightarrow \Gamma \vdash \alpha$

- **Teorema <u>de la Deduccion</u>**: Sea $\alpha,\beta \in F, \Gamma \sube F$:
  $$
  \Gamma \vdash (\alpha\rightarrow\beta) \Leftrightarrow \Gamma \cup \{\alpha\} \vdash \beta
  $$

- **Teorema <u>de la Completitud</u>**: $\alpha \in C(\Gamma) \Rightarrow \Gamma \vdash \alpha$

## Conjunto Consistente

Sea $\Gamma \sube F$
$$
\Gamma \text{ es consistente si }\not\exist \alpha\in F/\Gamma\vdash \alpha \and \Gamma \vdash \neg \alpha
$$

- **Observacion**: $\Gamma$ es satisfacible $\Rightarrow \Gamma$ es consistente
- **Observacion**: $\Gamma \cup \{\neg \phi\}$ no es consistente $\Leftrightarrow \Gamma \vdash \phi$
- **Observacion**: $\Gamma \cup \{\phi\}$ no es consistente $\Leftrightarrow \Gamma \vdash \neg \phi$
- **Teorema**: $\Gamma \text{ es consistente} \Leftrightarrow \Gamma \text{ es satisfacible}$

### Conjunto Maximal Consistente (M.C.)

Sea $\Gamma \sube F, \Gamma$ es maximal consistente si:
$$
\array{
1)	&	\Gamma \text{ es consistente}\\
2)	&	\alpha \in F \Rightarrow \alpha \in \Gamma \or \Gamma\cup \{\alpha\} \text{ no es consistente}
}
$$

- **Observacion**: Si $\Gamma$ es $M.C. \Rightarrow \phi \in \Gamma \veebar \neg\phi \in\Gamma$

- **Observacion**: Sea $\Gamma$ es $M.C.$:
  $$
  \Gamma \vdash \alpha \Leftrightarrow \alpha \in \Gamma
  $$
  

- **<u>Lema de Lindenbaum</u>**: Dado un $\Gamma$ consistente $\Rightarrow \exist \Gamma' M.C./ \Gamma' \sube \Gamma$





















