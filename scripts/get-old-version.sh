#!/bin/bash
#
# this repo uses git annotated tags of the form 'vMAJOR.MINOR.PATH' to store
# upstream versions, so let's extract the latest one

git tag | grep -v debian | sort -V | tail -n 1 | sed 's/^v//'
