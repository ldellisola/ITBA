# Game Loop

El Game loop es el ciclo principal del programa. Esto es comun a todos los game engines y a todos los juegos. Dentro de este loop hay que ahcer dos cosas **actualizar** y **dibujar**. 

Los FPS indican cada cuanto se recorre este loop. No sirve gastar recursos para hacer que corran a una tasa de refresco mas alta que la que soporta la pantalla, por que el celular suele calentarse y gasta mas bateria.

```c++
int main (void){
	loadGame();
	// Game loop
	while(true){
		Update();
		Draw();
         Sleep();
	}
}
```

A medida que fueron evolucionando los juegos, la funcion `update()` empezo a recibir un parametro Delta T, que es el tiempo entre cada frame.

De la misma forma, se fue agregando la funcion `sleep()` luego de dibujar para poder devolverle el control al sistema operativo por unos momentos, ya que no era necesario que corra mas rapido de lo que deberia. Otra practica comun es sincronizar el inicio del gameloop cuando se refresca la pantalla, de esta forma no se malgastan recursos. 



RigidBody permite que el cuerpo interactue con el motor de fisica.

Prefabs => Crear cosas dianmicas