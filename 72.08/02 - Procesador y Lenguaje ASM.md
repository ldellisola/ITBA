# Procesadores y Lenguaje ASM

## Arquitectura de 80386

Todos los procesadores del mundo derivan su arquitectuira del chipset 80386. Este chipset cumple con:

- Multitarea: Permite que cada programa tenga una memoria virtual individual, ademas de una memoria en comun para otras tareas.
- Multiusuario: Permite que mas de un usuario tenga acceso al CPU, por lo que permite ejecutar mas programas.
- Tiempo Compartido: El sistema operativo le asigna a cada programa un tiempo de acceso al CPU.
- Tiempo real: La conmutacion de tareas viene dada por acontecimientos externos.
- Sistema de Proteccion: Permite mas de nivel, Usuario y Supervisor. Tambine permite hacer swap, para simular memoria RAM o ROM dentro de discos duros.