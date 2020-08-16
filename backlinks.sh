#!/bin/bash

function backlinks {

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
