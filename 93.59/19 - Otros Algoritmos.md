## Definiciones

- **Árbol Recubridor**: Sea $G$ un grafo conexo, un árbol recubridor $T$ de $G$ ($T\subset G$) es un subgrafo de $G$, que es un árbol, y $V_G = V_T$
- **Arista Frontera**: Dado $T_1 \subset G/ V_{T_1} \neq V_G$, una arista frontera es $\{a,b\}$ con $a\in V_{T_1}$ y $b \in V_{G-T_1}$.

## Observaciones

- **DFS**: Si $\exist e=\{u,v\} \in E_G$ y $e \notin E_T$ y $dfnum(u) < dfnum(v) \Rightarrow u$ es el ancestro de $v$ en el árbol.
- $dfnum(v)$ es la etiqueta `v.DFTag` que se le asigna en el algoritmo.
- **BFS**: Las aristas de $G$ que no están en $T$ unen vértices que están en el mismo nivel en $T$ o en niveles consecutivos

## Proposiciones

- Sea $T$ el árbol que se obtiene de aplicar DFS al grafo $G$, la raíz ($r$) del árbol es vértice de corte de $G$ $\Leftrightarrow r$ tiene mas de un hijo en $T$.  

  [Demostración](Demostraciones\19 - Otros Algoritmos\Proposicion - 01.html) ==PEDIR QUE NO VEO NADA==
  
- Sea $T$ el árbol que se obtiene luego de aplicar el algoritmo de Kruskal:
  $$
  T \text{ es un árbol recubridor mínimo }
  $$

## Algoritmos

### Árbol Recubridor

```javascript
arbolRecubridor = function(G){
    T.root = G.node;
    i=1
    T.root.visited = true;
    
    while(T.nodes != G.nodes){
        initNode = T.selectNode();
        endNode = G.selectNodeWhere(node => !T.containsNode(node) && node.isConnectedTo(initNode));
        i++;
        initNode.visited = true;
    }
    
    
}
```



### DFS (Búsqueda en profundidad)

```javascript
// G es un grafo y node es un vertice de G
DFS = function(G,node){
    T = node;
    F = [];
    i = 0;
    node.DFtag = 0;
    
    while(!T.nodes.contains(G.nodes)){
        
        foreach(u in T.nodes)
        	foreach (v in G.nodes)
                if(!T.nodes.contains(v))
                    F.add(new Edge(u,v));
        
        edge = F.max(e => (e.initNode.DFTag));
        tempNode = edge.endNode;
        tempNode.DFTag = i;
        i++;
        T.addNode(tempNode);
        T.addEdge(edge);
    }
    
    return T;
}
```

### BFS

```javascript
// G es un grafo y node es un vertice de G
DFS = function(G,node){
    T = node;
    F = [];
    i = 0;
    node.Tag = 0;
    
    while(!T.nodes.contains(G.nodes)){
        
        foreach(u in T.nodes)
        	foreach (v in G.nodes)
                if(!T.nodes.contains(v))
                    F.add(new Edge(u,v));
        
        edge = F.min(e => (e.initNode.Tag));
        tempNode = edge.endNode;
        tempNode.Tag = i;
        i++;
        T.addNode(tempNode);
        T.addEdge(edge);
    }
    
    return T;
}
```

### Encontrar Vertices de Corte

```javascript
verticesDeCorte = function(G){
    K = [];
    
    T = DFS(G, G.nodes.pickRandom());
    
    if(T.root.sons.count() > 1)
        K.add(T.root);
    
    for( i = 0 ; i < G.nodes.count() ; i++){
        menor(G.nodes[i]);
    }
    
    for( i = 0 ; i < G.nodes.count() ; i++){
        if(G.nodes[i] != T.root && G.nodes.exist(w => menor(w) >= G.nodes[i].DFtag))
            K.add(G.nodes[i]);
    }
}
```

### Árbol Recubridor PRIM

```javascript
// G es un grafo conexo ponderado
PRIM = function(G){
    T = new Tree();
    T.root = G.nodes.chooseRandom();
    F = [];
    
    while(! T.nodes.contains(G.nodes)){
        for(v in T.nodes)
            for( w in G.nodes)
                if(!T.nodes.contains(w))
                    F.add(new Edge(v,w));
        edge = F.min(e => e.weight);
        T.addNode(edge.endNode);
        T.addEdge(edge);
    }
    
    return T;
}
```

### Árbol Recubridor de Kruskal

```javascript
// G es un grafo conexo
Kruskal = function(G){
    i = 1;
    T = new Tree();
    T.addEdge(T.nodes.min(v => v.weight));
    
    while(T.isArbolRecubridor(G)){
        edge =G.edges.filter(v => !T.edges.contains(v)).min(v => v.weight);
        if(Tree.isValid(T,edge))
            Tree.addEdge(edge);
    }
}
```



















