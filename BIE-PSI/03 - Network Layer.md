# Network Layer

The network layer manages data transfer between the source and destination addresses. It provides the following services to the upper layers:

-  **Independence of forwarding method**

- **Independence of network topology**

- **Provide a network numbering schema**

- **Connection-oriented Services**:

  It tries to simulate virtual circuits. The first stage is to register the circuit on all routers on the path, transfer the data to the circuit and them delete the data. Each packet has a header with virtual circuit specifier.

- **Connectionless services**:

  The block of data from the transport layer is divided into packets that are routed individually. The packet has a header where that contains the address and then the router implements an algorithm to deliver them.

We can compare connectionless and connection-oriented services in the following chart:

<img src="Resources/03 - Network Layer/image-20210318190917164.png" alt="image-20210318190917164" style="zoom:33%;" />

## Addressing

In a network, every address must be unique. There are also different types of addressing:

- **Unicast**:

  Its a direct connection from one machine to another, used in IPv4 and IPv6.

- **Broadcast**:

  It sends a message to all known hosts in a local network. For example if the broadcast address is defined as:
  $$
  \text{IP address: } 192.113.147.16/25\\
  \text{Mask: } 255.255.255.128
  $$
  The broadcast address will be defined as:
  $$
  \text{Broadcast: } 192.133.147.127
  $$
  And it will contact all machines on IP 192.113.147.0 up to 192.113.147.127

- **Anycast**:

  It tries to send a message to a device when multiple devices have the same address. It has low latency and does load balancing.

- **Multicast**:

  Multicast sends a message to multiple devices at the same time. In the IPv4 standard the multicast addresses are contained within the following range"
  $$
  \array{224.0.0.0 & - & 239.255.255.255}
  $$
  It uses the Internet Group Management Protocol (IGMP) for hosts registration and the Protocol Independent Multicast (PIM) for multicast routing.

## IPv4

An IPv4 address is a 32-bit number split into 4 groups of 8 bits each:

<img src="Resources/03 - Network Layer/image-20210318194953877.png" alt="image-20210318194953877" style="zoom:33%;" />

There were different classes of IPv4 in the past:

<img src="Resources/03 - Network Layer/image-20210318195142751.png" alt="image-20210318195142751" style="zoom:33%;" />

Classes A, B and C are normal unicast addresses, class D are multicast and E are reserved. 

Currently the Classless Inter-Domain Routing (CIDR) schema is being used to manage the addresses of class  A,B and C. With this schema the network prefix has an arbitrary length that is expressed with a mask. The mask has demarks with $1$ the elements of the network prefix. 

### Private IP Addresses

In private networks, all IPs are available. Usually each network has one or a few public addresses and the router handles the conversion of a large number of private addresses to them.

### IPv4 Packet Header

  <img src="Resources/03 - Network Layer/image-20210319124943106.png" alt="image-20210319124943106" style="zoom:33%;" />

The packet header looks like this, with the following fields:

- Version: 4
- Header Length: in 32-bit long words
- Type of Service: For basic QoS
- Packet Identification: For identification of different fragments.
- Flags: Different flags used for fragmentation
- Fragment Offset: Relative offset of the fragment
- Time to Live: Counter of the hops over routers.
- Protocol: Transport protocol identification
- Header Checksum: Checksum control
- Source Address: IPv4 address of the source host
- Destination Address: IPv4 address of the destination host
- Options: Used only for some special purpose
- Padding: Alignment of the header length to 32 bits.







