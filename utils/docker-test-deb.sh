#!/usr/bin/env bash

set -x
set -e

# Define the version
cd w3af-kali/
VERSION=`python get-latest-w3af-tag.py`

cd docker/
cp ../../*${VERSION}*.deb .
sudo docker run -v `pwd`:/w3af/ -i -t --name w3af-kali --rm andresriancho/w3af-kali ${VERSION}
