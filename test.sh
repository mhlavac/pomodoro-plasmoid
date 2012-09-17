#!/bin/sh

echo "Building plasmoid"
ant build

echo "Starting plasmoid"
plasmoidviewer

echo "Cleaning build"
ant clean
