#!/bin/sh

# generate RSS
sh ./genxml.sh > docs/txt.xml

# generate txt index
cd docs; sdir.sh txt > txt_index.html; cd ..;


#for f in $(find ./docs/* -type f -name "*.txt")
#do
  #rm -f "$f.asc"
  #gpg --clearsign --default-key D44D3077F7AED1E0B7D7F7AED6301856767EE50E "$f"
#done
