#!/bin/bash

# Get dependencites
sudo apt-get update -y
sudo apt-get install -y wget git gawk findutils xargs -a <(awk '! /^ *(#|$)/' ".github/workflows/apt.txt") -r -- \
sudo apt-get install -y --no-install-recommends --no-install-suggests

# Install dependencies
# sudo apt install -y libzstd-dev
# sudo apt install -y proj
# sudo apt install -y libgdal-dev
# sudo apt install -y freeglut3-dev

# Create Install directory
mkdir $HOME/install
cd grass

# Set number of cores for compilation
echo "MAKEFLAGS=-j$(nproc)" >> $GITHUB_ENV

# Set LD_LIBRARY_PATH for compilation
echo "LD_LIBRARY_PATH=$HOME/install/lib" >> $GITHUB_ENV

# Build GRASS GIS
.github/workflows/build.sh $HOME/install

# Add the binary directory to PATH
echo "$HOME/install/bin" >> $GITHUB_PATH

# Tests
.github/workflows/test_simple.sh

# Move back home
cd $HOME