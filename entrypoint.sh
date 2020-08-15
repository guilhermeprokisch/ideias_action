#!/bin/bash

git init
git config user.name $ACTION_NAME
git config user.email $ACTION_MAIL
git pull https://${GH_PAT}@github.com/$OWNER/$REPO_NAME.git


FILES=$(find '.' -maxdepth 1 -type f -name '*.md' -execdir basename '{}' ';')
for i in $FILES; do
        for j in $FILES; do
                if grep -q "\[${i%.md}\](${i%.md})\|[[${i}]]" $j; then
                       echo $j
                else
                       echo ''
                fi
        done
        cp "$i" "./.backlinks/"
done

git add .
git commit -m 'Backlinks action'
git push --set-upstream https://${GH_PAT}@github.com/$OWNER/$REPO_NAME.wiki.git master
git push --set-upstream https://${GH_PAT}@github.com/$OWNER/$REPO_NAME.git master

