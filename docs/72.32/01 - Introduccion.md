# Introducción

Un documento esta formado por 3 partes:

- **Estructura**: Como esta organizada la informacion.
- **Presentación**: Es la forma en que se mostraran los datos.
- **Contenido**: Son los datos o la informacion en concreto.

Los tags del XML describen a sus partes, por lo que se dice que se **auto-describe**.

## Historia del formato XML

El lenguaje XML  es parte de un tipo especial de lenguajes llamados **Markup**. El primer lenguaje de este tipo nació en los años 80 y fue llamado **SGML** (Standard Generalized Markup Language). Este lenguaje proponía separar a los documentos en las 3 componentes lógicas descriptas anteriormente. Este lenguaje se utilizo mucho pero era muy complejo, su sintaxis era poco legible y las herramientas utilizadas para el diseño de estos documentos eran muy complejas.

Luego, en la década de los 90 apareció **HTML** (Hypertext Markup Languaje), que es el lenguaje utilizado para indicar el formato de las páginas web, pero no tienen semántica, entonces es complicado procesar las páginas web.

Por ultimo, en 1998, surge **XML** (Extensive Markup Languaje) que toma ideas de **SGML** pero como su objetivo esta en la simplicidad y en que se va a utilizar para enviar informacion por internet.

## World Wide Consortium

El World Wide Consortium (**W3C**) es una comunidad que establece estándares para su utilización en la internet, entre ellos se encuentra HTML, XML, XSL, etc.

Para que la W3C recomiende un protocolo, este tiene que seguir los siguientes pasos:

1. **Working Draft**: Es un documento publicado por la W3C para que sea revisado por la comunidad. De aquí pueden avanzar a la próxima fase o quedar como **Working Group Notes**, es decir, que no hubo aval para el protocolo,
2. **Candidate Recomendation**: 

## Ventajas del XML

XML es un meta Mark Down languaje por que permite definir tipos de documentos, además es:

- **Flexible**: si una aplicación ya maneja cierto tipos de documentos XML, y se agregan partes a ese documento, mientras que la aplicación no necesite leer la nueva informacion, no es necesario modificarla.
- **Extensible**: Cada diseñador genera sus tags.
- **Simple**.
- **Internacional**: Soporta Unicode

## Objetivos del Diseño de XML

1. Debe poder usarse sobre internet.
2. Debe soportar un grupo variado de aplicaciones (No debe incorporar una forma de visualización).
3. Debe ser compatible con SGML.
4. Debe ser sencillo de escribir programas que procesen documentos XML.
5. Las características opcionales deben ser pocas, idealmente ninguna.
6. Los documentos deben ser legibles para los humanos y razonablemente claros.
7. El proceso de diseño debe ser rápido.
8. El diseño de un XML debe ser formal y conciso.
9. Los documentos XML debe ser fáciles de crear.
10. La brevedad de los markups es de mínima importancia

## Usos del XML

XML se utiliza típicamente para aplicaciones tipo:

- **Document Management**: permite que un mismo datos se ofrezca en múltiples formatos.
- **Business to Business**: Permite intercambiar informacion entre dos sistemas incompatibles.