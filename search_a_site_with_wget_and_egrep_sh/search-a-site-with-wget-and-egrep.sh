#!/bin/sh
##
## long flags:
## --mirror --convert-links --adjust-extension --page-requisites --recursive --execute robots=off
wget -mkEpr -e robots=off SITE.URL

## cd into the created directory, and then run some variation
## of the egrep command below

## egrep just looks better than grep in this scenario
egrep -rwi 'bunch|of|phrases|delimited\ by|pipes' * > searchTermsResults.txt