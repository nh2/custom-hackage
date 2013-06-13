#!/bin/bash

# Remove old index file
rm -f 00-index.tar.gz

# Unpack all .cabal files to tmp/$name/$version/$name.cabal
# (the structure 00-index.tar.gz has to have)
mkdir -p tmp

for p in `find packages -name "*.tar.gz"`; do
  version=$(basename $(dirname $p))
  name=$(basename $(dirname $(dirname $p)))
  echo $name $version
  mkdir -p tmp/$name/$version
  tar xaf $p -C tmp --wildcards `basename $p .tar.gz`/$name.cabal -O > tmp/$name/$version/$name.cabal
done;

# Create new index file
# Use find to not include directories themselves.
# Not sure why, but the hackage 00-index.tar.gz does that.
cd tmp
tar czf ../00-index.tar.gz `find * -type f`
cd ..
rm -rf tmp
