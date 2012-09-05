#!/bin/sh

echo "Building plasmoid"
cd ../
ant build

echo "Packaging plasmoid"
zip -r ./pomodoro.plasmoid .
plasmapkg -i pomodoro.plasmoid
rm pomodoro.plasmoid

echo "Cleaning build"
ant clean
cd build
