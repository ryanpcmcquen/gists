#!/bin/sh
## verbose
wget --mirror --convert-links --adjust-extension --page-requisites --recursive --execute robots=off SITE.URL
## fast
wget -mkEpr -e robots=off SITE.URL