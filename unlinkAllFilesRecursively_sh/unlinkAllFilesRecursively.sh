#!/bin/sh
## unlink all files (remove all symlinks)
find . -type l -exec unlink {} \;