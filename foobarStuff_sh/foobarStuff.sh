#!/bin/sh
chmod -Rv ug+w,o-w,a+rX-st .
find . -type l -print0 -exec unlink {} \;

## This does not work because rename only
## replaces the first occurrence.
#find . -name "*:*" -exec rename : _-_ '{}' \;
## So we do this instead:
for F in `find . -name "*:*"`; do
    NEW_NAME=$(echo -n "$F" | sed 's/:/_-_/g')
    mv -v "$F" "$NEW_NAME"
done
