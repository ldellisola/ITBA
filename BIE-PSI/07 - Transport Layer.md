# Transport Layer

### Transport Layer Services

The transport layer is the boundary between the applications and the network. It ensures transparent data transfer between end-users, providing reliability, flow control, data segmentation and correction of errors.

#### Addressing

The service must have an address, in this case it is known as **Transport Service Access Point** (TSAP). There are some predefined TSAPs like port 80  for http services. There are also some dynamically allocated addresses that need special software, such as portmapper, that registers TSAP for other services like BitTorrent.

## Connection

There are different ways to stablish a connection, the most simple one is to just send a request and accept it:

<img src="Resources/07 - Transport Layer/image-20210507151857261.png" alt="image-20210507151857261" style="zoom:33%;" />

This can have problems such as duplicated connection request packets. There are also some improvements that can be made, such as adding an unique identifier for each session and establishing a limited lifetime for packets.

A way to solve this issues is implementing a three-way handshake:

<img src="Resources/07 - Transport Layer/image-20210507152059364.png" alt="image-20210507152059364" style="zoom:33%;" />

To connect with this method, we need to send a connection request, the client will send an acknowledge for out request and send a connect request themselves. We are going to acknowledge their request and then start sending data.

### Connection Termination

Connection termination can also be a problem, and we have two main ways to solve it:

- **Asymmetric Termination**: Here one user terminates the connection unilaterally, and some data from the other user may get lost if he sends it before receiving the termination message.
- **Symmetric Termination**: Here both sides must agree on closing the connection. While this solution does not have any data loss, there is no fully reliable solution if the communication is not secured. This problem can bee seen with the *"Two Armies Problem"*.

### The Two Armies Problem

