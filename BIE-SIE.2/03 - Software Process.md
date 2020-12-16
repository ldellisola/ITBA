# Software Process

The **software process** is a set of activities required for developing software. Within those activities, we can define 4 basic divisions:

- **Specification**: 
- **Development**:
  - Architecture
  - Design
  - Implementation
- **Validation**
- **Evolution and Maintenance**

## Models of Software Process

The software process models is a description of the software process from a particular perspective. Generally we have to different perspectives: **Plan-driven**  and **Agile**.

The former relies in planning all activities in advance and progress is measured by comparing the status of a plan. This usually means an increased overhead in case of changes.

The agile strategy works by planning small portions of the project, making it easier to change the direction of the project if the requirements of the customer change.

Within this perspectives we have three main ways to approach this problem: **waterfall**, **iteration** and **agile**. 

#### Waterfall

<img src="Resources/03 - Software Process/image-20201210154545399.png" alt="image-20201210154545399" style="zoom:25%;" />

The waterfall approach consists of 5 completely separate phases:

1. **Requirements Analysis**
2. **Design**
3. **Implementation**
4. **Testing**
5. **Deployment and Maintenance**

The projects that implement this process model benefit from a clearly defined plan which usually translates to being very predictable when talking about time, scope and money. It also allows for easy coordination of work.

On the other side, in order to use this model, it is necessary to understand what the clients needs from the beginning, as it doesn't react well to changes in the requirements. The speed of the first delivery is also very slow.

The Waterfall approach is used when developing new and original technologies, where you need to plan ahead.

#### Iterative

<img src="Resources/03 - Software Process/1280px-Iterative_development_model.svg.png" alt="img" style="zoom:30%;" />

This process model tries to mix both approaches, using agile's benefits with the stability offered by a plan-driven approach. The main idea here is to iterate several times over a waterfall project. 

We can benefit from a clear defined path with a lot of predictability and an easy coordination of work thanks to the waterfall approach, but we can also present beta versions or prototypes to our clients to show progress.

The bad part of this approach is that we still need to understand perfectly the requirements of the client in the beginning, and changes in the requirements can still take some time to be delivered.

The iterative approach is most used for large-scale projects where predictability is more important than flexibility and maintenance is a necessity. It is very used in research or prototyping.

#### Agile

<img src="Resources/03 - Software Process/software-engineering-agile-model.png" alt="Agile Model (Software Engineering) - javatpoint" style="zoom:70%;" />

The agile process does not try to implement a long term plan, but actually it just plans a week or two ahead and it relies a lot in communication between the different parts of the team. The main idea here is to work on software instead of worrying too much about comprehensive documentation and it also involves heavily the contributions from the clients and it can adapt very quickly to changes in the requirements.

Agile has it's place on small or in-house projects where we can't define the solution in advance. 

### Aspects 

#### Flexibility

In terms of **flexibility**, meaning the rate of response to changes and the speed and cost of it, we can say that the waterfall approach is very inflexible and has a high cost, making it vert inflexible. 

Things change a little with iterative projects, it is a little more flexible allowing changes to be incorporated in the next iteration. 

Agile offers the best solution to this problem, expecting changes and allowing them fairly easy and fast.

#### Architecture and Design

The architecture and design aspects allow us to measure how well designed the system is and if it follows design principles. Here the waterfall approach is the best one because it is all planned ahead of the development.

Iterative maintains a high level of architecture and design because it is very similar to waterfall, but it has the risk of contamination by problems in the next iteration.

Agile is the worst model in this section, with each new sprint introducing the possibility of creating a problem.

#### Implementation

The implementation takes into consideration the space for the delivery of quality work and requirements for the programmers.

Both iterative and waterfall allocate enough space for QA, revision and coding standards, but the risk of contamination by problems in the next iteration exists only in the iterative model.

Agile development can sort most of this problems if there's a good team, but that's not always the case. They are also at risk of poor quality work when there's no space for revision.

#### Documentation

Here we are measuring the quality and consistency of the documentation of the system. Here the more iterations or sprints you have, the harder it is to maintain consistency and quality documentation.

#### Cooperation with Clients

Here we are trying to see the requirements for synergy and how often the client should participate on the project.

For the most part, in the Iterative and Waterfall model there are well-defined moments that can be easily planned. In the case of Agile development, it is a necessity to have constant interaction with the customer throughout the project. If there is not, there;s a high risk of failure.

