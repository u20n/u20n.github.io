---
title: headaches but with gravity
abrv-title: uni.sim
published: 2022-07-03
tags: math, physics
status: incomplete
---

#### this document contains various notes on essentially astrophysics

In the pursuit of a $\underline{\text{workable}}$ platform to simulate an approximate universe, obviously a very large endeavor, I seek to understand and condense the interactions between bodies in space, and formulate it to a set of functions and variables to represent any encounter between two bodies in space. Actually *accurately* simulating the entire universe is a foolish task. This is mainly presented as a thought exercise.

#### Section List
- degredation of accuracy and acceptable degrees
	- interactions of the 3D
	- physical interactions between bodies
	- acceptable degrees of error
- time as an influence
	- time as a meter
	- 4d in its interactions with the aforementioned 3d system
### Sections

**degredation of accuracy and acceptable degrees**

All bodies of some mass have impact on the movements of the others. While discounting this below a certain threshold might serve to reduce the overall complexity of the calculus; ex. $$F_x : \{x \nless \lfloor z - t\rfloor \}$$

$\small {\text{Where }x\text{ is some force, }t\text{ is some threshold, }z\text{ is gravitational force of }x\text{, and }F_x \text{ is a set of all influential bodies.}}$

This necessary exclusion of bodies would eventually create a slip in accuracy beyond the marginal degree.

*How then, to account for this slip? I have no idea.*

One way to account for this would be taking the greatest of set $N_x$, where 
$$e : N_x \implies e : \begin{cases} e \notin F_x\\ e \exists! \in N_x \\e = max\{N_x\} \end{cases}$$  and including $e$ in each subsequent calculation. This, however, just pushes the slip one level down; there's now a slip of threshold in each calculation and no real improvement of the situation.

It may make sense to impose some sense of order on the actual count of bodies in the $F_x$ set, but that would, like the set of $N_x$, only push the slip further down, rather than solve it. Almost all solutions have this slip, and hence we must account for the degradation of accuracy, and the acceptable degrees of error.

**time as an influence**

Given that Einsteinian physics is a cooler system, time is going to be considered with this simulation. To help myself visualize the 4th dimension, and to succinctly explain my rationale, a $\underline{\text{simple}}$ metaphor will be used. Imagine, if you will, the 4th dimension as a photo camera. A still frame is taken of the 3rd dimension[^still]; these images, overlaid in order, become a body's experience of the 4th dimension. Time, in this system, exists as the frame-rate of the camera; the closer to light speed a body is, the slower its relative time. In our metaphor, this would be represented as the gaps between each frame.



[^still]: Without the 4th dimension, the 3d dimension has no concept of time, so it kind of just exists without concrete, well, time. Taking a still requires the concept of time (via reflection), and so I consider this precis valid, while admittedly marginally confusing.