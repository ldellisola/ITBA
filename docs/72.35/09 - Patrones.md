# Patrones de Dise;o

## Clasificacion

Los patrones se pueden clasificar de acuerdo a los siguientes criterios.

- **Proposito**: Que es lo que hace
  - <u>Creación</u>: Se refiere a la creacion de objetos.
  - <u>Estructural</u>: Se refiere a la composicion de las clases y los objetos
  - <u>Comportamiento</u>: Se refiere a la forma en que las clases u objetos interactuan
- **Alcances**:
  - <u>Clase</u>: Tratan las relaciones entre clases y subclases.
  - <u>Objeto</u>: Tratan las relaciones entre objetos, las cuales son mas dinamicas y pueden cambiar en tiempo de ejecucion.

## Descripcion de un Patron

- **Intencion**: Que se pretende conseguir.
- **Aliases**: Otros nombres conocidos del patron.
- **Motivo**: Explicacion de la necesidad de que el patron exista como entidad
- **Aplicabilidad**: Lista de usos para los que resulta adecuado implementar el patron.
- **Estructura**: Descripcion grafica del comportamiento, acciones y relaciones de los objetos que participan en el patron.
- **Participantes**: Diccionario de las partes que componen al patron.
- **Colaboraciones**: Diccionario de las relaciones e interacciones de los participantes.
- **Consecuencias**: Detalle de los posibles beneficios y perjuicios que pueden derivarse por su uso.

## Patrones

### Singleton

Singleton es un patron que sirve para asegurar que en toda la ejecucion de un programa solo exista una instancia de la clase. Esto se logra utilizando metodos estaticos en la clase para obtener la instancia desde cualquier lado del programa, y haciendo al constructor privado para que no se pueda crear otra instancia.

### Factories

Factories es un patron que sirve para crear objetos. Dentro de este patron hay dos implementaciones:

|                                    | `Abstract Factory`                 | `Factory Method` |
| ---------------------------------- | ---------------------------------- | ---------------- |
| Provee una interfaz                | Si                                 | Si               |
| Forma de Creacion                  | Composicion                        | Herencia         |
| Crean                              | Familias de objetos independientes | Un objeto        |
| La subclase decide que instancias? | no                                 | si               |

#### Abstract Factory

Abstract factory consiste en crear una interfaz con los metodos que me permitan generar a los objetos que necesito, y luego crear factories que hereden de esa interfaz. De la misma forma, si otra clase tiene que llamar a esta fabrica, lo va a hacer mediante la interfaz y no mediante el objeto.

```c#
public interface IFactory{
    IObject CreateObject();
}

public interface IObject{
    void Foo();
}

public class ObjectFactory: IFactory {
    IObect CreateObject() => return new Object();
}

IFactory factory = new ObjectFactory();

IObject obj = factory.CreateObject();

obj.Foo();
```



#### Factory Method

Factory Method no imlementa interfaces (en la misma forma que abstract factory), sino que es una clase abstracta, donde debemos definir las funciones que crean objetos. De cualquier forma, el objeto que crea es una interfaz, para evitar que el cliente dependa mucho de nuestra implementacion.

```C#
public abstract class AbstractFactory {
    public abstract IObject CreateObject();
    public void DoSomething(IObject obj);
}

public interface IObject{
    void Foo();
}

public class Factory : AbstractFactory{
    public IObject CreateObject();
}

AbstractFactory factory = new Factory();

IObject obj = factory.CreateObject();

factory.DoSomething(obj);
```

### Builder

Este patron encapsula la creacion de un producto y permite que este sea creado en pasos.



```C#
public abstract class AbstractBuilder {
    public abstract AbstractBuilder AddParamA();
    public abstract AbstractBuilder AddParamB();
    public abstract AbstractBuilder AddParamC();
    public abstract IObject Build();
}

public class Builder: AbstractBuilder {
    public AbstractBuilder AddParamA() {...}
    public AbstractBuilder AddParamB() {...}
    public AbstractBuilder AddParamC() {...}
    public abstract IObject Build() {...}
}

AbstractBuilder builder = new Builder();

IObject obj = builder.AddParamA(...)
       				 .AddParamB(...)
       				 .AddParamC(...)
       				 .Build();
```

### Prototype

Se utiliza cuando la instanciacion de una clase es muy cara, por lo que conviene clonar a un objeto ya existente y reemplazar los valores.

```C#

public abstract class Prototype {
    public abstract IObject Clone();
}

public interface IObject : Prototype{
    public abstract IObject Clone();
    ...
}
```

### Command

Sirve para realizar solicitudes y enviar comandos entre objetos, encapsulando solicitudes como objetos.

```C#
public interface ICommand {
    void Execute();
}

public class LightOnCommand : ICommand {
    Light Light;
    public void Execute() => Light.On();
}

public class LightOffCommand : ICommand {
    Light Light;
    public void Execute() => Light.Off();
}

public class Light {
    public void On {...}
    public void Off {...}
}

public class RemoteControl {
    ICommand OnCommand;
    ICommand OffCommand;
    
    public void OnButtonPressed();
    public void OffButtonPressed();
}
```

### Strategy

Sirve pare definir una familia de algoritmos y los hace intercambiables, independiende del cliente que los usa. Una buena aplicacion de esto seria en aplicaciones multiplataforma, donde deben utilizar codigo nativo en algunas partes del codigo.

Para implementarlo hay que definir una clase abstracta y establecer cuales son las relaciones (*extends*, *implements*, *has a*). Por ultimo debemos establacer setters para las clases que componen a esta clase abstracta.

```C#
public abstract class Character {
    Weapon weapon;
    public void SetWeapon(Weapon w) => weapon = w;
}

public class Knight : Character { ... }

public class Elf : Character { ... }

public abstract class Weapon { ... }

public class Sword : Weapon { ... }

```

### Observer

Este patron tiene como objetivo tener varias clases esperando eventos, y cuando se registra un evento, se las notifica.

```C#
public interface IObserver {
    void Notify();
}

public class ObserverA : IObserver {
    public void Notify { ... }
}

public class ObserverB : IObserver {
    public void Notify { ... }
}

public interface IController {
    void AddObserver(IObserver obs);
    void RemoveObserver(IObserver obs);
    void NotifyObservers();
}

public class Controller : IController {
    List<IObserver> Observers;
    
    void AddObserver(IObserver obs) => Observers.Add(obs);
    void RemoveObserver(IObserver obs) => Observers.Remove(obs);
    void NotifyObservers() => Observers.foreach( t => t.Notify() );
}
```

### State

Ayuda a los objetos a controlar su comportamiento cambiando su estado interno.

### Iterator

Se intenta de tratar a una coleccion de objetos de forma estandar, sin inportarnos la estructura de la coleccion.

### Chain of Responsability

Cada objeto, en su turno, examina una solicitud. La idea es que cada objeto puede decidir a que handler le pasa el request.

### Mediator

Paso intermedio??

### Adapter

Son clases intermedias que permiten utilizar clases de otros sistemas. Basicamente convierten clases en otras.

### Facade

Establecemos una capa superior a nuestro sistema para abstraer a los clientes y que no tengan acceso directo. Un buen caso de esto seria la implementacion de repositorios en nuestro tp.

### Composite

Permite representar objetos con una estructura de arbol.

### Decorator

???

### Proxy

Provee un sustituto sobre otro objeto para controlar el acceso al mismo.



