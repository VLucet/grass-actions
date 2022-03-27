#!/bin/bash

# Move to grass folder
cd grass

# Get dependencites
sudo apt-get update -y
sudo apt-get install -y wget git gawk findutils 
xargs -a <(awk '! /^ *(#|$)/' ".github/workflows/apt.txt") -r -- \
    sudo apt-get install -y --no-install-recommends --no-install-suggests

# Build GRASS GIS
.github/workflows/build.sh $HOME/install

# Move back home
cd $HOME