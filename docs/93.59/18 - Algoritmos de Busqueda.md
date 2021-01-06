# Algoritmos De Arboles

## Definiciones

- **Arbol Balanceado**: un arbol esta balanceado si para cad vertice se cumpe que la cantidad de vertices de susubarbol derecho difiere a lo sumo en uno con la cantidad de vertices en el subarbol izquierdo.

### Busqueda Binaria Iterativo

```javascript
binarySearch = function(BinaryTree, value){
    var node = BinaryTree.root;
    
    while(node != null && value != node.value){
        if(value > node.value){
            node = node.getRightChild();
        }
        else{
            node = node.getLeftChild();
        }
    }
    return node;
}
```

### Busqueda Binaria Recursivo

```javascript
binarySearch = function(node, value){
    if(node.value == value)
        return node;
    
    if(node.value < value)
        return binarySearch(node.getLeftChild(),value);
    else
        return binarySearch(node.getRightChild(),value);
}
```

### Otras Implementaciones de Busqueda

#### Arreglo Estatico

- **Busqueda**: $O(log_2n)$
- **Insertar o Eliminar**: $O(n)$

#### Arreglo Dinamico

- **Buscar**: $O(n)$
- **Insertar o Eliminar**: $O(1)$

#### BST

- **Buscar**: $O(log_2n)$

- **Insertar **: $O(1)$

- **Eliminar**: $O()$

  ```javascript
  remove = function(BinaryTree,value){
      var node = search(BinaryTree,value);
      
      if(node.getLeftChild() == null && node.getRightChild() == null){
          var parent = node.parent;
          if(parent.value < value)
              parent.setLeftChild(null);
          else
              parent.setRightChild(null);
  	}
      
      if((node.getLeftChild() != null && node.getRightChild() == null ){
         
         }
        if(node.getLeftChild() == null && node.getRightChild() != null) {
          var parent = node.parent;
          
          pa
         
         }
  }
  ```

  