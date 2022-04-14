---
title: headaches w/ gravity
abrv-title: uni.sim
published: 2022-04-13
tags: math, physics, astro
status: incomplete
---

###### Section List
- overview & necessary disclaimer
- degredation of accuracy and acceptable degrees
	- interactions of the 3D
	- physical interactions between bodies
	- acceptable degrees of error
- time as an influence
	- time as a meter
	- 4d in its interactions with the aforementioned 3d system

##### Overview
In the pursuit of a $\underline{\text{workable}}$ platform to simulate an approximate universe, obviously a very large endeavor, I seek to understand and condense the interactions between bodies in space, and formulate it to a set of functions and variables to represent any encounter between two bodies in space. Actually *accurately* simulating the entire universe is a foolish task. This is mainly presented as a thought exercise.

##### Degradation of Accuracy and Acceptable Degrees
**... in a simulated system**

All bodies of some mass have impact on the movements of the others. While discounting this below a certain threshold might serve to reduce the overall complexity of the calculus; ex. $$F_x : \{(F_x\prec b) \nless \lfloor b_z - t\rfloor \}$$

> Where $x$ is measure of influence[^smol], $t$ is some threshold, $z$ is relative gravitational force of $b$ taken at constant distance, and $F_x$ is a set of all influential $b$, $\forall$ bodies $b$.
> *Note* While I take the influence as a floored number (assumed to $10^0$), any variation (the one I primarily consider is $\lfloor ... \rceil$) suffices; as long as it is constant across $x$.

This necessary exclusion of bodies would eventually create a slip in accuracy beyond the (acceptable) marginal degree. Another flaw is the inclusion of equal values of $x$ for $F_X \prec b$ and $b_x$; it may create a plateau of $F_x$, and given $\forall \space x: F_x \space \neg \exists!$[^notation], a \*shudder\* stable relational system[^eventually][^sowhat].

*How then, to account for this slip? I have no idea.*

> (What about pushing it down one layer?)

Create a set $N_x$ (not set for x), and take the greatest of that set, and then push it up to $F_x$.
$$e : N_x \implies e : \begin{cases} e \notin F_x\\ e \exists! \in N_x \\e \top\{N_x\} \end{cases}$$ 
$$ e \to F_x $$

This, predictably, just pushes the slip in accuracy one level down; there's now a slip of threshold in each calculation and no real improvement of the situation. 

> (But if you can't see the problem than it's fixed, right?)

This just means that for enough $e$, $N_x \subseteq F_x$.

---- 
It may make sense to impose some sense of *inherited* order on the actual count of bodies in the $F_x$ set, but that would, like the set of $N_x$, only push the slip further down, rather than solve it. Almost all solutions have this slip, and hence we must account for the degradation of accuracy, and the acceptable degrees of error.

##### Time as an Influence 
**...(and Willing Participant)**

Given that Einsteinian physics is a cooler system, time is going to be considered with this simulation. To help myself visualize the 4th dimension, and to succinctly explain my rationale, a *simple* metaphor will be used[^flame]. Imagine, if you will, the 4th dimension as a photo camera. A still frame is taken of the 3rd dimension[^still]; these images, overlaid in order, become a body's experience of the 4th dimension. Time, in this system, exists as the frame-rate of the camera; the closer to light speed a body is, the slower its relative time. In our metaphor, this would be represented as the gaps between each frame.

[^smol]: This can also be considered the index of any $b$; given that $F_x$ is sorted.
[^notation]: This notation is pretty spooky; essentially that there exists $\gt1$ of $x$ for all $x : F_x$.
[^eventually]: This is a little misleading; if the relational force is the same across the entire system, nothing will ever move out of the *perfect* sequence in any substantial way without external force.
[^sowhat]: This is bad because it's boring.
[^flame]: This disclaimer means you can't yell at me on twitter. Acceptance of this wavier of your right to flame me online will be the continued reading of this footnote.
[^still]: Without the 4th dimension, the 3d dimension has no concept of time, so it kind of just exists without concrete, well, time. Taking a still requires the concept of time (via reflection), and so I consider this precis valid, while admittedly marginally confusing.
