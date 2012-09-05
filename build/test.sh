#!/bin/sh

echo "Building plasmoid"
cd ../
ant build

echo "Starting plasmoid"
plasmoidviewer

echo "Cleaning build"
ant clean
cd build
