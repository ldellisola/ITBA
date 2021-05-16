# Network Interconnection

Network interconnection refers to some ISO/OIS layer and how the network device implements stack up to this layer. It receives a block of data and then an action is determined according to the content of the header. The data packet travels through the network stack down and is then sent.

<img src="Resources/05 - Network Interconnection/image-20210506130127884.png" alt="image-20210506130127884" style="zoom:33%;" />

## Devices

### Repeater

It operates at the physical layer and has no memory or complex logic. It only amplifies the signal, increasing the distance between communicating nodes and improving the signal-to-noise ratio.

### Hub

The hub is a repeater with 3 or more ports. In the collision network (CSMA/CD), collisions are distributed. It usually has a star topology, with the hub in the center.

### Bridge

The bridge works on the data link layer (Layer 2). It separates collision segments and overcomes restrictions to the physical size of the network segment. Compared to the hub/repeater, the bridge has better reliability and performance. It is used to join two network segments, and it contains a buffer for data.

### Switch

A switch is a bridge with more than two ports. It also interconnects on the Link layer and it is the most used active network element. 

The switch remembers MAC addresses in a table of pairs with the port requested, as well as storing the MAC address of the sender. This entries expire after some time. When a packet arrives to the switch, if the frame contains a known destination, then it is send to the port specified in the table, else it will be sent as a broadcast to all ports. Switches also have an important role on the reduction of traffic on network links and provide increased security, as we cannot eavesdrop all packets in the network.

The switch can operate in two ways:

- **Store-and-Forward**: It waits until the frame has been completely received to internal memory and then it sends it to the receiver. This process is slower but it provides error checking.
- **Cut-Through**: It waits only for the first 6 bytes to get the MAC destination. This process is faster but there is not error checking.

#### Spanning Tree Protocol

The main problem with network interconnection is that a tree topology is required. Loops can be a problem, creating a **broadcast storm**, but this can be minimized with the Spanning Tree protocol (STP). When using STP, loops can serve as backup links.

The STP algorithm finds the span topology. To avoid loops it blocks some ports on the switch and reopens them if necessary. This is supported on all modern switches. To do this they send *"HELLO"* messages in two phases:

1. Root switch selection (lowest MAC)
2. Designated switch election (Best way to the root switch)

#### Switches at Higher Layers

Switches at higher layers still work with frames, but they also scan the headers on higher layers than L2. This allows them to support QoS, VLAN, and other features. At different layers, the frame is processed differently"

- **Link Layer**: No process.
- **Network Layer**: IP filtering.
- **Transport Layer**: Filtering by TCP and UDP ports and load balance.
- **Application Layer**: Load balancing across multiple servers.

### Router

The router works at the network layer and it connects network segments. It works with network addresses and it does not forward broadcast packets. They also provide some additional features such as NAT, VPN and firewall. Routing can be static or dynamic.