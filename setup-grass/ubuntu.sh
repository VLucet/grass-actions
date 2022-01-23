#!/bin/bash

# Get dependencites
sudo apt-get update -y
sudo apt-get install -y wget git gawk findutils xargs -a <(awk '! /^ *(#|$)/' ".github/workflows/apt.txt") -r -- \
sudo apt-get install -y --no-install-recommends --no-install-suggests

# Create Install directory
mkdir $HOME/install

# Set number of cores for compilation
echo "MAKEFLAGS=-j$(nproc)" >> $GITHUB_ENV

# Set LD_LIBRARY_PATH for compilation
echo "LD_LIBRARY_PATH=$HOME/install/lib" >> $GITHUB_ENV

# Build GRASS GIS
grass/workflows/build_ubuntu-20.04.sh

# Add th binary directory to PATH
echo "$HOME/install/bin" >> $GITHUB_PATH

# Tests
test_simple.sh