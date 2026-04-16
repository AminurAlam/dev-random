#set text(1.35em)
#set par(justify: false)
#set page(margin: 25pt)

#outline(depth: 1)

#pagebreak()

= SPMP

Once project planning is complete, project managers document their plans in a
software project management plan (SPMP) document. While the SRS document describes
what the software should do, the SPMP describes how the team will get the work done.
It is a formal document that outlines the activities, resources, and schedules
required to complete the project successfully.

The Software Project Management Plan (SPMP) provides a structured way to communicate
team expectations. It provides information on the overall business objectives,
resources needed, the budget allotted, and the schedule for delivery. The project
management plan can be extensive, as it documents the planning assumptions and
decisions, facilitates communication among project stakeholders, and documents
approved scope, cost, and schedule baselines. This documentation is essential. This
lesson shared a simple software project management plan example to provide an
understanding of the overall structure of the document.

== Contents

Just like a regular project management plan, it should address the scope, business
objectives, schedule, stakeholders, and budget for the project.

+ / Introduction: Objectives, Major Functions, Performance Issues, Management and
    Technical Constraints
+ / Project estimates: Historical Data Used, Estimation Techniques Used, Effort,
    Resource, Cost, and Project Duration Estimates
+ / Schedule: Work Breakdown Structure, Task Network Representation, Gantt Chart
    Representation, PERT Chart Representation
+ / Project resources: People, Hardware and Software, Special Resources
+ / Staff organisation: Team Structure, Management Reporting
+ / Risk management plan: Risk Analysis, Risk Identification, Risk Estimation, Risk
    Abatement Procedures
+ / Project tracking and control plan: Metrics to be tracked, Tracking plan, Control
    plan
+ / Miscellaneous plans: Process Tailoring, Quality Assurance Plan, Configuration
    Management Plan, Validation and Verification, System Testing Plan, Delivery,
    Installation, and Maintenance Plan

#pagebreak()

= SLIDING WINDOW PLANNING

It is usually very difficult to make accurate plans for large projects at project
initiation. A part of the difficulty arises from the fact that large projects may
take several years to complete. As a result, during the span of the project, the
project parameters, scope of the project, project staff, etc., often change
drastically resulting in the initial plans being useless.

In order to overcome this problem, sometimes project managers undertake project
planning over several stages. In Sliding Window Planning you plan the near-term work
in great detail while keeping long-term work at a very high, summary level. After the
initial project plans have been made, they are revised at frequent intervals.
Planning a project over a number of stages protects managers from making big
commitments at the start of the project. This technique of staggered planning is
known as sliding window planning.

As the project progresses and more information becomes available, you "slide" the
window of detailed planning forward. This allows you to avoid making rigid
commitments about the future when you don't yet have all the facts.

== Advantages

/ Higher Accuracy: It is much easier to estimate what your team can do next week than
  what they can do six months from now.
/ Reduced Waste: You don't spend hours creating a 200-task schedule for October only
  to have the client change the requirements in August, making all that planning work
  useless.
/ Flexibility: It allows the team to incorporate lessons learned from early phases of
  the project into the planning of later phases.
/ Lower Risk: By focusing on "progressive elaboration," you identify technical
  hurdles early and can adjust the "next window" of planning to handle those risks.

== Sliding Window vs Traditional Planning

In a traditional Waterfall approach, a manager tries to plan the entire project from
start to finish before a single line of code is written. This often leads to "death
marches" because those early guesses were inevitably wrong.

In Sliding Window Planning, you admit that you don't know everything yet. You provide
a "Rough Order of Magnitude" (ROM) for the whole project to give the stakeholders an
idea of cost, but you only commit to a detailed "Work Breakdown Structure" (WBS) for
the immediate future.

#pagebreak()

= DELPHI COST ESTIMATION TECHNIQUE

== Expert Judgement

Expert judgement is a size estimation technique where experts analyze a problem and
aggregate the estimated costs of individual components.

The single-expert approach is prone to
- human error
- individual bias
- and gaps in specialized knowledge.
- collective social
- political biases
- the potential for assertive members to dominate

== Delphi Cost Estimation

+ SRS document is provided to the group
+ They make independent individual estimates anonymously
+ Estimates are used to compute group mean
+ Group mean is presented to the group
+ Group once again makes individual estimates
+ Mean is again found for individual estimates
+ If new mean is not agreed upon, then repeat step four

While offering advantages such as aggregating diverse opinions without physical
meetings and ensuring anonymity, it may lack the depth of live discussions and face
challenges like potential dropouts and the risk of aligning views with the majority.

The purpose behind this restriction is that if any discussion is allowed among the
estimators, then many estimators may easily get influenced by the rationale of an
estimator who may be more experienced or senior. After the completion of several
iterations of estimations, the co-ordinator takes the responsibility of compiling the
results and preparing the final estimate. The Delphi estimation, though consumes more
time and effort, overcomes an important shortcoming of the expert judgement technique
in that the results cannot unjustly be influenced by overly assertive and senior
members.

== Advantages

+ / Convenience:
    As surveys are distributed and filled out remotely. Participants can possess the
    flexibility to finish surveys at their convenience. This remote approach
    streamlines the process, making it accessible and efficient for all involved. The
    ease of participation enhances engagement and collaboration among experts.
+ / Qualitative Information:
    Delphi method thrives even in the absence of prior information. Leveraging
    experts' knowledge, it offers a blend of quantitative and qualitative data. This
    combination enhances the depth of understanding, especially when dealing with new
    trends or developments.
+ / Anonymity:
    experts can express their opinions openly. This anonymity ensures that forecasts
    in the initial round remain untainted by groupthink, leading to more genuine and
    unbiased insights. The method's confidentiality empowers experts to share their
    views without reservation.
+ / Balance: Involving expert panels from diverse fields ensures a balanced
    perspective, ranging from e-commerce to healthcare. This diversity of experiences
    and opinions enriches the decision-making process.

#figure(image("assets/delphi.svg"))

#pagebreak()

= MODULARITY

The module simply means the software components that are been created by dividing the
software. The software is divided into various components that work together to form
a single functioning item but sometimes they can perform as a complete function if
not connected with each other. This process of creating software modules is known as
Modularity in software engineering.

It simply measures the degree to which these components are made up than can be
combined. Some of the projects or software designs are very complex that it's not
easy to understand its working and functioning. In such cases, modularity is a key
that helps in reducing the complexity of such software or projects. The basic
principle of Modularity is that a system should be made up of different components
that are united and work together in an efficient way and such components have a
well-defined function. To define a modular system, several properties or criteria are
there under which we can evaluate a design method while considering its abilities.

== Properties

- / Modular Decomposability:
    Modular decomposability means to break down the problem into different
    sub-problems in a systematic manner. Solving a large problem is difficult
    sometimes, so the decomposition helps in reducing the complexity of the problem,
    and sub-problems created can be solved independently. This helps in achieving the
    basic principle of modularity.
- / Modular Composability:
    Composability simply means the ability to combine modules that are created. It's
    actually the principle of system design that deals with the way in which two or
    more components are related or connected to each other. Modular composability
    means to assemble the modules into a new system that means to connect the combine
    the components into a new system.
- / Modular Understandability:
    Understandability simply means the capability of being understood, quality of
    comprehensible. Modular understandability means to make it easier for the user to
    understand each module so that it is very easy to develop software and change it
    as per requirement. Sometimes it's not easy to understand the process models
    because of its complexity and its large size in structure. Using modularity
    understandability, it becomes easier to understand the problem in an efficient
    way without any issue.
- / Modular Continuity:
    Modular continuity means making changes to the system requirements that will
    cause changes in the modules individually without causing any effect or change in
    the overall system or software.
- / Modular Protection:
    to keep safe the other modules from the abnormal condition occurring in a
    particular module at run time. The abnormal condition can be an error or failure
    also known as run-time errors. The side effects of these errors are constrained
    within the module.

#figure(image("assets/modularity.svg"))

#pagebreak()

= DEBUGGING

Debugging in Software Engineering is the process of identifying and resolving errors
or bugs in a software system. It's a critical aspect of software development,
ensuring quality, performance, and user satisfaction. Despite being time-consuming,
effective debugging is essential for reliable and competitive software products.

In the context of software engineering, debugging is the process of fixing a bug in
the software. When there's a problem with software, programmers analyze the code to
figure out why things aren't working correctly. They use different debugging tools to
carefully go through the code, step by step, find the issue, and make the necessary
corrections.

== Steps for Debugging:

+ Reproduce the Bug
+ Locate the Bug
+ Identify the Root Cause
+ Fix the Bug
+ Test the Fix
+ Document the Process

== Debugging Approaches/Strategies:

+ / Brute Force: This is the most common method of debugging but is the least
    efficient method. In this approach, print statements are inserted throughout the
    program to print the intermediate values with the hope that some of the printed
    values will help to identify the statement in error. This approach becomes more
    systematic with the use of a debugger, because values of different variables can
    be easily checked and break points and watch points can be easily set to test the
    values of variables effortlessly. Single stepping using a symbolic debugger is
    another form of this approach, where the developer mentally computes the expected
    result after every source instruction and checks whether the same is actually
    computed by a statement by single stepping through the program.
+ / Backtracking: Backward analysis of the problem which involves tracing the program
    backward from the location of the failure message to identify the region of
    faulty code. A detailed study of the region is conducted to find the cause of
    defects.
+ / Forward analysis: of the program involves tracing the program forwards using
    breakpoints or print statements at different points in the program and studying
    the results. The region where the wrong outputs are obtained is the region that
    needs to be focused on to find the defect.
+ / experience: with the software debug the software with similar problems in nature.
    The success of this approach depends on the expertise of the debugger.
+ / Cause elimination (bisecting): it introduces the concept of binary partitioning.
    Data related to the error occurrence are organized to isolate potential causes.
+ / Static analysis (LSP): Analyzing the code without executing it to identify
    potential bugs or errors. This approach involves analyzing code syntax, data
    flow, and control flow.
+ / Dynamic analysis: Executing the code and analyzing its behavior at runtime to
    identify errors or bugs. This approach involves techniques like runtime debugging
    and profiling.
+ / Logging and Tracing: Using logging and tracing tools to identify the sequence of
    events leading up to the error. This approach involves collecting and analyzing
    logs and traces generated by the system during its execution.

#pagebreak()

= CORBA

CORBA (Common Object Request Broker Architecture) is a "middleman" technology that
allows different software components to talk to each other, even if they are written
in different programming languages or running on different types of computers.

Created in the early 1990s, its goal was to solve a major problem in software
engineering: making a Java program on a Windows computer communicate seamlessly with
a C++ program on a Linux server. It treats everything as an "object," allowing a
developer to call a function on a remote computer as if it were right there on their
own machine.

/ ORB: This is the heart of the system. It acts as a "software bus" or post office.
  When a client wants to send a message to a server, the ORB finds the server,
  delivers the message, and brings the answer back. The client does not have to be
  aware of where the required server object is located, its programming language, its
  operating system or any other aspects that are not part of an object's interface.

/ Domain interfaces: These interfaces provide services pertaining to specific
  application domains. Several domain services have been in use, including
  manufacturing, telecommunication, medical, and financial domains.

/ Object services: These are domain-independent interfaces that are used by many
  distributed object programs. For example, a service providing for the discovery of
  other available services is almost always necessary regardless of the application
  domain. Two examples of object services that fulfill this role are the following:
  Naming Service: This allows clients to find objects based on names. Naming service
  is also called white page service.

/ Trading Service: This allows clients to find objects based on their properties.
  Trading service is also called yellow page service. Using trading service a
  specific service can be searched. This is akin to searching a service such as
  automobile repair shop in a yellow page directory. There can be other services
  which can be provided by object services such as security services, life-cycle
  services and so on.

/ Common facilities: Like object service interfaces, these interfaces are also
  horizontally-oriented, but unlike object services they are oriented towards
  end-user applications. An example of such a facility is the distributed document
  component facility (DDCF), a compound document common facility based on OpenDoc.
  DDCF allows for the presentation and interchange of objects based on a document
  model, for example, facilitating the linking of a spreadsheet object into a report
  document.

== Advantages

- / Language Independence: You aren't locked into one language; you can use the best
    tool for each task.
- / Location Transparency: The developer doesn't need to know the IP address or
    details of the remote server; the ORB handles it.
- / Legacy Integration: It is excellent for "wrapping" old systems so they can talk
    to modern web applications.

== Disadvantages

- / High Complexity: Learning and setting up CORBA is notoriously difficult. The
    documentation is thousands of pages long.
- / Firewall Issues: CORBA often struggles to send data through modern corporate
    firewalls, which led to many "connection failed" errors.
- / Performance: All that "middleman" work adds overhead, making it slower than some
    modern alternatives.

== Modern Relevance
Today, CORBA is considered a "legacy" or "niche" technology. While it is still used
in massive, mission-critical systems (like banking backends, airline reservation
systems, or military hardware), most modern companies have moved on. If you were
starting a new project today, you would likely use REST APIs, gRPC, or Microservices
instead. These modern tools do roughly what CORBA did but are much simpler to build,
easier to pass through firewalls, and better suited for the modern web.

#figure(image("assets/corba.svg", width: auto))

#pagebreak()

= COCOMO MODEL

COnstructive COst estimation MOdel (COCOMO) was proposed by Boehm. COCOMO prescribes
a three stage process for project estimation. In the first stage, an initial estimate
is arrived at. Over the next two stages, the initial estimate is refined to arrive at
a more accurate estimate. COCOMO uses both single and multivariable estimation models
at different stages of estimation. The three stages of COCOMO estimation technique
are: basic COCOMO, intermediate COCOMO, and complete COCOMO.

== STAGE 1: Basic COCOMO Model

/ Organic: well-understood application program, the size of the development team is
  reasonably small, and the team members are experienced in developing similar types
  of projects.
/ Semidetached: mixture of experienced and inexperienced staff. Team members may have
  limited experience on related systems but may be unfamiliar with some aspects of
  the system being developed.
/ Embedded: the software being developed is strongly coupled to hardware, or if
  stringent regulations on the operational procedures exist. Team members may have
  limited experience on related systems but may be unfamiliar with some aspects of
  the system being developed.

FORMULA:
$
  "Effort" & = a_1 times ("KLOC")^(a_2) "PM" \
    "Tdev" & = b_1 times ("Effort")^(b_2) "months"
$

#grid(
  columns: 2,
  gutter: 10pt,
  image("assets/cocomo_basic_eff.svg", width: 260pt),
  image("assets/cocomo_basic_dev.svg", width: 250pt),
)

From the effort estimation, project cost can be obtained by multiplying the estimated
effort (in man-month) by the manpower cost per month.

== STAGE 2: Intermediate COCOMO

A host of other project parameters besides the product size affect the effort as well
as the time required to develop the product. For example, the effort to develop a
product would vary depending upon the sophistication of the development environment.
Therefore, in order to obtain an accurate estimation of the effort and project
duration, the effect of all relevant parameters must be taken into account. The
intermediate COCOMO model recognises this fact and refines the initial estimates.

The intermediate COCOMO model uses 15 factors that are multiplied with the initial
cost and effort estimates obtained from the basic COCOMO to appropriately scale those
up or down. For each such grading of a project parameter, he has suggested
appropriate cost drivers (or multipliers) to refine the initial estimates.

/ Product: The characteristics of the product that are considered include the
  inherent complexity of the product, reliability requirements of the product, etc.
/ Computer: Characteristics of the computer that are considered include the execution
  speed required, storage space required, etc.
/ Personnel: The attributes of development personnel that are considered include the
  experience level of personnel, their programming capability, analysis capability,
  etc.
/ Development environment: Development environment attributes capture the development
  facilities available to the developers. An important parameter that is considered
  is the sophistication of the automation (CASE) tools used for software development.

== STAGE 3: Complete COCOMO

A major shortcoming of both the basic and the intermediate COCOMO models is that they
consider a software product as a single homogeneous entity. However, most large
systems are made up of several smaller sub-systems. These sub-systems often have
widely different characteristics.Some sub-systems may be considered as organic type,
semidetached, or embedded. Not only may the inherent development complexity of the
subsystems be different, but for some subsystem the reliability requirements may be
high, for some the development team might have no previous experience of similar
development, and so on. The cost to develop each sub-system is estimated separately,
and the complete system cost is determined as the subsystem costs. This approach
reduces the margin of error in the final estimate.

#pagebreak()

= COCOMO 2
Since the time that COCOMO estimation model was proposed in the early 1980s, software
development has changed a lot. The present day software projects are much larger in
size and reuse of existing software to develop new products have become popular.
Agile development has become popular in preference over waterfall-based models.
Present day software products are highly interactive and support elaborate graphical
user interface. To make COCOMO suitable in the changed scenario, Boehm proposed
COCOMO 2.

In COCOMO 2, the estimations can be done with increasing accuracy as the project
progresses with time and more information about the project become available. The
estimations with increasing accuracy can help the project manager to refine the plans
and make more accurate plans as the project progresses. At the feasibility study
stage, the project manager makes rough estimation and the estimates can vary
significantly. The actual estimate would lie between the upper bound and lower
bounds. Estimates are made based on three parameters that are determined by the
project manager.

/ Application composition model: This model as the name suggests, can be used to
  estimate the cost for prototype development. We had already discussed in Chapter 2
  that a prototype is usually developed to resolve user interface issues.
/ Early design model: This supports estimation of cost at the architectural design
  stage.
/ Post-architecture model: This provides cost estimation during detailed design and
  coding stages.

#figure(image("assets/cocomo2.svg", width: auto))

#pagebreak()

= V MODEL

A popular development process model, V-model is a variant of the waterfall model. As
is the case with the waterfall model, this model gets its name from its visual
appearance. In this model verification and validation activities are carried out
throughout the development life cycle, and therefore the chances bugs in the work
products considerably reduce. This model is therefore generally considered to be
suitable for use in projects concerned with development of safety-critical software
that are required to have high reliability. There are two main phases: development
and validation phases.

== When to use

- / Traceability of Requirements: The V-Model proves beneficial in situations when
    it's imperative to create precise traceability between the requirements and their
    related test cases.
- / Complex Projects: The V-Model offers a methodical way to manage testing
    activities and reduce risks related to integration and interface problems for
    projects with a high level of complexity and interdependencies among system
    components.
- / Waterfall-Like Projects: Since the V-Model offers an approachable structure for
    organizing, carrying out, and monitoring testing activities at every level of
    development, it is appropriate for projects that use a sequential approach to
    development, much like the waterfall model.
- / Safety-Critical Systems: These systems are used in the aerospace, automotive, and
    healthcare industries. They place a strong emphasis on rigid verification and
    validation procedures, which help to guarantee that essential system requirements
    are fulfilled and that possible risks are found and eliminated early in the
    development process.

#figure(image("assets/vmodel.svg", width: 80%))

== V-model vs waterfall model

V-model can be considered to be an extension of the waterfall model. But in contrast
to the iterative waterfall model where testing activities are confined to the testing
phase only, in the V-model testing activities are spread over the entire life cycle.
Development and validation activities proceed hand in hand.

== Advantages

- Simple and easy to understand and use.
- This model focuses on verification and validation activities early in the life
  cycle thereby enhancing the probability of building an error-free and good quality
  product.
- Since test cases are designed when the schedule pressure has not built up, the
  quality of the test cases are usually better.
- The V-Model places a strong emphasis on testing, which helps to ensure the quality
  and reliability of the software.
- Testing activities are carried out in parallel with the development activities.
  Therefore, this model usually leads to a shorter testing phase and an overall
  faster product development as compared to the iterative model.
- The test team is busy throughout the development cycle
- In the V-model, the test team is associated with the project from the beginning.
  Therefore they build up a good understanding of the development artifacts, and this
  in turn, helps them to carry out effective testing of the software.

== Disadvantages

Being a derivative of the classical waterfall model, this model inherits most of the
weaknesses of the waterfall model.

- The V-Model is a linear and sequential model, which can make it challenging to
  adapt to changing requirements or unforeseen events.
- The V-Model can be time-consuming, as it requires a lot of documentation and
  testing.
- It is not good for complex and object-oriented projects.
- It is not suitable for projects where requirements are not clear and contain a high
  risk of changing.
- This model does not support iteration of phases.
- The V-Model places a strong emphasis on documentation, which can lead to an over
  reliance on documentation at the expense of actual development work.

#pagebreak()

= SRS

A Software Requirements Specification (SRS) is a comprehensive document that
describes exactly what a software system is supposed to do and how it is expected to
perform. Think of it as a blueprint or a contract between the business stakeholders
(who want the software) and the development team (who will build it). By clearly
outlining all the features and constraints before coding begins, the SRS ensures that
everyone has the same vision for the final product.

The primary goal of an SRS is to provide a "single source of truth" for the project.
From a management perspective, it serves several critical functions:
/ Clear Communication: It translates vague business ideas into specific technical
  instructions so developers, testers, and designers all understand the goals.
/ Project Planning: It allows managers to estimate the time, budget, and resources
  needed to complete the project.
/ Risk Reduction: By defining everything upfront, it helps identify potential
  problems or contradictions before they become expensive mistakes during
  development.
/ Verification: It provides a baseline for the Quality Assurance (QA) team to test
  against. If the software doesn't do what is in the SRS, it isn't finished.

== Contents of SRS

While the structure can vary, a professional SRS document typically includes the
following sections:
/ Introduction: Defines the purpose of the software, the intended audience, and the
  overall scope (what the software will and will not do).
/ Overall Description: Provides context, such as how the software fits into a larger
  system, user characteristics, and any general assumptions or constraints.
/ Functional Requirements: A detailed list of the specific actions the system must
  perform (e.g., "The system shall allow users to upload a profile picture").
/ Non-Functional Requirements: Describes the quality of the system, such as speed,
  security, and reliability (e.g., "The login page must load in under 2 seconds").
/ External Interface Requirements: Explains how the software will interact with
  people, other hardware, or other software systems (like payment gateways or
  databases).

== Use of SRS

Every member of a software project relies on the SRS for different reasons:
/ Customers/Stakeholders: To ensure the development team understands their business
  needs.
/ Project Managers: To track progress and ensure the team stays within the
  agreed-upon scope.
/ Developers: To know exactly what features to build and what logic to implement.
/ Testers (QA): To write test cases that prove the software works as intended.

In summary, the SRS is the foundation of any successful software project. Without it,
projects often suffer from "scope creep" (adding too many unplanned features), budget
overruns, and finished products that don't actually solve the user's problems.

#pagebreak()

= FUNCTIONAL REQUIREMENT

A good SRS document, should properly categorize and organise the requirements into
different sections. The important categories of user requirements are: functional and
non-functional requirements.

In software engineering, a functional requirement defines a specific behavior,
service, or function that a system must be able to perform. It describes what the
system should be able to do. Functional requirements are written along with the
corresponding input and output data set. Functional requirements are a crucial part
of the SRS document. In an SRS document, these act as the blueprint for the
developers, explaining the core features that must be built for the software to be
considered complete.

Each requirement typically includes:
- / Input: data the user provides
- / Behavior: processing or logic the software applies to that input
- / Output: end result provided by the software

They provide several key benefits. They help the team understand the boundaries of
the project. If a feature isn't listed as a functional requirement, it is "out of
scope" and won't be built. They ensure that the business stakeholders (the people
paying for the software) and the technical team are on the same page regarding what
is being delivered.

While functional requirements focus on "what" the system does, non-functional
requirements focus on "how" it performs. For example, "the system must allow a user
to log in" is functional, while "the login process must take less than two seconds"
is non-functional (performance). Both are necessary in an SRS document, but
functional requirements represent the core utility of the product.

#figure(image("assets/funcs.svg", width: auto))

#pagebreak()

= COHESION AND COUPLING

important metrics used to judge the quality of a system's design. determine how easy
it will be for your team to maintain, scale, and test the software. best is High
Cohesion and Low Coupling.

/ Faster Development: With High Cohesion, developers find code exactly where they
  expect it to be. With Low Coupling, different teams can work on different modules
  at the same time without stepping on each other's toes
/ Easier Testing: If a module is highly cohesive and loosely coupled, you can test it
  in isolation. You don't need to boot up the entire system just to check if the "Tax
  Calculator" works
/ Lower Technical Debt: High-quality design prevents "spaghetti code." When you need
  to replace an old library or upgrade a database, low coupling ensures the "blast
  radius" of that change is small
/ Re-usability: A highly cohesive module is like a Lego brick; it's easy to pick up
  and use in a completely different project because it doesn't bring a mountain of
  dependencies with it

== Cohesion

Cohesion refers to how closely the tasks inside a single module (or class/component)
are related to one another. It measures the "unity" of the module. If a module does
one thing and does it well, i.e. all the code inside it is focused on a single
purpose, it is highly cohesive. For example, a "PaymentProcessor" module should only
contain logic for processing payments. But if it does many unrelated things it is low
cohesion. Example: If your "PaymentProcessor" also handles user profile updates and
sends email newsletters, it has low cohesion.

== Types of cohesion

- / Functional: module contributes to a single, well-defined task
- / Sequential: The output of one part is the input for the next
- / Communicational: Parts are grouped because they use the same data
- / Procedural: grouped because they must happen in a specific order
- / Temporal: Parts are grouped because they happen at the same time
- / Logical: parts do similar things but are actually different
- / Coincidental: Parts are grouped loosely or randomly

#figure(image("assets/cohesion.svg"))

== Coupling

Coupling refers to how much one module relies on another module to work properly. It
measures the "strength of the connection" between different parts of the system. If
modules are independent, i.e. you can change the code in Module A without worrying
that it will break Module B, that means it has Low Coupling. If modules are tightly
"knotted" together and Changing one small thing in a database module might cause a
crash in the user interface module because they are too interconnected then it is
highly coupled

== Types of coupling

- / None: Modules have no relationship at all
- / Data: Modules communicate by passing simple data as arguments
- / Stamp: Modules share a complex data structure
- / Control: One module tells another what to do
- / Common: Multiple modules share the same global variables or data.
- / Content: One module directly reaches inside another module to change its
  private data or code.

#figure(image("assets/coupling.svg"))

#pagebreak()

= SPIRAL MODEL

The Spiral Model is a sophisticated, risk-driven software development process. It
combines the structured, step-by-step nature of the Waterfall model with the
repetitive, iterative nature of Prototyping.

The name comes from how the project starts small and gradually "spirals" outward.
Each loop of the spiral represents a phase of the development process. As the project
progresses through more loops, it becomes more detailed, more expensive, and closer
to completion.

/ Large-scale projects: When the project is massive and expensive, you cannot afford
  to wait until the end to find a mistake
/ High-risk projects: When the technology is new or the requirements are very complex
/ Projects with unclear requirements: helpful when requirements are complicated and
  ambiguous
/ Frequent Release: utilized when frequent releases are necessary


#table(
  columns: (50%, 50%),
  [
    1. / Objective Setting:
    The objectives are investigated, elaborated, and analysed. Based on this, the
    risks involved in meeting the phase objectives are identified. In this quadrant,
    alternative solutions possible for the phase under consideration are proposed
  ],
  [
    2. / Risk Analysis:
    The team looks for potential problems such as technical hurdles or budget issues
    that could cause the project to fail. They create prototypes to test if their
    ideas will actually work. the alternative solutions are evaluated to select the
    best possible solution.
  ],

  [
    4. / Review and Planning:
    The customer reviews the work done so far. Depending on this the team plans the
    next iteration of the spiral.
  ],
  [
    3. / Development & Testing:
    Once the risks are assessed, the team writes the code and tests it. Depending on
    the phase, this might result in a small prototype or a fully functional piece of
    software.
  ],
)
#figure(image("assets/spiral.svg", width: auto))

== Advantages

- / Risk Handling: The projects with many unknown risks that occur as the development
    proceeds, in that case, Spiral Model is the best development model to follow due
    to the risk analysis and risk handling at every phase.
- / Good for large projects: It is recommended to use the Spiral Model in large and
    complex projects.
- / Flexibility in Requirements: Change requests in the Requirements at a later phase
    can be incorporated accurately by using this model.
- / Customer Satisfaction: Customers can see the development of the product at the
    early phase of the software development and thus, they habituated with the system
    by using it before completion of the total product.
- / Iterative and Incremental Approach: The Spiral Model provides an iterative and
    incremental approach to software development, allowing for flexibility and
    adaptability in response to changing requirements or unexpected events.
- / Emphasis on Risk Management: The Spiral Model places a strong emphasis on risk
    management, which helps to minimize the impact of uncertainty and risk on the
    software development process.
- / Improved Communication: The Spiral Model provides for regular evaluations and
    reviews, which can improve communication between the customer and the development
    team.
- / Improved Quality: The Spiral Model allows for multiple iterations of the software
    development process, which can result in improved software quality and
    reliability.

== Disadvantages

- / Complex: The Spiral Model is much more complex than other SDLC models.
- / Expensive: Spiral Model is not suitable for small projects as it is expensive.
- / Too much dependability on Risk Analysis: The successful completion of the project
    is very much dependent on Risk Analysis. Without very highly experienced experts,
    it is going to be a failure to develop a project using this model.
- / Difficulty in time management: As the number of phases is unknown at the start of
    the project, time estimation is very difficult.
- / Complexity: The Spiral Model can be complex, as it involves multiple iterations
    of the software development process.
- / Time-Consuming: The Spiral Model can be time-consuming, as it requires multiple
    evaluations and reviews.
- / Resource Intensive: The Spiral Model can be resource-intensive, as it requires a
    significant investment in planning, risk analysis, and evaluations.


#pagebreak()

= PROTOTYPING MODEL

The Prototype Model is a Software Development approach useful for projects with vague
or changing requirements. It involves creating a preliminary version of the software
product, called a prototype, that shows the basic features and functionality that the
customers want. The prototype is then tested and improved by the customers and the
developers until the customers are happy with the final prototype, which forms the
basis for the final product.

== Steps

+ / Requirements gathering and analysis: Requirement analysis is the first step in
    developing a prototyping model. During this phase, the system’s desires are
    precisely defined. During the method, system users are interviewed to determine
    what they expect from the system.
+ / Quick design: The second phase could consist of a preliminary design or a quick
    design. During this stage, the system’s basic design is formed. However, it is
    not a complete design. It provides the user with a quick overview of the system.
    The rapid design aids in the development of the prototype.
+ / Build a Prototype: During this stage, an actual prototype is intended to support
    the knowledge gained from quick design. It is a small low-level working model of
    the desired system.
+ / Initial user evaluation: The proposed system is presented to the client for
    preliminary testing at this stage. It is beneficial to investigate the
    performance model’s strengths and weaknesses. Customer feedback and suggestions
    are gathered and forwarded to the developer.
+ / Refining prototype: If the user is dissatisfied with the current model, you may
    want to improve the type that responds to user feedback and suggestions. When the
    user is satisfied with the upgraded model, a final system based on the approved
    final type is created.
+ / Implement Product and Maintain: The final system was fully tested and distributed
    to production after it was developed to support the original version. To reduce
    downtime and prevent major failures, the programmer is run on a regular basis.

#figure(image("assets/prototyping.svg"))

== Advantages

- / Quicker user feedback: helps you to achieve better software development solutions
- / Customer Satisfaction: seeing partial product gives more satisfaction
- / Early Detection: of errors saving a lot of effort and cost
- / Easy to Change: requirements can be easily accommodated
- / Missing functionalities: can be easily figured out
- / Re-usability: prototype can be reused in the future
- / Flexibility: in design changes
- / Communication: Helps team member to communicate effectively
- / Easy to Understand: It is a straightforward model
- / Easily Discarded: Prototypes can be changed and even discarded

== Disadvantages

- / Costly: concerning time and money
- / Too much Variation: in requirement each time the prototype is reviewed
- / Poor Documentation: due to continuously changing customer requirements
- / Implementing all Demands: can difficult for developers
- / Unknown iterations: that would be required before the prototype is accepted
- / Hurry Developers: may end up with sub-optimal solutions
- / Loss in Interest: if they are not satisfied with the initial prototype
- / Representation: prototype may not accurately represent the final product
- / Focus on Prototype: development may shift away from the final product
- / False sense of Completion:
- / Change at Final Stage: in technical feasibility and scalability
- / Change in Tools:

#pagebreak()

= CYCLOMATIC COMPLEXITY

Cyclomatic complexity, developed by Thomas McCabe, is a metric that measures the
complexity of a program by counting its decision points. It measures the number of
unique paths through the code, indicating how complex the logic is. Lower complexity
suggests simpler, more manageable code, reducing the chances of errors and making it
easier to maintain and modify. Essentially, it helps assess the code's readability
and risk associated with changes.

The cyclomatic complexity of a code section is the quantitative measure of the number
of linearly independent paths in it. It is a software metric used to indicate the
complexity of a program. It is computed using the control flow graph of the program.
The nodes in the graph indicate the smallest group of commands of a program, and a
directed edge in it connects the two nodes i.e. if the second command might
immediately follow the first command.

For example, if the source code contains no control flow statement then its
cyclomatic complexity will be 1, and the source code contains a single path in it.
Similarly, if the source code contains one if condition then cyclomatic complexity
will be 2 because there will be two paths one for true and the other for false.

Given a control flow graph G of a program, the cyclomatic complexity V (G) can be
computed as:
$ V (G) = E − N + 2 $

== Uses

- Determining the independent path executions thus proven to be very helpful for
  Developers and Testers.
- It can make sure that every path has been tested at least once.
- Thus help to focus more on uncovered paths.
- Code coverage can be improved.
- Risks associated with the program can be evaluated.
- These metrics being used earlier in the program help in reducing the risks.

== Advantages

- It can be used as a quality metric, given the relative complexity of various
  designs.
- It is able to compute faster than Halstead's metrics.
- It is used to measure the minimum effort and best areas of concentration for
  testing.
- It is able to guide the testing process.
- It is easy to apply.

== Disadvantages

- It is the measure of the program's control complexity and not the data complexity.
- In this, nested conditional structures are harder to understand than non-nested
  structures.
- In the case of simple comparisons and decision structures, it may give a misleading
  figure.

== Example

#figure(image("assets/cfd.svg"))

$ "Cyclomatic complexity" = 7 − 6 + 2 = 3 $

#pagebreak()

= TESTING

#figure(image("assets/testing.svg"))

== Unit testing

Unit testing is undertaken after coding of a module is complete, all syntax errors
have been removed, and the code has been reviewed. This activity is typically
undertaken by the coder of the module himself in the coding phase. Before carrying
out unit testing, the unit test cases have to be designed and the test environment
for the unit under test has to be developed. In this section, we first discuss the
environment needed to perform unit testing.

== Integration testing

== System testing
