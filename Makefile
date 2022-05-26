

recompile=stack exec site rebuild

static:
	cd hakyll; $(recompile)

rebuild:
	cd hakyll; stack build; $(recompile) 
