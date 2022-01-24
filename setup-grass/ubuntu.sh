#!/bin/bash

# Move to grass folder
cd grass

# Get dependencites
sudo apt-get update -y
sudo apt-get install -y wget git gawk findutils 
xargs -a <(awk '! /^ *(#|$)/' ".github/workflows/apt.txt") -r -- \
    sudo apt-get install -y --no-install-recommends --no-install-suggests

# # Create Install directory
# mkdir $HOME/install

# # Set number of cores for compilation
# echo "MAKEFLAGS=-j$(nproc)" >> $GITHUB_ENV

# # Set LD_LIBRARY_PATH for compilation
# echo "LD_LIBRARY_PATH=$HOME/install/lib" >> $GITHUB_ENV

# Build GRASS GIS
.github/workflows/build.sh $HOME/install

# Move back home
cd $HOME