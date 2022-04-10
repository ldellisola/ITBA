# Agentes y Ambientes

## Agentes

Los agentes tienen sensores (cámaras, etc) mediante las cuales obtiene percepciones del ambiente y puede efectuar acciones sobre el ambiente. 

<img src="Resources/01 - Agentes y Ambientes/Screen Shot 2022-03-03 at 11.14.49.png" alt="Screen Shot 2022-03-03 at 11.14.49" style="zoom:50%;" />

Los agentes pueden ser **racionales**, si realizan aquellas acciones que les permiten tener un mejor desempeño. El desempeño se puede medir de la siguiente forma:

- Determina el éxito de un agente.
- Puede ser a corto o largo plazo.

El agente es **omnisciente** si sabe todos los resultados posibles de sus acciones. La diferencia entre este y el agente racional es que el agente racional puede saber el resultado inmediato, mientras que el agente omnisciente conoce todas las consecuencias de sus acciones.

Los agentes pueden o no tener **estado interno**. Si no tienen estado interno se los llama **agente reactivo**, donde su acción depende solo de la percepción de los sensores. De lo contrario, su función también tienen en cuenta al estado interno.

## Ambientes

El ambiente es observable a distintos grados desde el punto de vista de un agente, pudiendo ser **totalmente observable** (Ajedrez) o **parcialmente observable** (Poker).

El ambiente es **deterministico** si el estado siguiente al actual es determinado únicamente por el estado actual junto a la acción del agente. Si tiene cierto porcentaje de azar, se lo llama **estocástico**. Los ambientes parcialmente observables pueden parecer estocásticos para el agente y su nombre es **estratégico**.

También puede ser **episódico**, cuando se mida en “episodios”. En este caso las acciones afectan al estado actual del ambiente pero no en el proximo episodio. FALTA

El ambiente puede ser **estático** si el ambiente no cambia mientras el agente esta decidiendo que acción tomar, de lo contrario es **dinámico**.

El ambiente es **discreto** si existe una cantidad limitada de percepciones y acciones distintas y claramente discernibles. De lo contrario es **continuo**.

El ambiente es **conocido** si se conocen todas las consecuencias de las acciones o las probabilidades en su totalidad. Si es **desconocido**, el agente tiene que aprenderlas o estimarlas.

Si el ambiente tiene un solo agente, es **individual**, de lo contrario, se lo llama **multi-agente**.