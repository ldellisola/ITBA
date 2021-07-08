# Routing Protocols

## Flood Routing

With this protocol, the router sends the packet to each output link, delivering it in the shortest possible time. This result in an exponential number of duplicates of the same packet being sent around. A possible improvement is to have the router remember the packet and process it only once, but this is still a very inefficient way to utilize the network.

## Random Routing

All received packages are sent to a randomly selected link. Here the delivery time is not known, but there is a good probability that the packet will be delivered.

This routing can be used as an improvement to other algorithms, for example when the output link is blocked or down.

## Static Routing

The routing table is given by the configuration and it does not change when the state of the network is changed. It is unable to respond to network failures.

## Dynamic Routing

The routing table is changed according to the state of the network. It has 3 main update methods:

- **Isolated**: The router performs changes separately, regardless of other routers.
- **Centralized**: The calculation of new tables is performed by a central router, routing tables are distributed to other routers.
- **Decentralized**: Each router performs the calculation using data from other routers.

### Decentralized Routing Methods

There are several methods to route packages in a decentralized way:

- **Distance Vector Algorithm (DVA)**: 

  The routers periodically broadcast the contents of their routing tables to neighbors and they update their own tables if a shorter path is found. The metric used for this table is the number of nodes in the way.

  This poses a problem when the diameter of the network is limited, as everything greater than the network is interpreted as *"infinite"*.

- **Link State Algorithm (LSA)**: The routers inform each other about the state of links and each router has information about the complete network topology. The router then uses Dijkstra's algorithm to calculate the map of shortest paths.

- **Path Vector Routing**: The routers update each other about the paths and looped updates are detected and discarded. The entries in the routing table contains the destination network, the next router and the path to reach the destination.

## Routing Information Protocol (RIP)

There are three versions of this protocol, the latest being the first one to support IPv6. This protocol uses the Distance Vector Algorithm to search for the shortest path and each router periodically (30s) sends his table to his neighbors.

This protocol still has some problems, such as not working properly with the limited size of the network, creating a network load when forwarding the tables and a slow convergence after link failure.

## Open Shortest Path First (OSPF)

This protocol uses the Link State algorithm. The routers send the state of the links every 30 minutes and the metric in this case is the speed of the link, instead of the number of nodes.

Each router knows the network topology and they calculate independently  the table of the shortest distance to all nodes. This method has a very quick convergence (seconds) and there is no strict limit for the diameter of the network.

This protocol also has lower overhead than the others, which involves less traffic and greater interval between data exchange.

## Enhanced Interior Gateway Routing Protocol (EIGRP)

This protocol is an advanced implementation of distance-vector routing algorithm. It was designed by Cisco and it became an open standard later. Unlike the previous protocols, EIGRP only sends incremental updates, reducing the workload on the router and the amount of data transmitted.

The routing tables synchronize between the neighbors at startup, and then send specific updates only when the topology changes occur to the multicast address `224.0.0.10`. A Hello message is sent to all neighbors every 5 seconds in a LAN, and every 60 seconds in a WAN environment

## Routing in the Internet

The internet can be described as a collection of connected autonomous systems (AS). Each AS themselves are a collection of connected IP networks under the control of one network operator or company (ISP). Each AS is identified by an Autonomous System Number (ASN).

Inside each of these AS, the Internal Gateway Protocol (IGP) is used, where some of the previous protocols (RIP, OSPF, EIGRP) is used. For connection between autonomous systems we use the Exterior Gateway Protocol (EGP), that uses the Border Gateway Protocol (BGP) and it is based on the path-vector routing protocol.

