# Normalización

La normalizacion es obtener un diseño que cumpla con:

1. Respetar Restricciones:

Las restricciones son dependecias entre los datos del documento XML. Un ejemplo de esto es que no se repita informacion unica de un elemento en otro elemento.

2. Evitar anomalias:

   Hay 3 tipos de anomalias:

   - **De Redundancia**: Se refiere a la repeticion innecesaria de informacion en varios lugares del documento, cuando en realidad deberia estar centralizada en un solo lugar.
   - **De Actualización**: Causada en parte por la anomalia de redundancia, la nomalia de actualizacion aparece a la hora de modificar un valor de un elemento que esta dentro de varios elementos a la vez, entonces a la hora de cambiar un valor se debe recorrer a toda la estructura para asegurarse de modificar el valor en todas las intancias.
   - **De Borrado**: Similar a la anomalia de actualizacion, pero al borrar un elemento hay que verificar que elimine todas sus instancias.

   Estas anomalias pueden evitarse mediante el uso de referencias, similar al comportamiento de una base de datos relacional



