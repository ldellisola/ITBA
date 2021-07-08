# Application Layer

The application layer involves the implementation of protocols and services that use the transport layer or the presentation layer. It supports two main architectures:

- **Client-Server**: The server offers a service and the client connects to it and uses the service.
- **Peer-to-Peer**: The communicating parties are not distinguished.

## FTP

The **File Transfer Protocol** allows file transfer between a client and a server over TCP. It uses the port 21 as the command channel and then it has two modes:

- **Active mode**: The client determines the port number for the data channel on his side, while the serve starts transfers form port 20. This method may have firewall issues on the client side.
- **Passive mode**: The server determines the port number and it notifies the client. The client will start the connection on the data channel from the generated source port. This solves the problem of firewalls filtering the incoming data port connection, as it is initiated by the client.

FTP is not secure, but it can be using SFTP. This new implementation provides secure file transfer using SSH.

## Telnet

Telnet is an old interactive text-oriented communication utility used for remote access via a virtual terminal connection. Telnet uses the TCP port 23 and has no support for encryption or mouse, It is primary used for configuration of network devices.

## SSH

**Secure Shell** runs on TCP port 22 and it replaces telnet. It supports an encrypted cannel with encrypted authentication as well as file transfer.

## Email

The electronic mailing system was the first service with great popularity. There are 3 main software agents:

- **Mail Transfer Agent (MTA)**
- **Mail User Agent (MUA)**
- **Mail Delivery Agent (MDA)**

There are also different protocols used:

- **SMTP**: It runs on the TCP port 25 and it is used for sending messages from MUA to MTA as well for communication between MTAs.
- **POP3**: It connects on the TCP port 110 and it is used for reading received messages (from MDA to MUA)
- **IMAP4**: It runs on TCP port 143 and it replaces POP3

## Web

The web is the most used internet services, running both on the HTTP and HTTPS protocols. Here the server does not store state information abut the session, this is handled by cookies and stored on the client side.

## NTP

The **Network Time Protocol** allows clock synchronization between computers over variable-latency data networks. This service runs on the UDP port 123 and it has time accuracy down to 1 to 10 ms. 

This system works in a hierarchical way, where the NTP servers have a *"Stratum"* number that indicates the distance to the primary source. The stratum-0 server is one that is connected to an external time source, such as an atomic clock.

## BOOTP and DHCP

Both protocols have the same general purpose: assigning network configuration for computers. The **Bootstrap Protocol** allowed the station to get IP addresses, masks, gateway, DNS server address and image of the operating system.

The **Dynamic Host Configuration Protocol**, on the other side uses the same ports as BOOTP and it adds support for both dynamic and time-limited IP addresses, as well for IPv6 and more services on the same layer.

## Streaming

The transmission of audiovisual content is divided in two: **real time** and **on-demand**.

### VOIP

**Voice over IP** allows people to use the telephone over internet. For this they use different codecs such as iSAC or SPEEX. 

### Peer to Peer Networks

Here clients communicate directly with each other. The main applications of these networks are BitTorrent, Tor and Microsoft's Delivery Optimization.