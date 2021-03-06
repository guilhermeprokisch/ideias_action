#!/bin/bash
#source "./backlinks.sh"

function do_backlinks {

        for i in *.md; do
                for j in *.md; do
                        if grep -q "\[${i%.md}\](${i%.md})\|\[\[${i%.md}\]\]" $j; then
                                if [ "${j%.md}" != "${i%.md}" ]; then
                                        echo "${j%.md} -> ${i%.md}"
                                        echo ${j%.md} >> ./.backlinks/${i%.md}
                                fi
                        fi
                done
        done
}

git init
git config user.name $ACTION_NAME
git config user.email $ACTION_MAIL
git pull https://${GH_PAT}@github.com/$OWNER/$REPO_NAME.git

mkdir .backlinks
rm README.md

do_backlinks

git add .
git commit -m 'created backlinks'
git push --set-upstream https://${GH_PAT}@github.com/$OWNER/$REPO_NAME.wiki.git master -f

