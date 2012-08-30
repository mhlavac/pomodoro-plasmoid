#!/bin/sh

for file in contents/code/*.coffee
do
    coffee -c -p "$file" > "${file%.*}.js"
done
plasmoidviewer
