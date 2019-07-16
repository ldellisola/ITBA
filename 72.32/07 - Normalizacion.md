# Normalización

La normalización es obtener un diseño que cumpla con:

1. **Respetar Restricciones**:

Las restricciones son dependencias entre los datos del documento XML. Un ejemplo de esto es que no se repita informacion unica de un elemento en otro elemento.

2. **Evitar anomalías**:

   Hay 3 tipos de anomalías:

   - **De Redundancia**: Se refiere a la repetición innecesaria de informacion en varios lugares del documento, cuando en realidad debería estar centralizada en un solo lugar.
   - **De Actualización**: Causada en parte por la anomalía de redundancia, la anomalía de actualización aparece a la hora de modificar un valor de un elemento que esta dentro de varios elementos a la vez, entonces a la hora de cambiar un valor se debe recorrer a toda la estructura para asegurarse de modificar el valor en todas las instancias.
   - **De Borrado**: Similar a la anomalía de actualización, pero al borrar un elemento hay que verificar que elimine todas sus instancias.

   Estas anomalías pueden evitarse mediante el uso de referencias, similar al comportamiento de una base de datos relacional



