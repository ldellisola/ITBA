# Microservices

Microservices come to life as a response to monolithic applications, allowing a better decoupling of applications and recognizing them as independently deployable services.

The major benefits of microservices are:

- They are **loosely coupled**, meaning that the integrate using well-defined interfaces.
- They are **technology-agnostic** because they use HTTP and REST.
- They are **independently deployable**, so a change in a small part of the application wouldn't mean a complete redeploy.
- They are **organized around responsibilities** and domains.
- Because they are technology-agnostic, this means that they **can be implemented using different technologies**.

## Docker

Linux containers were introduced in 2008 as a way to allow to run a process tree in a isolated system-level "virtualization" while using much less resources than traditional methods. **Docker Containers** are an implementation of this that allows us to build commit and share images using only a description file called Dockerfile.

Containers, in contrast to virtual machines, share the OS and sometimes even libraries with each other and the host pc. In the case of virtual machines, each instance is running a full instance of an operating system.

## Kubernetes

Containers are atomic pieces of application architecture that can be linked and can have shared access to resources. Kubernetes comes as an automation of deployments to help scale and manage containerized applications across a number of nodes.

