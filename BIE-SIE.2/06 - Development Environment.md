# Development Environment

The development environment is not only the IDE, but a system designed to the target customer environment. But we can't have only one environment, in fact we have several for different stages of the development process.

Here's a short list of possible environments:

<img src="Resources/06 - Development Environment/image-20201210183418248.png" alt="image-20201210183418248" style="zoom:25%;" />

##  DTAP

DTAP is a phased approach to software testing and deployment. The four letters denote the following common steps:

1. The program or component is developed on a **Development** system.
2. Once the developer thinks it s ready, it is moved to a **Testing** environment to verify it works as expected. This environment is supposed to be nearly identical to the target environment. 
3. Once the tests are successful, we move the system to an **Acceptance** server where the client can test the program.
4. If everything goes well, the system will go into a **Production** server where everyday users will be able to access it.