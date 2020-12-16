## 13

En una fábrica se tienen tres tipos de procesos que modelan una planta embotelladora de bebidas, y que trabajan en paralelo:

- Varios procesos de tipo «Embotellador» se encargan de preparar botellas de un litro.
- Un único proceso «Empaquetador» se encarga de empaquetar y reponer las cajas donde se van colocando las botellas y colocarlas en un palet.
- Un único proceso «Almacenador» se encarga de recoger el palet, buscarle un hueco en el almacén y reponer las cajas de forma que los procesos empaquetadores puedan colocar nuevas cajas.

Cada vez que un embotellador prepara una botella, ésta se coloca en una caja, que tiene una capacidad de 12 botellas. Si al colocar la botella la caja queda llena, se envía una señal al empaquetador, que toma la caja, la sella y la coloca en un pale. El empaquetador deposita una nueva caja de 12 botellas, totalmente vacía. Cada pale tiene una capacidad para 24 cajas. Si al colocar la caja en el pale, éste queda completo, se envía una señal al almacenador, que toma el palet y lo ubica en el almacén. El almacenador deposita un nuevo palet, totalmente vacío. Mientras el empaquetador está haciendo su labor, los embotelladores no pueden colocar sus botellas, ya que en esos momentos no hay una caja disponible. Mientras el almacenador está haciendo su labor, el empaquetador no puede colocar cajas, ya que en esos momentos no hay un palet disponible. Se asume que siempre existirá hueco en el almacén. En el momento inicial existe una caja vacía y un pale totalmente vacío. Una vez que arrancan, los procesos ejecutan su actividad una y otra vez en un bucle infinito.

https://docs.google.com/presentation/d/1novWtqhAHtNV-F1JJilziFq8wS6p_bkM8ogG4hRcnLg/edit?usp=sharing

TAREA. Tiene usted que describir los algoritmos del embotellador, el empaquetador y el almacenador implementando con semáforos las sincronizaciones que sean necesarias. Si quiere obtener puntos extras se proponen estas tareas adicionales:

• Extra 1 (+1 punto). Modifique el sistema de tal forma que, cuando se consigan llenar 20 pales, todos los procesos finalicen.

• Extra 2 (+1 punto). Modifique el sistema de tal forma que los procesos embotelladores puedan colocar botellas mientras el almacenista está realizando su tarea.



### Entrega Base

#### Variables Globales

```C
// Semaforos
	// Semaforo para garantizar el acceso atomico a la caja por parte de los 
	// embotelladores
int semCaja_embotelladores = 1;
	// Semaforo para garantizar el acceso atomico a la caja por parte del empaquetador
	// y los embotelladores
int semCaja_Empaquetador = 0;
	// Semaforo para garantizar el accesso atomico al pallet por parte del empaquetador
	//  y el almacenista
int semPallet = 0;
```

#### Embotellador

```C
void embotellador(){
    
    while(true){
        // Aseguro acceso unico entre los embotelladores
        while(semCaja_embotelladores != 0){ }
        semCaja_embotelladores++;

        // Aseguro acceso unico entre embotellador y empaquetador
        while(semCaja_Empaquetador == 12){ }
        semCaja_Empaquetador++;

        // Permito que otro embotellador trabaje
        semCaja_embotelladores--;
    }
}
```

#### Empaquetador

```C
void empaquetador(){    
    while(true){
        // Empaquetador solo actua cuando la caja esta llena
        while(semCaja_Empaquetador != 12){ }

        // Cargo la caja al pallet, si es que no esta completo. Si lo esta espero a que
        // se cambie la caja
        while(semPallet == 24){}
        semPallet++;

        // Pongo caja nueva
        semCaja_Empaquetador = 0
    }
}
```

#### Almacenador

~~~C
void almacenista(){
    while(true){
        // Espero a que se llene el pallet
        while(semPallet != 24){}

        // Pongo un pallet nuevo
        semPallet = 0;
    }
}
~~~





### Entrega Extra

#### Variables Globales

```C
	// Semaforo para garantizar el acceso atomico a la caja por parte de los 
	// embotelladores
int semCaja_embotelladores = 1;
	// Semaforo para garantizar el acceso atomico a la caja por parte del empaquetador
	// y los embotelladores
int semCaja_Empaquetador = 0;
	// Semaforo para garantizar el accesso atomico al pallet por parte del empaquetador
	//  y el almacenista
int semPallet = 0;
	// Controla que se cierre el programa cuando se llega a 20 pallets
int pallets = 20;
```

#### Embotellador

```C
void embotellador(){
    while(pallets  != 0){
        // Aseguro acceso unico entre los embotelladores
        while(semCaja_embotelladores != 0){ }
        semCaja_embotelladores++;

        // Permito que otro embotellador trabaje
        semCaja_embotelladores--;

        // Aseguro acceso unico entre embotellador y empaquetador
        while(semCaja_Empaquetador == 12){ }
        semCaja_Empaquetador++;
    }
}
```

#### Empaquetador

```C
void empaquetador(){    
    while(pallets != 0){
        
        // Empaquetador solo actua cuando la caja esta llena
        while(semCaja_Empaquetador != 12){ }
        
        // Pongo caja nueva
        semCaja_Empaquetador = 0

        // Cargo la caja al pallet, si es que no esta completo. Si lo esta espero a que
        // se cambie la caja
        while(semPallet == 24){}
        semPallet++;
    }
}
```

#### Almacenador

~~~C
void almacenista(){
    while(pallets != 0){
        // Espero a que se llene el pallet
        while(semPallet != 24){}

        // Pongo un pallet nuevo
        semPallet = 0;
        pallets--;
    }
}
~~~





