#
# A script to automate building the site using [s3g](https://github.com/u20n/s3g) and [m2h](https://github.com/u20n/m2h)
#

m2h=~/code/tools/m2h/a.out
s3g=~/code/tools/s3g/s3g.py

in=./notes
out=./docs/notes

# build 'normal' files
for f in $in/posts/*.md
do
  n=$(basename $f .md)
  printf "$n: "
  cat $f \
  | python $s3g -x -c $in/cache/$n.cache \
  | $m2h \
  | python $s3g -a -s \
      -c $in/cache/$n.cache \
      -t $in/templates \
  > $out/$n.html
  
  cat $in/cache/$n.cache >> $in/cache/build.cache
  echo "built"
done

# build indecies
for f in $in/index/*.md
do
  n=$(basename $f .md)
  printf "$n: "
  cat $f \
  | python $s3g -x -c $in/cache/$n.cache \
  | $m2h \
  | python $s3g -a -s \
    -c $in/cache/$n.cache \
    -i $in/cache/build.cache \
    -t $in/templates \
  > $out/$n.html

  echo "built"
done

cp -r $in/style $out/style
cp -r $in/assets $out/assets
