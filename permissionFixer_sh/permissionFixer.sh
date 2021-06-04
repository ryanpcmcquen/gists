#!/bin/sh
## curl https://gist.githubusercontent.com/ryanpcmcquen/cb89313ebaa63847afab/raw/permissionFixer.sh | OWNERARG=root GROUPARG=root sh
OWNERARG=${1:-root}
GROUPARG=${2:-root}
chown -R ${OWNERARG}:${GROUPARG} .
find -L . \
 \( -perm 777 -o -perm 775 -o -perm 750 -o -perm 711 -o -perm 555 \
  -o -perm 511 \) -print0 | \
  xargs -0 chmod 755
find -L . \
 \( -perm 666 -o -perm 664 -o -perm 640 -o -perm 600 -o -perm 444 \
  -o -perm 440 -o -perm 400 \) -print0 | \
  xargs -0 chmod 644