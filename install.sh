#!/bin/sh

#!/bin/sh

echo "Building plasmoid"
ant build

echo "Packaging plasmoid"
ant build-package
plasmapkg -i build/pomodoro.plasmoid

echo "Cleaning build"
ant clean
