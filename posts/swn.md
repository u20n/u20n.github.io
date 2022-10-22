---
heading: Say What Now?
title: swn.crypt
published: 10.11.2022
tags: math, cryptography, papers
status: under review
authors: u2on&lt;me@notu.dev&gt;, LS&lt;plinthist@proton.me&gt;
---

#### Brief
Say What Now (SWN) is a retroactively insecure cryptographic protocol, which implements the behavior of broadcast only protocols (e.g. radio, IRC) in a system where at least one 'valid' record of transmission exists. 

#### Terms
For the rest of this document, we refer to generalised terms which have a specialised meaning within this context. We use 'true' to refer to the 'correct' record of a transmission. A transmission is the chain of broadcasted packets. We use 'valid' to describe a cryptographically valid transmission record. *It is implied that the 'true' record is 'valid', but only one 'valid' record is 'true'.* Gates are individual cycles of the general form.

#### Rationale
By degrading the security of past gates, we are able to achieve the intended functionality. We implement a 'buffer' of cryptographically 'true' packets, which are the only provably valid packets for their respective cryptographic identities. As the 'head' of the transmission extends, these cryptographic identities are intentionally leaked. This removes the provability of any packets with the same identity; thereby reducing them to **a** valid transmission history. We apply this scheme to reduce the overhead of shared network storage when applied to a distributed network, such as [\[O\]concord](https://openconcord.org). It allows us to remove all but the head layer of the graph from shared network storage, which is used to verify the histories of participating peers. 

#### General Form
$$
\text{let}
\left\{
\begin{align}
&E_y (x),\space y\in kp\text{: $x$ encrypted with }y \\
&kp(x),\space x \in\mathbb{Z}_{\geq0} = \{pub_x, pri_x\}\text{: keypair on index }x \\
&A\sqcup_dB\space=\space(A\sqcup d\sqcup B)\text{: concat with delimiter }d \\
&c\text{: message content} \\
&m\in\mathbb{Z}_{\geq0}\text{: shift distance}
\end{align}
\right .
$$
We form the packet $P$ with the function $P_n$, where $n$ is the gate index. *Note that $m$ doesn't have to be constant among gates, and it is implied that $n\in\mathbb{Z}_{\geq0}$*.
$$
P_n(c, \space kp):
\left\{
\begin{align}
&1 \leq n \\ 
&E_{kp(n)} (c \sqcup_d kp(n-m)_{pri} \sqcup_d kp([n+1]-m)_{pub}) \mid m \leq n \\
&E_{kp(n)} (c \sqcup_d kp(n+1)_{pub} \mid n < m
\end{align}
\right .
$$

Unfortunately, this form needs to be jumpstarted with an initial public key on index $0$;
$$P_0 = kp(0)_{pub}$$

#### Application
In our distributed system, ([\[O\]concord](https://openconcord.org)), we need to retain a network 'head' (HEAD), which corresponds to the uppermost layer of the network's graph. By leveraging the cryptographic scheme presented in SWN, we're able to dramatically reduce the size of the required HEAD, and thus reduce overhead.
