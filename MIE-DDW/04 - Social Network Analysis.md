# Social Network Analysis

Social network analysis (SNA) is not dedicated to study Facebook or twitter, but how human relationships work and connect with each other. Among its applications we can find analyzing and improving business communications in an organization, as well as to detect criminal networks and key players.

## Types of Social Network Analysis

### Sociocentric

This approach tries to analyze the whole network and it emerged from sociology. It involves quantification of interaction among a socially well defined group of people and it focus on identifying global structural patterns.

### Egocentric

It does a personal network analysis, and it quantifies the interactions between an individual and all other persons related to him.

### Knowledge Based Network

It was developed within computer science and it involves the quantification of interactions between individuals, groups and other entities.

## The Small-World Phenomenon

The idea behind this phenomenon is that the world is small and we can connect with any person in the world with up to 6 persons of distance.

## Measures of Centrality

There are a variety of different measures to calculate the importance, popularity, or social capita of a node in a social network

### Degree Centrality

It measures the number of connections that lead into or out of the node. It determines the nodes that can quickly spread information to a localized area.

<img src="Resources/04 - Social Network Analysis/image-20210511232659427.png" alt="image-20210511232659427" style="zoom:33%;" />

### Closeness Centrality

It is calculated using the mean length of all shortest paths from a node to all other nodes. It is a measure of reach, distance to each other. 

<img src="Resources/04 - Social Network Analysis/image-20210511232902051.png" alt="image-20210511232902051" style="zoom:33%;" />

Another way to define this is as the inverse of fairness:
$$
Cc_x =\frac{1}{\sum_y \text{distance}(y,x)}
$$

### Betweenness Centrality

It is obtained form the number of shortest paths that pass through a node divided by all shortest paths. The main use of this measurement is to identify communication bottlenecks or community bridges.

<img src="Resources/04 - Social Network Analysis/image-20210511233214824.png" alt="image-20210511233214824" style="zoom:33%;" />

### Eigenvector Centrality

The nodes with higher eigenvector centrality is connected to other nodes with high eigenvector centrality. 

<img src="Resources/04 - Social Network Analysis/image-20210511233825585.png" alt="image-20210511233825585" style="zoom:33%;" />

This algorithm is as follows:

1. Start by assigning a centrality score of 1 to all nodes.
2. Recompute the scores of each node as a weighted sum of centralities of all nodes in a node's neighborhood.
3. Normalize the values of all nodes
4. Repeat step 2 and 3 until the values stop changing.

## Strong and Weak Ties

In a network, each edge can influence it in a different way. It can affect how the information flows through a social network, how different nodes can play structurally distinct roles. The weight of the edge can also play a key role, limiting the interaction or denoting the strength of the relationship.

### Clustering Coefficients

It is defined as the probability that two nodes randomly selected nodes are connected with each other. Given each vertex $v_j$ with $k_j$ neighbors, $\frac{k_j(k_j-1)}{2}$ nodes can exists.

### Bridges

A bridge is an edge between two nodes, that if deleted, it will split the graph into two different components. We say that an edge is a local bridge if removing it would increase the distance by more than 2 between the nodes.

We can use **neighborhood overlap** to identify bridges. It is calculated as:
$$
\text{NO} = \frac{\text{Number of neighbors of A and B}}{\text{Number of neighbors of A or B}} 
$$

### Embeddedness

The embeddedness of an edge is the number of common neighbors that two endpoints have. Local bridges have an embeddedness of 0. Usually, we can say that nodes with higher embeddedness are easier to trust and generate more confidence. 

## Network Level Characteristics

### Density

Density is the ratio of the number of edges over the total number of possible edges.

### Reciprocity

This characteristic only works on oriented graphs, and it measures the ratio of relations that are reciprocated over the total number of relations.

## Community Detection

There are algorithms to identify network pats that are denser or mote coherent than other regions. The approaches are split in two main groups:

- **Computer Science Approaches**: It uses graph partitioning and algorithms such as Geometric methods and spectral partitioning to identify communities. 
- **Social Science Approaches**: It uses clustering, based on block modeling and community structure, to define communities. It uses mostly betweenness based methods to estimate it.

A **community** $C$ is a subset of nodes such that there are more edges inside the community than edges linking the nodes of $C$ to the rest of the graph. We have to types of densities:

- **Intra-community density**:
  $$
  d_{\text{intra}} = \frac{\text{# of intra edges of $C$}}{|C| \times (|C|-1)/2}
  $$

- **Inter-community density**:
  $$
  d_{\text{inter}} = \frac{\text{# of inter edges of $C$}}{|C| \times (|V| - |C|)}
  $$

A **Clique** is a subgraph where vert node is connected with each other and it usually represents a group of people that are tightly tied to each other. If a clique is not a subset of any other clique in the graph, then  we call it **maximal clique**.

### Graph Partitioning

There are several ways to partition a graph:

- **Min-Cut**: This algorithm simply involves minimizing the number of edges cut by the partition. The number of edges between clusters is called **cut size**. For this method we must say how many clusters we want to obtain.

  <img src="Resources/04 - Social Network Analysis/image-20210512111632309.png" alt="image-20210512111632309" style="zoom:33%;" />

- **Kernighan-Lin Algorithm**: This is a heuristic procedure for the problem of partitioning networks. The approach is as follows:

  1. Generate an initial solution, this may be randomly generated.

  2. Update iteratively the current solution until we have an optimal solution:

     1. Select a subset of nodes from different clusters, compute improvement and swap them:

        1. For each node $n$

           $C_n$ = # edges between communities

           $Un$ = # edges within the community

           $Dn = Cn - Un$

        2. For each pair of nodes $n,m$ compute the improvement:
           $$
           Im = Dn + Dm - 2 \times(\exists \text{ edge between }n,m ? 1:0)
           $$

        3. Swap nodes with the highest improvement

- **Hierarchical Clustering**: We construct a tree of clusters to identify groups of nodes with high similarity according to some similarity measure.

  <img src="Resources/04 - Social Network Analysis/image-20210512112349235.png" alt="image-20210512112349235" style="zoom:33%;" />

  This still has some problems, mostly when there are more than one bridge. The solution here is to use the shortest path.

- **Girvan-Newman Method**: ???

- **Island Method** : ???

### Overlapping Communities

It is not realistic to assign nodes to only a single community, as communities can overlap, making it impossible to partition the networks without splitting communities. 

We can solve this issue with the **clique Percolation Method (CPM)**. The main idea is that the internal edges of a community are likely to form cliques do to their high density​. The algorithm is as follows:

1. Find all cliques of size k.
2. Construct a clique graph where each node represents a clique.
3. The community is detected as a component of the clique graph.

<img src="Resources/04 - Social Network Analysis/image-20210512141016748.png" alt="image-20210512141016748" style="zoom:33%;" />

### Modularity

This is the most popular quality function designed to measure the strength of division of a network into modules.
$$
Q = \frac1{2m} \sum_c \sum_{i,j \in c} \left(A_{ij} - \frac{d_id_j}{2m}\right)
$$
Where $i,j$ denotes nodes, $c$ are clusters, $A_{ij}$ is an entry of the adjacency matrix, $d_i$ is the degree of the node $i$ and $m$ is the total number of links.

Community detection algorithms can be designed to optimize the modularity, usually based on heuristics.

### Dynamic Community Finding

In many SNA tasks we will want to analyze how communities in the network form and evolve over time. Often performing this analysis is an offline task by examining successive snapshots of the network, and we can characterize dynamic communities in terms of key life-cycle events.

## Link Prediction

Social networks are highly dynamic and the change quickly over time. Because of this, **link prediction** is an useful tool. It basically predicts the likelihood of a future association between tow nodes, knowing that there are no associations between the nodes in the current state of the graph.

This technique is popular when suggesting friends on social networks or on recommendation systems. 

### Graph Distance

This method is one of the simplest and it involves calculating the negative of the shortest path between two nodes. This measure follows the notion that social networks are small words.
$$
\text{score}(x,y) = - \text{shortestPathLength}(x,y)
$$

### Common Neighbors

Two strangers who have a common friend may be introduced by that friend. This method counts the amount of neighbors a pair of nodes have in common.
$$
\text{score}(x,y) = |N(x) \cap N(y)|
$$

### Katz Measure

It is a measure that directly sums over a collection of paths exponentially damped by length to count short paths more heavily. The more paths that are in between two nodes, the shorter these paths are, the stronger the connection.
$$
\text{score}(x,y) = \sum_{l=1}^\infty \beta^l |\text{Path}(x,y)^{(l)}|
$$
Where $\beta$ is a predictor parameters and $\text{Path}(x,y)^{(l)}$ is the set of all length-$l$ paths from $x$ to $y$

###  Other Node-wise Similarities

There are a lot of ways to calculate this, for example:

- **Jaccard Similarity**:
  $$
  \text{score}(x,y) = \frac{|N(x) \cap N(y)|}{|N(x) \cup N(y)|}
  $$

- **Preferential Attachment**:
  $$
  \text{score}(x,y) = |N(x)| \times |N(y)|
  $$

- **Academic**:
  $$
  \text{score}(x,y) = \sum_{x\in N(x) \cap N(y)} \frac1{\log|N(z)|}
  $$

## Multimode Networks

Multimode networks are composed by more than one type of nodes. This type of networks are very common in attribute networks, for example a friend suggestion system.

