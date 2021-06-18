#!/bin/sh
##
## Long flags:
## --mirror --convert-links --adjust-extension --page-requisites --recursive --execute robots=off

## Given a list of URLs separated by newlines:
for SITE in $(cat site_list.txt); do
  wget $SITE/foo.html -O $SITE.html
  echo $SITE >> site_info.txt
  grep 'Important thing ' $SITE.html >> site_info.txt
done
