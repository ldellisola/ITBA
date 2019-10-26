# Interrupciones

Las interrupciones son una se;al externa que interrumpe al micro para requerir un servicio de atención. Hay dos tipos de interrupciones:

- **Interrupción de Hardware**: Son las interrupciones generadas por dispositivos conectados al microprocesador o periféricos. Estos dispositivos están conectados al Controlador Programable de Interrupciones (PIC). Este controlador puede manejar hasta 8 dispositivos distintos, y se encarga de manejar el flujo de informacion por los pines `INTA` e `INTR`. Cuando el microprocesador acepta la interrupción, este le pide informacion sobre que dispositivo esta haciendo la interrupción al PIC y luego el microprocesador busca lo que debe hacer en la sección de memoria llamada `IDT` (interrupción descriptor table) y ejecuta la rutina en otro sector de la memoria.

  Adicionalmente, los procesadores tienen un flag `IF` que indica si se deben atender a las interrupciones externas. Básicamente permite bloquear a las interrupciones. Este flag se maneja con las instrucciones `cli` (clear interrupt) y `sti` (set interrupt).

  Dentro de las interrupciones de hardware, hay dos tipos de interrupciones:

  - **Interrupción Enmascarable**: Al deshabilitar el flag `IF` este tipo de interrupciones no llegan al procesador.
  - **Interrupción no Enmascarable**: Estas interrupciones llegan por el pin `NMI` y no puede ser ignoradas. Un claro ejemplo de estas interrupciones suceden al apagar la computadora desde el botón o para mantener la temperatura.

- **Interrupción por Software**: son las interrupciones generadas por código. Un buen ejemplo de esto son las interrupciones ejecutadas con la instrucción `int 80h`. Esto básicamente genera una instrucción, hace que el procesador vaya al `IDT` a buscar la posición `80h` y de ahí salta a la subrutina que se debe ejecutar al encontrarse con esa interrupción. Este tipo de rutinas son tambien llamadas rutinas globales.