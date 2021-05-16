# Realtime Web

There are two main ways to implement data streaming in the web: Polling and Pushing.

<img src="Resources/06 - Realtime Web/image-20210513204620128.png" alt="image-20210513204620128" style="zoom:33%;" />

Polling  consists on the client periodically checking for updates on the server, while pushing creates a persistent connection and the server will send the data over that channel. There are two types of pushing: the first one is **long polling**, and it consists on the server holding the request for some time while **streaming** opens a socket and sends updates without closing it.

## Long Polling

In Long Polling, the client sends a request and the server keeps it until it an event occurs, and then it sends it back. This process saves computer resources at the server as well as network resources, but it has some drawback as well. There is a maximum time of request processing at the server and it cannot support concurrent request processing at the server.

<img src="Resources/06 - Realtime Web/image-20210514111615638.png" alt="image-20210514111615638" style="zoom:33%;" />

## Streaming

Here the client initiates a request that the server stores until there is an event or a timeout. When this occurs, the server sends it back to the client as part of the response, but it does not terminate the communication, so when the next event comes, we can reuse the channel. This is done by using the `transfer-encoding` header in HTTP 1.1 or omitting the `content-lenth`  attribute in the response.

<img src="Resources/06 - Realtime Web/image-20210514112240308.png" alt="image-20210514112240308" style="zoom:33%;" />

### Chunked Data

If we set the `transfer-encoding` to *"Chunked"* we can send multiple sets of data over a single connection. each chunk starts with the hexadecimal value for length and we send $0$ to end the response. This method has some drawbacks though, as chunks cannot be considered events and intermediaries might re-chunk the message stream. In the same way, clients may buffer all data chunks before the make the response available to the application

### Server-Sent Events

Server-Sent Events is a feature of the HTML5 spec where an API is able to handle HTTP streaming in browser by using DOM events. For this feature we can use chunked messages and EOF. In order to send this events, the content-type must be `text/event-stream`. Every line must start with `data:`  and then write the data onto the stream with the exception of `id:` which is an optional identifier associated with the message. The last part of the data must be finished with `\n\n` to notify the client.

### Cross-Document Messaging

We can also use iframes to stream messages. With this method we have to lead a streaming resource in a hidden iframe. the server will push JavaScript code to the frame and the browser will execute the code as it arrives. The embedded iframe's code posts messages to the upper document.

<img src="Resources/06 - Realtime Web/image-20210514114629352.png" alt="image-20210514114629352" style="zoom:33%;" />

## WebSocket

WebSocket is a new protocol that runs as a layer on top of TCP that allows for bi-directional communication between client and servers with low-latency and no HTTP overhead. This protocol has to phases, first there's a handshake to *"Upgrade"* the HTTP connection and then we can start transferring data.

## WebRTC

 This protocol stands for Web Real-Time Communication and it is an API to exchange media and arbitrary data between peers inside Web pages. It uses P2P technology instead of traditional server oriented messaging.

This protocol is mostly used for acquiring audio and video as well as communicating audio and video in videocalls. The communication is done in two phases:

1. **Signaling**: WebRTC defines abstract signaling, meaning that apps can use any signaling protocol such as SIP, XMPP or a custom implementation. In this step the clients need to exchange session description objects such as formats and codecs to used.
2. **Exchange of real-time data**

### Signaling

#### SIP and SDP

SIP is the Session Initiation Protocol, and it is used to stablish and modify sessions. SDP, or Session Description Protocol, describes media for a session.

#### JavaScript Session Establishment (JSEP)

JSEP is a protocol to create a session between two parties. It works by a user creating and sending over their local SDP, then the receiving user will do the same, and after sending it the session will be stablished.

#### Interactive Connectivity Establishment

ICE allows WebRTC to overcome the complexities of Real-world networking, finding the best path to connect peers such as direct P2P communication or using:

- **Session Transversal Utilities for NAT (STUN)**: It allows us to discover the presence of a NAT server and to discover public IP addresses and a port that the NAT has allocated for UDP flows. This is implemented as a third-party server inside the public side of the NAT.

  <img src="Resources/06 - Realtime Web/image-20210514124022531.png" alt="image-20210514124022531" style="zoom:33%;" />

- **Traversal Using Relays around NAT (TURN)**: It allows communication relay for hosts behind NAT when STUN does not work.

  <img src="Resources/06 - Realtime Web/image-20210514124049640.png" alt="image-20210514124049640" style="zoom:33%;" />

  