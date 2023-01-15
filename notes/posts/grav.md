---
heading: simulating bodies
file: uni
ext: sim
published: 2022-04-14
tags: math, physics, astro
status: incomplete
---
### Overview
In the pursuit of a workable platform to simulate an approximate universe, obviously a very large endeavor, I seek to understand and condense the interactions between bodies in space, and formulate it to a set of functions and variables to represent any encounter between two bodies in space. Actually *accurately* simulating the entire universe is a foolish task. This is mainly presented as a thought exercise.

### Degradation of Accuracy and Acceptable Degrees
All bodies of some mass have impact on the movements of the others. While discounting this below a certain threshold might serve to reduce the overall complexity; $F_x \mid \{(F_x\prec b) \nless \lfloor b_z - t\rfloor \}$

> Where $x$ is some measure of influence[^smol], $t$ is some threshold, $z$ is relative gravitational force (in this context of $b$) taken at constant distance[^distance], and $F_x$ is a set of all influential bodies $b$, $\forall \space b \in B$. It is implied that $F_x \subset B$.

> *I take the influence as a floored number to reduce the possiblity of 'jumps' in attraction; scalling this floor to $10^x$ allows for degrees of accuracy. Regardless, the slip in accuracy is required for non head-spin-inducing numbers.*

This necessary exclusion of bodies would eventually create a slip in accuracy beyond the (acceptable) marginal degree. Another flaw is the inclusion of equal values of $x$ for $F_x \prec b$ and $b_x$; it may (dependent on contents of $B$) create a plateau of $F_x$, and given $\forall \space x \mid x \space \notin F_x$, a stable relational system[^eventually]. This is bad because it's boring.

---

It may make sense to impose some sense of *inherited* order on the actual count of bodies in the $F_x$ set, but that would only push the slip further down, rather than solve it. Almost all solutions have this slip, and hence we must account for the degradation of accuracy, and the acceptable degrees of error.

Ensuring sane degrees of accuracy necessitates consideration of appropriate scope; if at great enough distance that $F_x$ begins to exclude bodies and thus create $N_x \mid B_x \notin F_x$, the entire gravitation force of $F_x$ becomes monolithic (when considered against other bodies, including other $F_x$).
One way to retain the 'naturality' of the generation of $F_x$ would be to scope interactions of $b \in F_x$ as $b \in N_x$, but within the monolithic form of $F_x$; e.g. $F_x(b) \to B(F_x) \mid \{F_x(b)\dots\}$.

----
This is the problem with binary generation of 'valid' bodies; the necessary exclusion of other bodies creates either a slip in the criteria (see above), or a series of monolithic gravitational zones that operate mainly as closed systems. Unfortunately, from my very small amount of research on the subject, it seems the latter is the more realistic scenario. 

Unfortunately, (besides introducing time, which is the next section), restricting to a 'reasonable' universe means this is the extent of the fun stuff. We can still do interactions within these monolithic zones of influence.

### Time as an Influence 
Given that Einsteinian physics is a cooler system[^trustme], time is going to be considered with this simulation. To help myself visualize the 4th dimension, and to succinctly explain my rationale, a *simple* metaphor will be used[^flame]. Imagine, if you will, the 4th dimension as a photo camera. A still frame is taken of the 3rd dimension[^still]; these images, overlaid in order, become a body's experience of the 4th dimension. Time, in this system, exists as the frame-rate of the camera; the closer to light speed a body is, the slower its relative time. In our metaphor, this would be represented as the gaps between each frame.

---
**Footnotes**

[^trustme]: (Source: Trust me bro)
[^distance]: This (really) should be the distance between $F_x \prec b$ and $b$.
[^smol]: This can also be considered the index of any $b$; given that $F_x$ is sorted.
[^eventually]: This is a little misleading; if the relational force is the same across the entire system, nothing will ever move out of the *perfect* sequence in any substantial way without external force.
[^flame]: Not exactly incredibly accurate; your millage may vary.
[^still]: Without the 4th dimension, the 3d dimension has no concept of time, so it kind of just exists without concrete, well, time. Taking a still requires the concept of time (via reflection), and so I consider this precis valid, while admittedly marginally confusing.
