---
title: helpful concord blobs
abrv-title: short.oc
published: 2022-05-28
tags: code
status: incomplete
---

This note contains some helpful scripts I've ended using over and over while creating things derived of the OC libraries. You may find them immediately useful, and if not, I hope you can take away the broader concepts present.

#### Copying and Including OC Libraries
Simple Makefile for moving existing git clones of Concord libraries to the necessary `lib/` folder. This isn't necessary for standard global `/usr/` installs, but is for nightly build testing or for strictly local installs.

```Makefile
LK = -lcryptopp -lpthread -L./lib/core/
CR = -I./lib/core/inc
UT = -I./lib/uttu/inc

# Change to appropriate dir or pass as input through shell script
LC = ~/code/concord/core/src/
LU = ~/code/concord/uttu/

...

# go into local version of core & uttu, build, and then cp to ./lib/
# -- core needs uttu
reset:
	cd $(LU) && $(MAKE) clean && $(MAKE) linux_obj
	cp -r $(LU)build/exe/. ./lib/uttu/
	cp -r lib/uttu $(LC)../lib/
	cd $(LC) && $(MAKE) clean && $(MAKE)
	cp -r $(LC)../exe/. ./lib/core
```
