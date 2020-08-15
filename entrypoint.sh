#!/bin/bash

FILES=$(find '.' -maxdepth 1 -type f -name '*.md' -execdir basename '{}' ';')
for i in $FILES; do
        cp "$i" "./.backlinks/"
done

git add .
git commit -m 'backlink action'
git push --set-upstream https://guilhermeprokisch@github.com/guilhermeprokisch/ideias.wiki.git master
git push --set-upstream https://guilhermeprokisch@github.com/guilhermeprokisch/ideias.git master
