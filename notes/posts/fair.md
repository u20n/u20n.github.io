---
title: ensuring fair trade in user generated content
file: fair
ext: trade
published: 2022-04-26
tag: math
tag: game theory
status: incomplete
---

### Preamble
I propose a system of governance for user-created content in online games; mimicking zero trust design schemes to: maintain appropriate sustainability, and avoid hyperinflation of in-game markets or currency. This proposal largely focuses on MMOs as a base, given the massive need for new engaging content, the existence of player-to-player economy, and a large player base.

### Burden of Cost
The eventual degradation of a "good"[^good] online game is seldom the lack of active players. It is, instead, the burden of cost on the publisher; maintenance of servers, new content, and other costs of doing business. Ideally, these games should be open sourced at the end of this lifecycle, left in a state similar to gmod[^gmod]. Some success stories include OpenTTD[^ottd], where the player base becomes the developer of the game, releasing (economic) burden from the publisher and/or game studio.

While the eventual release of game IP into the commons is a controversial opinion to say the least, at lease these issues can be solved by the introduction of fair trade systems into community content. In this context, fair trade is not the arrangement designed to directly connect farmers to consumers, but is instead a system designed to have accurate and appropriate risk$:$reward ratio.

### Small Steps
Let's start with a small game concept. 

Our super cool new mobile MMO 4x game is called *Super Interdimensional Galactic Defense Force*. Players control an initially small colony, that generates capital and money by exploring surrounding terrain and collecting resources. The planet on which our game takes place is also inhabited by a dangerous race of apex predators. They've inflicted heavy losses on all of our foraging parties, and so any research on their weaknesses would greatly aid in our development of effective personal protection units.

Without doing too much subrate world building, let's assume that there is a nonzero count of corporations who pay handsomely for body parts from these aliens; to gain an advantage in their research.

> We've  introduced a ambiguous but valid threat, a justification for compensation, and almost limitless creative liberty.
> Besides lore considerations, the limiting factor is now the actual content.[^lore]


We assume a game environment is composed of a set of dimensionally equal tiles, which each have the ability to contain $\le{1}$ copies of a unique asset[^neat]. We also assume all possible assets are known, and for the sake of sanity, assign them to set $A$.




### Game Loop Nuance


[^lore]: Although, this scenario has enough ambiguity that any lore-breaking additions can be shuffled (admittedly lazily) into any one of the gimmicky "this doesn't count but counts" modifiers; interdimensional leak, time jumping, genetic mutation with a shady catalyst, etc.
[^neat]: This allows us to have partial portions of assets, allowing for say a 4 tile large building.
[^ottd]: [Open Transport Tycoon Deluxe](https://en.wikipedia.org/wiki/OpenTTD) is a open source fan remake of the popular TransportTycoonDeluxe, and is incredibly successful and well reviewed on steam.
[^good]: A game that does not suffer from long term player loss due to lack of content.
[^gmod]: [Garry's Mod](https://en.wikipedia.org/wiki/Garry%27s_Mod) has extensive documentation for both modding and server maintenance, requiring almost complete hands-off support from Valve.
