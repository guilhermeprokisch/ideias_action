#!/bin/bash

FILES=$(find '.' -maxdepth 1 -type f -name '*.md' -execdir basename '{}' ';')
for i in $FILES; do
        cp "$i" "./.backlinks/"
done
