---
title: achieving vanilla suckless scroll functionality
abrv-title: vsf.cfg
published: 2022-09-02
tags: config
status: complete
---
### achieving vanilla suckless scroll functionality
For the last ~2 years, as I've been migrating my workflow to align with the 'less is more' mantra. One issue I've encountered is inherent to this methodology; less, is well, less. Stripping unnecessary features that apply to <70% of the userbase, and making people install what they want to use, instead of being forced to have bloat that they'll never use, is the 'correct' solution. But common agreement on how to re-implement this functionality is paramount to the installation[^tools] of these tools. 

The only time that I **need** scrolling in my terminal emulator is when inspecting make/gcc build output. Every other tool has scroll functionality encompassed within; vim, gdb, man, etc. Patching this into ST is unnecessary[^scroll]; given that I don't need this functionality for any other tool. A simple solution is to alias vmake (verbose make) to a less command pipe; `alias vmake='less < <(make 2>&1)'`[^cmd]. 

We can expand this functionality with UNIX style piping; simply alias `'less< <(xargs -0 2>&1)'` as appropriate. Example usage; (aliased as `view`)  `cat very_large_file.txt | view`.


[^tools]: I view Suckless tools as a minimalist interpretation of the original UNIX philosophy, as an effect of this, once you set them up, you'll never be forced to modify it due to breakage. 
[^cmd]: Found the pipe functionality after doing a deep forum dive; [original source](https://www.linuxquestions.org/questions/programming-9/how-to-pipe-output-from-make-325285/)
[^scroll]: While Suckless' scroll is a valiant effort, it's run into some [non-negotiable problems](https://tools.suckless.org/scroll/)