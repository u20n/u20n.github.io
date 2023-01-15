---
title: achieving vanilla suckless scroll functionality
file: vsf
ext: cfg
published: 2022-09-02
tags: config
status: complete
---
### background
For the last ~2 years, as I've been migrating my workflow to align with the 'less is more' mantra. One issue I've encountered is inherent to this methodology; less, is well, less. Stripping unnecessary features and making opt-in the expectation is the 'correct' solution. But common agreement on how to re-implement opt-in functionality is paramount to the installation[^tools] of these tools. 

### solution(s)
The only time that I **need** scrolling in my terminal emulator is when inspecting make/gcc build output. Every other tool has scroll functionality encompassed within; vim, gdb, man, etc. Patching this into ST is unnecessary[^scroll]; given that I don't need this functionality for any other tool. A simple solution is to alias `vmake` (verbose make) to a `less` command pipe; `alias vmake='less < <(make 2>&1)'`[^cmd]. 

We can expand this functionality to non-default `make` commands with UNIX style piping; simply alias `'less< <($0 2>&1)'` as appropriate. **Most commands can be piped to `less` natively**; `make` was the outlier. It would initially output correctly, but then it (or `less`, I'm not sure) would wipe the output.

[^tools]: I view Suckless tools as a minimalist interpretation of the original UNIX philosophy. Because of this, once you set them up, you're unlikely to be forced to modify it due to breakage.
[^cmd]: Found this pipe syntax after doing a deep forum dive; [original source](https://www.linuxquestions.org/questions/programming-9/how-to-pipe-output-from-make-325285/)
[^scroll]: While Suckless' scroll is a valiant effort, it's run into some [non-negotiable problems](https://tools.suckless.org/scroll/)