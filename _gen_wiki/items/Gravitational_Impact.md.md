---
title: headaches but with gravity
date: 2022-03-06
tags: math
---

#### this document contains various notes on essentially astrophysics

In the pursuit of a $\underline{workable}$ platform to simulate an approximate universe, obviusly a very large endevor, I seek to understand and condense the interactions between bodies in space, and forumalte it to a set of functions and variables to represent any encounter between two bodies in space.

---
**the very, very, basics**

Actually *accurately* simulating the entire universe is a foolish task. All bodies of some mass have impact on the movements of the others. While discounting this below a certain threshold; ex. $x : \{x \nless \lfloor t - z\rfloor \}$, where $x$ is some force, $t$ is some threshold, and $z$ is gravitational force of some body, might be worthwhile, eventually the small differences would create a slip.

How then, to account for this slip? I have no idea.

One way to account for this would be taking the greastest of set $Nx$, where 
$$e : Nx \implies e : \begin{cases} e \notin x\\ e \exists! \in Nx \\e = max\{Nx\} \end{cases}$$  and including $e$ in each subsequent calculation. This however, just pushes the slip one level down; there's now a slip in threshold each calculation and no real improvement of the situation.
