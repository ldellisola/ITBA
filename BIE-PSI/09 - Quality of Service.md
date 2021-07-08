# Quality of Service

Quality of Service (QoS) has to different definitions, one at the network level and one at the application level. In general we can say that quality of service is the result of a joint activity of applications, middleware, OS and network.

The parameters and metric of network QoS could be used in agreement among network providers, and between end users and their networks providers, although there is no uniform universal specification.

## Quantitative Parameters

The quantitative parameters describe the physical system's properties, for example:

- **Delay**: It can be measured in two ways: **Round-Trip Time (RTT)** and **One-Way Delay (OWD)**. There are also different types of delay:

  - **Transmission Delay**: Time from the first to last bit on the medium:
    $$
    D_T = \frac N S
    $$
    Where $N$ is the number of bits and $S$ the transmission rate.

  - **Propagation Delay**: It is the physical speed of the medium:

    - Speed of light for vacuum or air
    - $2\times 10^8 m/s$ for electrical cable
    - $2\times 10^8 m/s$ for optical cable

  - **Processing Delay**: It involves header analysis, searching in routing tables, etc.

  - **Queuing Delay**: This concerns the output queue of the network interface and the input queue of the device processor (router)

- **Jitter**: It involves one-way delay variations and it can be expressed as absolute value or as a relative value. It is important for real-time communication, but it is compensated by the input buffer in the application.

- **Data Loss**: It is measured either in bits (BER) or packets (PLR) lost. This is highly dependent on the medium, but congestion in the network can also create data loss.

- **Throughput**: It is the actual bandwidth of the network, limited by the link with the smallest capacity.

- **Availability**: It is the probability that the network will be available, expressed relatively. This includes technical faults and administrative restrictions.

## Qualitative Parameters

These parameters are defined into classes. The most known one is **best-effort**, where the network does not provide any guarantees and the user obtains unspecified variable bit rate and delivery time, depending on the current traffic load.

### SLA and SLS

**Service Level Agreement** is an agreement on technical and non-technical service parameters between customer and provider.

**Service Level Specification** is an specification of SLA technical parameters that involves scopes, flow description, traffic envelope, excess treatment, time and reliability.

## Queuing Algorithms

We can queue packets in different wats, this involves wither using an FIFO queue or a priority queue at its simplest, although there are more implementations of that focus on sharing the capacity of the system:

- **Weighted Fair Queuing (WFQ)**
- **Weighted Round Robin (WRR)**
- **Modified/Deficit Round Robin (MDRR/DRR)**

There are other implementations that prevent congestions, such as:

- **(Weighted) Random Early Detection (WRED/RED)**

## Network Congestion

Network congestion sharply increases the loss rate of the network, as well as the degradation of network parameters. We can prevent this congestion by reserving bandwidth for certain connections or react at signs of congestion.

We can avoid excess traffic on the network by applying **policers**, that will limit the bandwidth:

<img src="Resources/09 - Flow Control/image-20210522192834452.png" alt="image-20210522192834452" style="zoom:33%;" />

We can also remove the consequences of burstiness and jittery connections by using a **sharpener**:

<img src="Resources/09 - Flow Control/image-20210522192915632.png" alt="image-20210522192915632" style="zoom:33%;" />

