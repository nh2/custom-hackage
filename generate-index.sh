#!/bin/bash

# This script looks at the packages/archive/ directory,
# extracts all cabal files from the packages and puts them
# into 00-index.tar.gz.


# Remove old index file
rm -f 00-index.tar.gz

# Unpack all .cabal files to tmp/$name/$version/$name.cabal
# (the structure 00-index.tar.gz has to have)
mkdir -p tmp

for p in `ls -1 package/*.tar.gz`; do
  # Extract "name-version.tar.gz" by using the last '-'.
  # Write them out separated by a space to split them with read.
  nameVersion=$(sed -E -e "s/(.*)-(.*).tar.gz/\1 \2/" <<< $(basename $p))
  read name version <<< $nameVersion
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
