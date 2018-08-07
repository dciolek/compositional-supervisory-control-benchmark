# compositional-supervisory-control-benchmark
Benchmark of compositional supervisory control problems.

The benchmark contains six problems, three classical to supervisory control (used in the [9th International Workshop on Discrete Event Systems](http://www.diee.unica.it/giua/WODES/WODES08/pages/benchmark.php)), and three inspired in existing literature. We focus on case studies that are scalable. In particular, we choose problems that scale up in two different directions. The number of intervening components scales with parameter _n_ and the number of states per component scales with parameter _k_. Furthermore, we include cases that are not realizable for some combination of parameters.

For each problem we vary parameters _n_ and _k_ independently between 1 and 6. Hence, we include 36 input files per case study, for the following formats:
  1. FSP: Finite State Process as supported by [Modal Transition System Analyzer (MTSA)](http://mtsa.dc.uba.ar/).
  2. XML: As supported by [SUPREMICA](https://supremica.org/).
  3. SMV: format for CTL formulas as supported by [MBP](http://mbp.fbk.eu/).
  4. SLUGSIN: LTL formulas as supported by [SLUGS](https://github.com/VerifiableRobotics/slugs).
  5. PDDL: Planning Domain Definition Language for Fully Observable Non-deterministic (FOND) planning problems as supported by [MYND](https://bitbucket.org/robertmattmueller/mynd) and [PRP](https://bitbucket.org/haz/planner-for-relevant-policies/wiki/Home).

## Transfer Line
The Transfer Line (TL), first introduced by Wonham, is one of the most traditional examples in supervisory control.
This case study is representative of the automated manufacturing domain, which is a common domain of interest for supervisory control.

The TL consists of _n_ machines M(1), ..., M(n) connected by _n_ buffers B(1), ..., B(n) with finite capacity _k_ and ending in an additional machine called Test Unit (TU). A machine M(i) takes work pieces from the buffer B(i-1) (with the exception of machine M(1) that takes the work pieces from the outside world). And after an undetermined amount of time, the working machine M(i) outputs a processed work piece through buffer B(i). Finally, when a work piece reaches the TU it can be accepted and taken out of the system or it can be rejected and placed back in buffer B(1) for reprocessing.

The goal of the system is to process elements avoiding buffer overflows and underflows. The system controls when to input an element from buffer B(i-1) into machine M(i) (assuming infinite supply from the outside world for i = 0); whereas the output from machine M(i) into buffer B(i) is uncontrollable. A catastrophic error ensues if a machine tries to take a work piece from an empty buffer or if it tries to place a processed work piece in a full buffer.

## Dining Philosophers
The Dinning Philosophers (DP) case study is a classic concurrency problem where _n_ philosophers sit around a table sharing one fork with each adjacent philosopher. The goal of the system is to control the access to the forks allowing each philosopher to alternate between eating and thinking (i.e., avoiding deadlock and starvation). Additionally, after grabbing a fork a philosopher needs to take _k_ intermediate etiquette steps before eating.

We model philosophers and forks as a individual processes (i.e., automata). The only controllable events allow a philosopher to take one fork located adjacent to his position. Marked states are those where philosophers have eaten. The problem has no solution when _n_ = 1 since there is only one fork on the table.

## Cats and Mice
The Cat and Mouse (CM) case study is a simple game where _n_ cats and _n_ mice are placed in opposite ends of a corridor divided in _2k+1_ areas. They take turns to move to one adjacent area at a time, with mice moving first. The goal of the system is to control the movement of mice in order to avoid sharing an area with a cat (the movements of cats are uncontrollable). In the center of the corridor there is a mouse hole, allowing the mice to share the area with the cats safely. Thus, a winning strategy for the mice requires all of them to be always closer to the mouse hole than any cat, in order to be able to evade them.

We model cats and mice with independent processes, where the only controllable events are the movement of mice. Additionally, we use an auxiliary automaton which keeps track of states where a cat and a mouse have been in the same area. Marked states are those where no mouse has shared an area with a cat, except for the central area which is safe for the mice.

## Bidding Workflow
The Bidding Workflow (BW) case study models a company that evaluates projects in order to decide whether to bid for them or not. In order to do this, a document describing a project needs to be accepted by _n_ teams with different specializations. The goal is to synthesize a workflow that attempts to reach consensus, that is, approving the document when all teams accept it, and discarding it when all teams reject it. The document can be reassigned to a team that has rejected it up to _k_ times for revision, but it must not be reassigned to a team that has already accepted it. When a team rejects the document _k_ times it can be discarded even with no consensus. This case study represents a problem from the Business Process Management (BPM) domain.

We model the document and the teams with independent processes, where the only controllable events allow assigning the document to a given team for evaluation. We mark states where the document has been approved or discarded. Note that the document process may enter a deadlock if it is approved or discarded without reaching a consensus (or before obtaining _k_ rejections from the same team). Therefore, illegal closures prevent reaching a marked state from that point forward, and hence violating the non-blocking objective.

## Air-Traffic
The Air-Traffic Management (AT) case study represents an airport control tower that receives up to _n_ simultaneous requests from planes trying to land. The tower needs to signal planes whether it is safe to approach the landing ramp or at which of _k_ air-spaces they must perform holding maneuvers. If two planes enter the same ramp or air-space a crash may occur. The goal is to control the air-traffic guaranteeing that all the planes can land safely. Notably, the problem only admits solutions when _k > n_, since if there are more landing requests than air-spaces where to hold planes, there is no certain way to avoid a crash.

We model airplanes with processes, where controllable events signal permissions to descend to a certain height or to approach the landing ramp. We use auxiliary automata to keep track of the usage of the ramp and the air-spaces, observing a crash if it occurs. We mark states where airplanes have landed safely.

Note that in this example we make the simplifying assumption that planes have infinite fuel. This allows us to accept supervisors not guaranteeing landings in a bounded amount of steps. Still, the stronger requirement of effectively guaranteeing landings within a given number of steps could be modeled by considering additional automata in the composition.

## Travel Agency
The Travel Agency (TA) case study represents an on-line service that sells vacation packages by relying on existing third-party web-services for different amenities (e.g. car rental, flight purchase, hotel booking, etc.) The goal of the system is to orchestrate the web-services in order to provide a complete vacation package when possible, while avoiding to pay for incomplete packages. This example is representative of the web-service composition problem.

The agency receives requests for vacation packages and interacts with _n_ different web-services for the provision of individual amenities. The protocols for the services may vary (uncontrollably). One variant is the selection of up to _k_ attributes (e.g. flight destination, dates, and class). Another variant in service protocols is that some services may require a reservation step which guarantees a purchase order for a short period, while others do not, and hence the purchase may fail (e.g. on low availability, reservation may be disabled in order to maximize concurrency between clients, and as a result a race condition between two purchase orders may make one fail).

