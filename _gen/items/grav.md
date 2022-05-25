---
title: headaches w/ gravity
abrv-title: uni.sim
published: 2022-04-14
tags: math, physics, astro
status: incomplete
---

### Section List
- overview & necessary disclaimer
- degredation of accuracy and acceptable degrees
	- interactions of the 3D
	- physical interactions between bodies
	- acceptable degrees of error
- time as an influence
	- time as a meter
	- 4d in its interactions with the aforementioned 3d system

### Overview
In the pursuit of a $\underline{\text{workable}}$ platform to simulate an approximate universe, obviously a very large endeavor, I seek to understand and condense the interactions between bodies in space, and formulate it to a set of functions and variables to represent any encounter between two bodies in space. Actually *accurately* simulating the entire universe is a foolish task. This is mainly presented as a thought exercise.

### Degradation of Accuracy and Acceptable Degrees
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

This, predictably, just pushes the slip in accuracy one level down; there's now a slip of threshold in each calculation[^slip] and no real improvement of the situation. 

> (But if you can't see the problem than it's fixed, right?)

This just means that for enough $e$, $N_x \subseteq F_x$[^slip].

---- 

It may make sense to impose some sense of *inherited* order on the actual count of bodies in the $F_x$ set, but that would, like the set of $N_x$, only push the slip further down, rather than solve it. Almost all solutions have this slip, and hence we must account for the degradation of accuracy, and the acceptable degrees of error.

One solution I'm considering is the creation of zones of attraction between sets of $F_x$. Creating a sorted 3 dimensional vector of all sets of $F_x$ could enable the pseudo sorting of these zone of attraction without actually attaching any explicit tag to each set.

> But wait, that's just what everyone else does.[^theysay]

Ensuring sane degrees of accuracy necessitates consideration of appropriate scope; if at great enough distance that $F_x$ begins to exclude bodies and thus create $N_x$, the entire gravitation force of $F_x$ becomes monolithic (when considered against other bodies (including other $F_x$)).
One way to retain the 'naturality' of the generation of $F_x$ would be the connection of $t$ to something related to the count of objects in $F_x$ or maybe the index in the 3 dimensional vector. (I'm still not sure)

----
This is the problem with binary generation of 'valid' bodies; the necessary exclusion of other bodies creates either a slip in the criteria (see above), or a series of monolithic gravitational zones that operate mainly as closed systems. Unfortunately, from my very small amount of research on the subject, it seems the latter is the more realistic scenario. 

This does mean most of the fun is sucked out of the exercise, but at least the micro of how exactly to interact smaller bodies (or particles, if we're literally micro) within these monolithic zones of influence. Oh, and we can spice things up with time.

##### Time as an Influence 
**...(and Willing Participant)**

Given that Einsteinian physics is a cooler system[^trustme], time is going to be considered with this simulation. To help myself visualize the 4th dimension, and to succinctly explain my rationale, a *simple* metaphor will be used[^flame]. Imagine, if you will, the 4th dimension as a photo camera. A still frame is taken of the 3rd dimension[^still]; these images, overlaid in order, become a body's experience of the 4th dimension. Time, in this system, exists as the frame-rate of the camera; the closer to light speed a body is, the slower its relative time. In our metaphor, this would be represented as the gaps between each frame.

[^trustme]: (Source: Trust me bro)
[^theysay]: *I don't know that, but I assume that it's the conclusion that others have also come to.*
[^slip]: Given that the threshold is being set and then ignored for one body each iteration, as the set of $N_x$ decreases, so does the legitimacy of the threshold. For enough bodies that have been excluded, the entirety of $N_x$ will either be empty or a subset of $F_x$. This could be solved by setting a hard limit on how many former $N_x$ bodies can populate $F_x$, but then you may as well just lower the threshold enough to consider those bodies in $F_x$ originally.
[^smol]: This can also be considered the index of any $b$; given that $F_x$ is sorted.
[^notation]: This notation is pretty spooky; essentially that there exists $\gt1$ of $x$ for all $x : F_x$.
[^eventually]: This is a little misleading; if the relational force is the same across the entire system, nothing will ever move out of the *perfect* sequence in any substantial way without external force.
[^sowhat]: This is bad because it's boring.
[^flame]: This disclaimer means you can't yell at me on twitter. Acceptance of this wavier of your right to flame me online will be the continued reading of this footnote.
[^still]: Without the 4th dimension, the 3d dimension has no concept of time, so it kind of just exists without concrete, well, time. Taking a still requires the concept of time (via reflection), and so I consider this precis valid, while admittedly marginally confusing.
