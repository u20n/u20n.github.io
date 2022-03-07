---
title: headaches but with gravity
date: 2022-03-06
tags: math, physics
status: incomplete
---

#### this document contains various notes on essentially astrophysics

In the pursuit of a $\underline{workable}$ platform to simulate an approximate universe, obviusly a very large endevor, I seek to understand and condense the interactions between bodies in space, and forumalte it to a set of functions and variables to represent any encounter between two bodies in space.

**the very, very, basics**

Actually *accurately* simulating the entire universe is a foolish task. All bodies of some mass have impact on the movements of the others. While discounting this below a certain threshold; ex. $x : \{x \nless \lfloor t - z\rfloor \}$, where $x$ is some force, $t$ is some threshold, and $z$ is gravitational force of some body, might be worthwhile, eventually the small differences would create a slip.

How then, to account for this slip? I have no idea.

One way to account for this would be taking the greastest of set $Nx$, where 
$$e : Nx \implies e : \begin{cases} e \notin x\\ e \exists! \in Nx \\e = max\{Nx\} \end{cases}$$  and including $e$ in each subsequent calculation. This however, just pushes the slip one level down; there's now a slip in threshold each calculation and no real improvement of the situation.



**time, and other fun nuances**

Given that Einsteinian physics is a cooler system, time is going to be considered with this simulation. To help myself visualize the 4th dimension, and to succinctly explain my rationale, a $\underline{simple}$ metaphor will be used. Imagine, if you will, the 4th dimension as a photo camera. A still frame is taken of the 3rd dimension[^still]; these images, overlaid in order, become a body's experience of the 4th dimension. Time, in this system, exists as the frame-rate of the camera; the closer to light speed a body is, the slower its relative time. In our metaphor, this would be represented as the gaps between each frame.



[^still]: Without the 4th dimension, the 3d dimension has no concept of time, so it kind of just exists without concrete, well, time. Taking a still requires the concept of time (via reflection), and so I consider this precis valid, while admittedly marginally confusing.