#!/bin/bash
source "./backlinks.sh"
ls

git init
git config user.name $ACTION_NAME
git config user.email $ACTION_MAIL
git pull https://${GH_PAT}@github.com/$OWNER/$REPO_NAME.git

mkdir .backlinks
rm README.md

backlinks

git add .
git commit -m 'created backlinks'
git push --set-upstream https://${GH_PAT}@github.com/$OWNER/$REPO_NAME.wiki.git master -f

