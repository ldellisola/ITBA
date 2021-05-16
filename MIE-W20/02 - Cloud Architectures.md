# Cloud Architectures

The Cloud is a different way of thinking applications where data is your major asset and not server infrastructure. It has benefits such as high reliability and availability, with lower costs (pay-per-use) and a lot of elasticity. This is all obtained by outsourcing server infrastructure and renting it monthly.

This can also be deployed in 3 different models:

- **Public Cloud**
- **Private Cloud**
- **Hybrid Cloud**

## Service Models

There are different service models within the industry:

- **Infrastructure as a Service (IaaS)**: The companies don't own servers, they rent them out to web services companies such as AWS or Azure.
- **Platform as a Service (PaaS)**: The companies don't even know the servers they are using, they are instead paying for a database or cloud functions such a serverless or lambda.
- **Software as a Service (SaaS)**: The companies buys software directly, this would be equivalent of paying for SalesForce.

### Infrastructure as a Service

It provides basic computing resources and services for application providers, and the consumer is able to deploy and run arbitrary software. For the providers of this service, they have to expose their resources though abstraction such as virtual machines and they have to support isolation for multitenant

The usage is mostly predefined machine instances and the users pay-per-use or per resources used with no upfront cost.

### Platform as a Service

This type of service provides a scalable platform for applications and the user does not have to worry about the underlying software or hardware. Here the user chooses a software platform and then the service provider will handle scaling and load balance, as well as persistent storage, local development environments  and backend for app instances with higher CPU and memory demands.

### Software as a Service

The software as a service model provides services for end users that can be accessed with a web browser or an app, and they usually provide programmatic access through an API. This services are usually built on top of IaaS or PaaS and they are fully customizable.

## Multitenancy

Multitenancy is an architectural approach where resources are shared across multiple tenants or consumers. This allows centralization of infrastructure with lower costs, peak-load capacity increases and a better utilization of the hardware.

- **Share Everything**: Here tenants share all the resources of the system while still being isolated. This is common for SaaS models.

  <img src="Resources/03 - Cloud Architectures/image-20210513150834293.png" alt="image-20210513150834293" style="zoom:33%;" />

- **Shared Infrastructure**

  - **Virtual Machines**: Each tenant has its own virtual environment with isolation provided by an hypervisor. The resources depend on the VM capability and configuration.

    <img src="Resources/03 - Cloud Architectures/image-20210513150819964.png" alt="image-20210513150819964" style="zoom:33%;" />

  - **OS Virtualization**: Here each tenant has its own processing zone, with isolation provided by the operating system.

    <img src="Resources/03 - Cloud Architectures/image-20210513150805462.png" alt="image-20210513150805462" style="zoom:33%;" />

 