---
title: creating a tiny big number library
abrv-title: tbn
published: 2022-03-24
tags: math
status: incomplete
---

#### Tiny Big Number Lib - Background
Tiny Big Number Lib was written so that I could do physics projects and other large simulations in C++ without a huge amount of dependency overhead. It aims to implement the $\underline{\text{bare minimum}}$ necessary to do these calculations.

### Implementation Notes + Design Decisions
##### big vs signed_big
While the initial methods were able to just used an aliased vector of unsigned integers; `using big = std::vector<unsigned int>;`, as soon as subtraction was being added, it made sense to implement some form of signing. As I'm doing my best to keep the library as 'vanillia' as possible, this was achieved by aliasing a tuple of a bool and a big to `signed_big`. A simple translation namespace was created; `unpack` for QoL. It may make sense later to form a standardised `struct` model, but for now this will suffice. 
