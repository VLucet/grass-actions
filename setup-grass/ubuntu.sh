#!/bin/bash

# Get dependencites
sudo apt-get update -y
sudo apt-get install -y wget git gawk findutils xargs -a <(awk '! /^ *(#|$)/' "grass/.github/workflows/apt.txt") -r -- \
sudo apt-get install -y --no-install-recommends --no-install-suggests

# Create Install directory
mkdir $HOME/install
cd grass

# Set number of cores for compilation
echo "MAKEFLAGS=-j$(nproc)" >> $GITHUB_ENV

# Set LD_LIBRARY_PATH for compilation
echo "LD_LIBRARY_PATH=$HOME/install/lib" >> $GITHUB_ENV

# Build GRASS GIS
grass/.github/workflows/build.sh $HOME/install

# Add th binary directory to PATH
echo "$HOME/install/bin" >> $GITHUB_PATH

# Tests
grass/.github/workflows/test_simple.sh

# Move back home
cd $HOME