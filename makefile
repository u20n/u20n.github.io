#literally made b/c i'm too lazy to cd into _gen and run the command

default: 
	cd _gen; stack exec site rebuild

#rebuild site exe
r:
	cd _gen; stack build; stack exec site rebuild

#preview
p:
	cd docs/notes; firefox index.html
