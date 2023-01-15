default: clean
	sh build.sh

clean:
	rm -r notes/cache/* docs/notes/*
