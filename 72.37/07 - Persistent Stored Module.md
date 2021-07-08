# Persistent Stored Module (PSM)

### Diferencias con funciones normales



<img src="Resources/Untitled/image-20200526141007064.png" alt="image-20200526141007064" style="zoom:50%;" />

### Definición

```mssql
CREATE FUNCTION nombreFuncion ([Parametros])
RETURNS tipoDevuelto
[DETERMINISTIC | NOT DETERMINISTIC]
[NO SQL | CONTAINS SQL | READS SQL | MODIFIED SQL DATA]
[DYNAMIC RESULT SETS]
BEGIN
... SQL ...
END
```

##### `[NO SQL | CONTAINS SQL | READS SQL | MODIFIED SQL DATA]`

- `[NO SQL]`: No contiene codigo SQL
- `[CONTAINS SQL]`: Contiene instrucciones `INSERT`, `UPDATE`, `SELECT` o `DELETE`.
- `[READS SQL]`: Solo utiliza la instruccion `SELECT`.
- `[MODIFIED SQL DATA]`: ???

### Reglas de Funciones en Postgress

- Si hay un solo parametro `OUT` o `INOUT` genera un returns con eso.
- Si hay mas de un `OUT` o `INOUT`, genera un `RETURNS RECORD`
- ???



