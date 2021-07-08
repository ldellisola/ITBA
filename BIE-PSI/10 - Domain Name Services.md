# Domain Name Services

Name Services are a specialized database that works like an address book. The main tasks is to translate web addresses into IPs, check that they exists and search for them, as well as providing detailed information.

The DNS is primarily intended for *name-to-address* translation, and it is based on the `/etc/hosts` file structure. The records are: 

<img src="Resources/10 - Domain Name Sevices/image-20210522194101696.png" alt="image-20210522194101696" style="zoom:33%;" />

The domains in these servers work something like this:

<img src="Resources/10 - Domain Name Sevices/image-20210522194559464.png" alt="image-20210522194559464" style="zoom:25%;" />

## Components

The **namespace** and **source records** are a tree structure. The name contains from 0 to 64 byres, and there is an absolute name and a relative name. The **name servers** are data warehouses creating a name database. They are in charge of synchronizing these DBs and maintaining the response cache. The **resolvers** are a set of library functions providing translations. 

## Types of Servers

There are different types of DNS servers:

- **Primary**: It keeps zone data and is an authoritative server.
- **Secondary**: It copies data from a primary server and it is also an authoritative server.
- **Cache Only**: It maintains root domain records
- **Forwarding**: It passes a recursive query and it can also resolve by itself.

## Communication

DNS servers communicate both over TCP and UDP. First the request are sent to the **zone transfer**, where the query is sent to multiple servers and we can take the first answer as valid, but this causes some nameserver inconsistency.

## DNS Request

The query can be answered both authoritatively and non-authoritatively. If the DNS server does not know the answer, we have to options:

- **Recursive behavior**: It fund the answer and tells the source of the request. It sends the request to root servers and the proceeds towards subdomains according to NS records. This is the typical behavior of local DNS servers.
- **Non-Recursive Behavior**: It does not look for an answer. It forwards the requester to the IP address of the DNS server to be asked. This is typically found for higher-level DNS servers.