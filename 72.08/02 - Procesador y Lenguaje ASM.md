# Procesadores y Lenguaje ASM

## Arquitectura de 80386

Todos los procesadores del mundo derivan su arquitectura del chipset 80386. Este chipset cumple con:

- Multitarea: Permite que cada programa tenga una memoria virtual individual, además de una memoria en común para otras tareas.
- Multiusuario: Permite que mas de un usuario tenga acceso al CPU, por lo que permite ejecutar mas programas.
- Tiempo Compartido: El sistema operativo le asigna a cada programa un tiempo de acceso al CPU.
- Tiempo real: La conmutación de tareas viene dada por acontecimientos externos.
- Sistema de Protección: Permite mas de nivel, Usuario y Supervisor. También permite hacer swap, para simular memoria RAM o ROM dentro de discos duros.