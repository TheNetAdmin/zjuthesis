#!/bin/bash

old_ver=$(perl -lne 'print $1 if /([0-9]+\.[0-9]+\.[0-9]+)/' config/version.tex)
new_ver=$1

echo "$old_ver ==> $new_ver"
echo "Press any key to proceed"
read

echo "Update config/version.tex"
sed -r -i "s/[0-9]+\.[0-9]+\.[0-9]+/$new_ver/" config/version.tex || true
cat config/version.tex
echo "Press any key to proceed"
read

git add config/version.tex
git commit

echo "Press any key to tag current commit"
read
git tag -a "v$new_ver"