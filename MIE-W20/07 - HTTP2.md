# HTTP/2

The HTTP2 standard came to expand upon the previous releases, mostly to resolve unnecessary network traffic and improve concurrency performance.

## Communication

The data exchange between the client and the server breaks down the communication into frames, that are mapped to messages that belong to a particular stream .This is what is called multiplexed communication within a single TCP connection.

The new standard also allows fully parallel requests and it improves performance by eliminating unnecessary latency. This multiplexing allows for only one connection per login and existing connections are persisted.

The benefits of having only one connection are:

- Significant reduction of the overall protocol overhead.
- Use of fewer connections reduces the memory and processing footprint along the full connection path.
- Reduces operational costs and improves the network capacity.
- It improves the performance of HTTPS deployments by reducing the number of TLS handshakes and better session reuse.

### Flow Control

This new protocol prevents the sender from receiving data it doesn't want and the receiving part can allocate a fixed amount of resources for a particular stream. The flow control is done *hop-by-hop* instead of *end-to-end*, so any intermediary can set its own flow control.

### Server Push

Server push is a new feature that allows servers to send multiple responses for a single request, it is mostly used to preload resources the client will need such as images or CSS from a website. This is usually handled form the browser with a **Push Promise**, saying that the server intends to push the resource to the client.

### Stream Prioritization

Messages are split into frames and then delivered in multiplexed streams, and the order of these frames is important for a good performance. This is why stream prioritization is important. Each stream can be assigned a number between 1 and 256 and we can attach streams as dependencies for other streams. Then we can prioritize some streams over others.

### Header Compression

Each HTTP request and response contains a set of headers, in the previous versions of this protocol the headers were plain text. In the second revision of the standard the headers are compressed using HPACK format. The header fields will be encoded via static Huffman code and the client and server will maintain an indexed list of previously seen header fields.

