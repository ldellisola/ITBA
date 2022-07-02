# Politicas de Seguridad

Una política de seguridad es un enunciado que separa a los estados de un sistema en autorizados y no autorizados.

<img src="Resources/15 - Politicas de Seguridad/Screen Shot 2022-05-05 at 16.12.47.jpg" alt="Screen Shot 2022-05-05 at 16.12.47" style="zoom:50%;" />

Si el sistema entra en un estado no autorizado, entonces ocurrió una **violación de seguridad**. 

Un **sistema seguro** es aquel que comienza en un estado autorizado y no puede entrar en un estado no autorizado:

<img src="Resources/15 - Politicas de Seguridad/Screen Shot 2022-05-05 at 16.14.21.jpg" alt="Screen Shot 2022-05-05 at 16.14.21" style="zoom:50%;" />

## Confidencialidad

Sean $X$ un conjunto de entidades e $I$ información, $I$ es confidencial para $X$ si ningún miembro de $X$ puede obtener información de $I$.

<img src="Resources/15 - Politicas de Seguridad/Screen Shot 2022-05-05 at 16.16.03.jpg" alt="Screen Shot 2022-05-05 at 16.16.03" style="zoom:50%;" />

Ni siquiera por vias indirectas:

<img src="Resources/15 - Politicas de Seguridad/Screen Shot 2022-05-05 at 16.18.24.jpg" alt="Screen Shot 2022-05-05 at 16.18.24" style="zoom:50%;" />

## Integridad

Sea $X$ un conjunto de entidades e $I$ información o un recurso, $I$ es integro para $X$ si todo miembro de $X$ confia en $I$:

<img src="Resources/15 - Politicas de Seguridad/Screen Shot 2022-05-05 at 16.19.36.jpg" alt="Screen Shot 2022-05-05 at 16.19.36" style="zoom:50%;" />

Hay distintos tipos de integridad:

- **Integridad de datos**: Confianza en transporte y almacenamiento.
- **Integridad de Origen**: Confianza en el origen del dato o la identidad que representa.
- **Garantía**: Confianza en que el recurso o programa funciona como debería.

## Disponibilidad

Sea $X$ un conjunto de entidades e $I$ un recurso, $I$ esta disponible para $X$ si todo miembro de $X$ puede acceder a $I$ cuando lo requiera:

<img src="Resources/15 - Politicas de Seguridad/Screen Shot 2022-05-05 at 16.22.53.jpg" alt="Screen Shot 2022-05-05 at 16.22.53" style="zoom:50%;" />

## Paradigmas de control de Acceso

Las políticas se centran en controlar el acceso a objetos. Estos paradigmas son:

- **Acceso Discrecional (DAC)**: Esta basada en reglas arbitrarias, con mecanismos puntales. Suele suceder que el acceso esta controlado por los creadores.
- **Acceso Mandatorio (MAC)**: Son reglas fijas predeterminadas, definidas con mecanismos del sistema. Estas reglas no pueden ser alteradas.

## Modelos

Los modelos describen familias de políticas y proveen un marco teórico común. Esto permite reutilizar demostraciones y simplifican el desarrollo de políticas.

### Modelo Bell-LaPadula

Es un modelo de política militar que se centra en garantizar confidencialidad. El sistema esta conceptualizado como:

- Dividir al sistema en Sujetos y Objetos

- Las acciones sucede en transacciones:
  $$
  (\text{Sujeto, Objeto, Acción})
  $$

- El modelo, en su version simplificada, se reduce a una lista ordenada de niveles, donde cada objeto y sujeto tiene un nivel asignado.

Ademas de niveles, se definen categorías que describen el tipo de información. Las categorías no están ordenadas.

Luego, a cada objeto y sujeto se le asigna un compartimiento, compuesto por un nivel y un set de categorías.

Sea $l \in L,C\in \text{CAT}$, se define la **dominancia** como:
$$
(l,C)\text{ dom } (l',C') \iff l' \le l \land C' \le C
$$
Los compartimientos son un conjunto parcialmente ordenado. Dado dos compartimientos $A,B$, puede ocurrir que:

- $A \text{ dom } B$
- $B \text{ dom } A$
- Ni $A \text{ dom } B$ ni $B \text{ dom } A$.

#### Lectura

En este modelo, la información siempre fluye hacia arriba, donde se permite **leer** información de menor nivel pero nunca de mayor nivel. Esto se representa con la siguiente condición de seguridad simple:
$$
S \text{ puede leer} O \iff L(S) \text{ dom } L(O) \land S \text{ tiene permiso para leer }O
$$
Donde combina accesso mandatorio con discrecional.

#### Escritura

La **escritura** también funciona de esta forma, fluyendo hacia arriba. También se permite escribir información de mayor nivel pero se prohibe escribir información de menor nivel.

La escritura esta definida con una condición de cierra:
$$
S \text{ puede escribir } O \iff L(S) \text{ dom } L(O) \land S \text{ tiene permiso para escribir }O
$$

#### DAC

El acceso discrecional se define como una matriz con acceso:

<img src="Resources/15 - Politicas de Seguridad/Screen Shot 2022-05-05 at 16.51.02.jpg" alt="Screen Shot 2022-05-05 at 16.51.02" style="zoom:50%;" />

Esta matriz restringe los accesos dados por el modelo mandatorio.

#### El problema de la Comunicación

Este problema se refiere a la comunicación entre dos sujetos $A,B/ B\text{ dom }A$. En este caso, Si $A$ se quiere comunicar con $B$, entonces la regla de cierre permite enviar el mensaje, pero al responder, la regla de cierre lo prohibe.

El modelo de Bell-LaPadula permite la posibilidad de disminuir el nivel de acceso temporalmente, pero esta disminución de acceso debe ser solicitada explícitamente.

## Principio de Tranquilidad

Los usuarios y objetos no cambian sus niveles luego de ser creados, pero que pasaría si estos cambian:

- De subir el nivel de un objeto: La informacion ya fue leída por usuarios de menor nivel y viola el principio de seguridad simple.
- De bajar el nivel de seguridad de un objeto: Viola el principio de cierre y ademas existe el problema de reclasificación.

## Politicas de Integridad

El objetivo es preservar la integridad y tiene requerimientos muy distintos a las politicas de confidencialidad:

- Prevenir la modificación de datos por entidades no autorizadas.
- Prevenir modificaciones no autorizadas de datos por entidades autorizadas.
- Asegurad que los datos representan la informacion que se supone deben representar.

### Modelos de Integridad de Biba

Todos los modelos utilizan la misma base:

Sea $S$ un conjunto de sujetos, $O$ un conjunto de objetos e $I$ niveles de integridad, se definen los siguientes operadores:

- Relation $<:I\times I$ indica dominaría del primero sobre el segundo.
- $i: S\times O \rarr I$ indica el nivel de seguridad de una entidad.
- $\underline r:S \times O$ son pares sujeto-objeto, que indican que el sujeto puede leer al objeto.
- $\underline w:S \times O$ son pares sujeto-objeto, que indican que el sujeto puede escribir al objeto.
- $\underline x:S\times O$ son pares sujeto-objeto, que indican que el sujeto puede ejecutar al objeto.

#### Low-Water-Mark Policy

La idea es que si un sujeto usa información poco confiable, se vuelve poco confiable. Se basa en 3 reglas:

1. $s\in S$ puede escribir $o \in O$ si y solo si $i(o) \le i(s)$.
2. Si $s \in S$ lee $o \in O$, entonces $i'(s) = \min(i(s),i(o))$ es el nuevo nivel de integridad de $s$.
3. $s_1 \in S$ puede ejecutar $s_2 \in S$ si y solo si $i(s_2) \le i(s_1)$

Este modelo previene contra:

- Modificaciones directas que bajarían el nivel de integridad.
- Modificaciones indirectas con información de menor nivel de integridad.

Si hay un camino de transferencia entre $o_1$ y $o_n$ la aplicación de la platica require que $\forall i/i < j \le n, i(o_j) \le i(o_n) $.

El problema de esta política es que los niveles de integridad de los sujetos decaen con el uso del sistema. Eventualmente nadie puede acceder o generar objetos de niveles altos de integridad.

una alternativa para solucionar esto es modificar los niveles de integridad de los objetos en vez de los sujetos. Pero esta solución solo mueve el problema hacia los objetos.

#### Ring Policy

Esta política considera solamente el problema de la modificación directa de objetos.

Se basa en las siguientes reglas:

1. $s\in S$ puede escribir $o\in O$ si y solo si $i(o) \le i(s)$.
2. Cualquier sujeto puede leer cualquier objeto.
3. $s_1 \in S$ puede ejecutar $s_2 \in S$ si y solo si $i(s_2) \le i(s_1)$.

Aqui los niveles de integridad son estáticos y se previene contra la modificación directa. Ademas, permite utilizar información de menor nivel de confianza para generar información de mayor nivel de confianza.

#### Strict Integrity

Es similar al modelo Bell-LaPadula.

Se basa en las siguientes reglas:

1. $s\in S$ puede leer $o \in O$ si y solo si $i(s) \le i(o)$.
2. $s \in S$ puede escribir $o \in O$ si y solo si $i(o) \le i(s)$
3. $s_1 \in S$ puede ejecutar $s_2 \in S$ si y solo si $i(s_2) \le i(s_1)$

Se pueden agregar categorías y controles discrecionales para obtener el dual de Bell-LaPadula. Ademas mantiene la misma restricción en el flujo de información.

### Niveles de Integridad

A mayor nivel, hay una mayor confianza de que:

- Un programa se ejecutara correctamente o detectara errores en sus entradas.
- Un dato es preciso y/o confiable.

Una clasificación normal seria:

1. No confiable
2. Ligeramente confiable
3. Confiable
4. Altamente confiable
5. Intachable

### Caminos de Transferencia de Información

Representa el camino que puede seguir la informacion para llegar desde un objeto a otro. Se lo denota con una secuencia de objetos $o_1,\dots,o_{n+1}$ y sujetos $s_1,\dots,s_n$ tal que $s_i~\underline r~o_i$ y $s_i~\underline w~o_{i+1} \forall i/1\le i \le n$.

<img src="Resources/15 - Politicas de Seguridad/Screen Shot 2022-05-05 at 17.53.13.jpg" alt="Screen Shot 2022-05-05 at 17.53.13" style="zoom:50%;" />

## Modelo de la Muralla China

Es un modelo hibrido que toma en cuenta la confidencialidad como la integridad. Se concentra en el problema de conflictos de interes, utilizado mayormente en ámbitos financieros y judiciales. Algunos ejemplos de esto es:

- Un abogado no puede representar a dos empresas competidoras.

La idea detrás de esto esta en agrupar a las entidades en clases de conflicto de interes y controla:

-  el acceso de sujetos a cada clase.
- La escritura a todas las clases para impedir que se mueva informacion en contra de la politica.
- Permitir que datos desclasificados sean vistos por todos.

En este modelo, se utilizan las siguientes definiciones:

- Un **objeto** es un item de información.
- Un **company dataset (CD)** es un conjunto de objetos relacionados con la misma empresa o grupo.
- Un **conflict of interest class (COI)** contiene company datasets de empresas con conflictos de intereses. Ademas se asume que cada objeto pertenece exactamente a un CD y a un COI.

La idea es que un usuario nuevo puede leer cualquier objeto, pero cuando haya leído un objeto, no puede acceder a objetos de otras empresas que entren en conflicto. 

Este modelo agrega un **elemento temporal**, ya que si un sujeto lee cualquier CD de un COI, no pude volver a leer otra CD del mismo COI, nunca. Entonces el acceso depende de la historia de S

### Condición simple de Seguridad

$s$ puede leer $o$ si alguna de las condiciones se cumple:

- Existe $o'$ leido previamente tal que $\text{CD}(o) = \text{CD}(o')$
- Para todo $o'$ leido previamente, $\text{CD}(o) \neq \text{CD}(o')$
- $o$ es un objeto publico

### Propiedad de Cierre

$s$ puede escribir a $o$ si se cumplen las siguientes condiciones:

- $s$ puede leer $o$ segun la condición simple de seguridad.
- Para todo objeto no publico $o'$, si $s$ puede leer $o'$ entonces $\text{CD}(o') = \text{CD}(o)$.

Esto significa que para escribir un objeto es necesario que todos objeto accesible para la entidad permanezca al mismo grupo.

## Composición de Politicas

Al conectar dos sistemas seguros, surgen dos preguntas:

- La composición de los dos sistemas sera segura?
- Se puede crear una política única consistente con ambas?

Si los modelos de políticas son iguales, entonces:

- Si se puede cambiar la politica de los componentes, la composición es trivial.
- Si no se puede, hay que demostrar que la composición cubre los requerimientos de las políticas de los componentes, lo cual es bastante complicado.

Si los modelos de politicas son diferentes, se complica todavía mas. Hay que definir que significa *“seguro”* en ese contexto y que politica domina la composición. Aunque no hay una solución, se pueden usar distintos principios de guía:

- **Autonomía**: Cualquier acceso permitido por la politica de seguridad de un componente debe estar permitido en la politica emergente.
- **Seguridad**: Cualquier acceso prohibido por la política de seguridad de un componente debe ser prohibido por la política emergente.

La política compuesta debe satisfacer la seguridad de las políticas de los componentes.































 