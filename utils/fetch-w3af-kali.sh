#!/bin/bash

set -x
set -e

#
# Clone if required, cache will store this directory between builds
#
if [ ! -d "w3af-kali" ]; then
    git clone git@github.com:andresriancho/w3af-kali.git
    git checkout --track origin/upstream
    git checkout --track origin/pristine-tar
    git remote add kali-upstream git://git.kali.org/packages/w3af.git
fi

cd w3af-kali

git checkout upstream
git pull

git checkout pristine-tar
git pull

git checkout master
git pull

git fetch -v kali-upstream

git checkout master
git merge kali-upstream/master
