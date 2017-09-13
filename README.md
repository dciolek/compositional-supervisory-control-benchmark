# compositional-supervisory-control-benchmark
Benchmark of compositional supervisory control problems.

The benchmark contains six problems, three classical to supervisory control (used in the [9th International Workshop on Discrete Event Systems](http://www.diee.unica.it/giua/WODES/WODES08/pages/benchmark.php)), and three inspired in existing literature. We focus on case studies that are scalable. In particular, we choose problems that scale up in two different directions. The number of intervening components scales with parameter _n_ and the number of states per component scales with parameter _k_. Furthermore, we include cases that are not realizable for some combination of parameters.

For each problem we vary parameters _n_ and _k_ independently between 1 and 6. Hence, we include 36 input files per case study, for the following formats:
  1. FSP: Finite State Process as supported by [Modal Transition System Analyzer (MTSA)](http://mtsa.dc.uba.ar/).
  2. XML: As supported by [SUPREMICA](https://supremica.org/).
  3. PDDL: Planning Domain Definition Language for Fully Observable Non-deterministic (FOND) planning problems as supported by [MYND](https://bitbucket.org/robertmattmueller/mynd) and [PRP](https://bitbucket.org/haz/planner-for-relevant-policies/wiki/Home).
  4. XLTL: XML format of LTL formulas as supported by [RATSY](http://rat.fbk.eu/ratsy/index.php/Main/HomePage).
  5. SLUGSIN: LTL formulas as supported by [SLUGS](https://github.com/VerifiableRobotics/slugs).

## Transfer Line
The Transfer Line (TL), first introduced by Wonham, is one of the most traditional examples in controller synthesis.

The TL consists of series of machines M(1), M(2), ... , M(n) connected by buffers B(1), B(2), ... , B(n) and ending in a special machine called Test Unit (TU). A machine M(i) takes work pieces from the buffer B(i−1) (with the exception of machine M(1) that takes the work pieces from the outside). After an undetermined amount of time, the working machine M(i) outputs a processed work piece through buffer B(i). Finally, when a work piece reaches the TU it can be accepted and taken out of the system or it can be rejected and placed back in buffer B(1) for reprocessing.

The only controllable events in this case study are the taking of work pieces. An error ensues if a machine tries to take a work piece from an empty buffer or if it tries to place a processed work piece in a full buffer. One of the goals for the controller is to avoid the events that lead to errors, the other goal is to reach a state where a processed work piece can be accepted or rejected. We do not require the controller to achieve accepted pieces as acceptance and rejection are not decided by the controller.

The case study can be scaled in three directions:
  1. Machines (_n_): number of interconnected machines.
  2. Capacity (_k_): maximum number of work pieces a machine can process

## Dining Philosophers
The classic problem where philosophers sit around a table share one fork with each adjacent philosopher. The goal is to control the access to the forks avoiding a deadlock and allowing each philosopher to alternate between eating and thinking while performing required intermediate etiquette steps.

The problem scales in two directions:
  1. Philosophers (_n_): The number of philosophers.
  2. Steps (_k_): The number of etiquette steps.

## Cats and Mice
Cats and mice are placed in oposite ends of a corridor divided in cells. They move one cell at a time by turns (first the mice then the cats). The goal is to control the mice in order to reach the center of the corridor while avoiding sharing a cell with a cat.

The problem scales in two dimensions:
  1. Criters (_n_): The number of cats and mice.
  2. Levels (_k_): The number of cells in the corridor (2*k+1).

## Air-Traffic
An airport control tower receives requests from planes trying to land. The tower needs to signal them when it is safe to approach the ramps and at which height they must perform holding maneuvers. If two airplanes enter the same height space or ramp there is a chance a crash may occur.

We want a controller that automatically responds to airplanes requests and ensures safe usage of the airport space.

The case study can be scaled in the following dimensions:
  1. Planes (_n_): maximum number of simultaneous land requests.
  2. Height (_k_): number of spaces above the ground where a plane can hold safely.

## Bidding Workflow
An engineering company evaluates projects in order to decide which ones to bid for. For this a document describing the project needs to be accepted by the company's engineering teams. If all the teams accept it, the document is approved. It is discarded if all teams reject it.

There is a need for a workflow that can cope with the requests. We synthesize a controller that acts as an enforcer for an emerging workflow that guarantees:
  * A document can be reassigned to a team that has rejected it.
  * A document cannot be reassigned to a team that has already accepted it.
  * Only when a team rejects it after (all possible) re-evaluation can the document be rejected without consensus.

The case study can be scale in two directions:
  1. Teams (_n_): The number of engineering teams.
  2. Steps (_k_): The (maximum) number of evaluation steps a team can perform.

## Travel Agency
A travel agency sells vacation packages on-line by orchestrating existing third-party web-services for different amenities (e.g. car rental, flight purchase, hotel booking, etc). We want to synthesize an orchestrator based on the requirements for the provision of vacation packages and the protocol specification of the web-services.

The protocols for the services may vary, one variant is the number of steps required for querying availability; in some cases the process requires a multiple steps (e.g. querying for flight destination and dates, and if successful following with a selection for class). Another variant is that some services may require a reservation step which guarantees a purchase order for a short period, while others do not, and hence the purchase may fail (e.g. on low availability reservation may be disabled in order to maximize concurrency between clients. As a result a race condition between two purchase orders may arise, and therefore one order will fail).

The example scales in the following dimensions:
  1. Amenities (_n_): The number of amenities included in the package.
  2. Steps (_k_): The maximum number of steps requierd to query a service.
