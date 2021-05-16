# PageRank and HITS

## Web Graph

A **web graph** is a directed graph that represents the web. Each node represents a web page and edges are hyperlinks. In-links are links pointing to the node, while out-links are links generated from the node.

This graph has a bow tie structure, and this information is very important when designing crawlers or search engines.

<img src="Resources/05 - PageRank and HITS/tttbowtie.JPG" alt="The Durability of the “Bow-Tie Structure of the Web" : Networks Course blog  for INFO 2040/CS 2850/Econ 2040/SOC 2090" style="zoom: 67%;" />

The web is not a fully interconnected network, in fact is has several different types of components:

- **SCC**: It is a giant strongly connected component. It can be thought as the central core, all of whose can reach one another along directed links.
- **IN**: Pages that reach the SCC but cannot be reached from it.
- **OUT**: Pages that are accessible from the SCC, but do not link back to it.
- **Tendrils**: Pages that are reachable from IN but cannot reach the SCC or pages that can be reached from OUT but cannot be reached from SCC.
- **Tubes**: These are tendrils that fulfill both conditions, meaning that the can be reachable from IN and they reach into OUT, whiteout passing through the SCC
- **Disconnected**: Pages that do not reach and are not reachable from IN, SCC or OUT. 

## Search Results

We can build web search algorithms on top of existing boolean vector models. The main problem of using these basic models alone is that the results are too large and all documents are treated equally according to the relevance point of view. We need other ways to rank them.

### PageRank

**PageRank** was introduced in 1008 by Google cofounders. This algorithm uses link structure as an indicator of an individual page's quality. The prestige of a page is proportional to the sum of the prestige scores of the pages linking to it and it is independent of any information need or query.

This algorithm is able to fight spam, global measure and is query independent, computed ahead of time and very efficient at query time. The main formula is:
$$
\pi^{(k+1)T} = \pi^{(k)T}(\alpha S + (1-\alpha)E)
$$
Each page has it own rank, and it is calculated as:
$$
r(P_i) = \sum_{P_j \in B_{P_i}  }\frac{r(P_j)}{|P_j|}
$$
Where $B_{P_i}$ is the set of pages linking to $P_i$ and $|P_i|$ is the number of out-links from $P_j$. 

We can also calculate the matrix representation of the algorithm as:
$$
\pi^{k+1} = \pi^k H
$$
Where $\pi^k = (r_k(P_1),\dots,r_k(P_n))$  and $H$ is an $n\times n$ matrix where:
$$
H_{ij} = \left\{\array{\frac1{|P_i|}&& \exists \text{ link from $P_i$ to $P_j$}\\
0&& \text{else}}\right.
$$
This equation is the characteristic equation used for finding the eigensystem of the matrix, $\pi$ is the eigen vector with the corresponding eigenvalue of $1$. 

The problem with this approach is that the web graph does not meet all conditions, meaning that there are many pages without out-links, as well as directed paths leading into a cycle.

Every iteration of this algorithm has a time complexity of $O(n^2)$ but the matrix is sparse, meaning that other representations can be used and reduce the complexity to $O(\text{nze})$ where $\text{nze}$ means *"non-zero elements"*.

### Alternative PageRank Definition

We can also calculate PageRank using random walks, meaning that the probability of being at page $X$ after $k$ steps of this random walk is precisely the PageRank of $X$ after $k$ applications of the basic PageRank update rule.

This method still has a problem with rank sinks and cycles, although they can be minimized by moving to a random node.

### Google Matrix

The **Google Matrix** is the solution for irreducible and aperiodic situations. In this matrix we add a link from each page to every page and give each link a small transition probability controlled by a parameter $d$ called the **damping factor**.

Now the updated model has two options, with probability $d$ it can choose an out-link to follow, or with probability $1-d$ it can jump to a random page without a link. Now the matrix becomes strongly connected and the random surfer does not have to transverse a fixed cycle.

The google matrix looks like this:
$$
G = d \times S + (1-d) \times \frac E n
$$
Where $E$ is an $n \times n$ matrix composed of all $1$s.

The iteration now is calculated as:
$$
\pi^{k+1} = \pi^k G
$$
And now the matrix is not sparse anymore, so we cannot optimize the multiplication and the time complexity is $O(n^2)$.

In the end, the iteration will end when the $1$-norm of the residual vector is less than a pre-specified threshold $\delta$

### PageRank Modifications

#### Intelligent Surfer

It modifies the probabilities in the transition matrix taking into account analysis of user behavior and similarity of pages among other variables.

#### Personalization

We can modify the teleportation system so that the matrix $E$ is instead bias with preferences for specific pages.

## HITS

**Hypertextual Induced Topic Search** is an algorithm that uses the web structure as an important aspect, and the query is used to select a subgraph from the web. For a search query, HITS will first expand the list of relevant pages returned by a search engine and then produces rankings of the expanded set of pages.

This method has two main characteristics:

- It is search query dependent
- It has two rankings, one based on authority ranking and other on hub ranking.

A **hub** is a page with many out-links, it is usually a source of many important links to authority pages relevant for the topic. An **authority** is a page with many in-links, meaning that people trust the page. The goal is to find the best hubs and authorities.

### The Algorithm

 First, the HITS algorithm has to collect pages. It sends a query to a search engine and collects top $t$ highest ranked pages that are relevant to the query, this set is called $W$. Later it will grow $W$ by including pages that link to any page in it or that are linked by any page from $W$, at most $k$ per page. Now the set is renamed as a base set $S$.

After collection the information, HITS works with a graph made out of all the pages in the base set $S$ with $L$ adjacency matrix.

After the Graph is created, we can calculate bot the authority score ($a$) and the hub score ($h$):
$$
a(i)^k = \sum_{(j,i) \in E} j(i)^{k-1} \\
h(i)^k = \sum_{(j,i) \in E} a(i)^{k-1}
$$
The HITS algorithm also ahs a matrix representation similar to PageRank:
$$
\array{a = L^Th && h = La}
$$
Both matrixes can be computed in an iterative way:
$$
\array{1. && a_0 = (1,\dots,1) & h_0 = (1,\dots,1) \\
2. && a_k = L^T\times L \times a_{k-1} & h_k = L\times L^T \times h_{k-1}
}
$$
The iteration will end after the $1$-norms of the residual vectors are less than some threshold and we return the top ranked pages as authorities and hubs. HITS will always converge and it can provide different hub and authority vectors.

HITS is also able to provide more relevant results because it ranks pages according to the query topic, but this comes at the cost of performance.

