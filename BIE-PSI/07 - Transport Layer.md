# Transport Layer

### Transport Layer Services

The transport layer is the boundary between the applications and the network. It ensures transparent data transfer between end-users, providing reliability, flow control, data segmentation and correction of errors.

#### Addressing

The service must have an address, in this case it is known as **Transport Service Access Point** (TSAP). There are some predefined TSAPs like port 80 for HTTP services. There are also some dynamically allocated addresses that need special software, such as portmapper, that registers TSAP for other services like BitTorrent.

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

This problem looks simple, let's say there are two armies surrounding a third, enemy army in the middle.

<img src="Resources/07 - Transport Layer/image-20210522114551361.png" alt="image-20210522114551361" style="zoom:33%;" />

If either army attacks the enemy alone, they will loose, but if both attack at the same time, then they will win. The problem here is coordinating the attack across the enemy army without it noticing it.

 ### Flow Control

This layer follows the same principles as the link layer:

- Detection of errors
- Elimination of duplicated packets
- Limited number of unacknowledged packets
- Sliding window

It also allows for congestion control, preventing the network from overwhelming.

## TCP

TCP is the **Transmission Control Protocol**, which is a service on the layer 4 that is **connection-oriented**,guarantees **error free data** transmissions and it fully **duplex**.

The data delivery systems guarantees:

- Checksum
- Detection of duplicate packets
- Retransmission
- Correct ordering
- Timeout

### Header

<img src="Resources/07 - Transport Layer/image-20210522115145549.png" alt="image-20210522115145549" style="zoom:33%;" />

### Connection Establishment

<img src="Resources/07 - Transport Layer/image-20210522115300450.png" alt="image-20210522115300450" style="zoom:33%;" />

### Connection Termination

<img src="Resources/07 - Transport Layer/image-20210522115352310.png" alt="image-20210522115352310" style="zoom:33%;" />

### Sliding Window

The receiver reserves a buffer for receiving data and the sender will notify the window size in the packet. The sender must not send more data than the size of the window, then waits for acknowledgement. The window size is decreased if the receiver does not manage to process the data and the windows may be shrunk to improve flow control. 

### Acknowledgment

The receiver sends ACK, where is the sequence number of the byte, which was expected. This confirms that all the previous bytes have been received. The receiver does not need to send individual acknowledgments for each packet.

-  **Timeout on the sender**: The sender has no ACK up to the expected time, and the unacknowledged data will be retransmitted.
- **Duplicate ACK**: If the packet does not arrive, but the following does, the receiver repeats the last ACK. This is used as an indicator that the package might have been lost. 

- **Timeout on the receiver**: If no packet arrived up to the expected time, the sender will send the last ACK again up to a maximum of 3 retries.

### Window Size

The window size can go from 16 bits to 64 kilobytes. This poses a problem on fast links, as for example, in a 1Gbps link, sending 64kB takes 0.5 ms, and for a delay of 50 ms link is used only for 1% of its capacity.

This is solved using the **window scale option**, where a maximum value of 14 may be used for the scale factor and 30 bits can be used for window size.

### Congestion Control

There are several variables to do congestion control:

- **Maximum Segment Size (MSS)**: The maximum size of the packet to be sent, defined by the receiver.
- **Slow-start Threshold (SSTHRESH)**: It is a limit for likely congestion. It estimates how many unconfirmed data can be sent and it is written in multiples of MSS.
- **Congestion Window (CWND)**: It is the sender window. It counts how many unconfirmed data the sender sends.

Congestion is caused by a packet or its acknowledgment that is lost. There are two cases:

- <u>If ACK did not come at all</u>: The transmission is repeated from the last acknowledged packet and the slow start is repeated.
- <u>If duplicate ACK comes 3 times</u>: A *fast retransmit* and *fast recovery* method is activated and the lost packet is sent again, but not the following ones. The CWND is decreased by half.

### Usage

TCP is good for applications which need a reliable data channel to send medium to large blocks of data. Because of its big overhead, it is not suitable for real-time applications and it is too complex for embedded systems.

## UDP

The **User Datagram Protocol** is a connection-less service on layer 4. The datagram in this service may be lost, and it uses ports for multiplexing in the same way TCP does. The maximum size of the packet to be sent is 64 kB.

### Header

<img src="Resources/07 - Transport Layer/image-20210522123922320.png" alt="image-20210522123922320" style="zoom:33%;" />

### Usage

UDP is used when we want to send small blocks of data and :

- Packet losses are not critical
- TCP overhead is not acceptable

## RTP

The **Real-time Transport Protocol** handles streaming data between endpoints in real time. The header contains a *timestamp* with the time from the beginning of the stream. The unit depends on the application and it allows to interpret the received block.

This protocol is mostly implemented over UDP and its usage covers:

- Multimedia formats
- Videoconferencing
- Data Streaming
- VoIP

#### RTCP

RTCP is the STP control protocol. It provides statistics and control information for an RTP session. It does not transport any media data itself and it is used to control quality of service. 
