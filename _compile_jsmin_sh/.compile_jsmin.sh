#!/bin/sh
## wget -N https://gist.githubusercontent.com/ryanpcmcquen/96901e92d60484d8316d/raw/.compile_jsmin.sh -P ~/; sh ~/.compile_jsmin.sh
cd
mkdir -p ~/JSMIN_TMP_BUILD/
wget -N https://raw.githubusercontent.com/douglascrockford/JSMin/master/jsmin.c -P ~/JSMIN_TMP_BUILD/
gcc ~/JSMIN_TMP_BUILD/jsmin.c -o /usr/local/bin/jsmin || sudo gcc ~/JSMIN_TMP_BUILD/jsmin.c -o /usr/local/bin/jsmin
rm -rf ~/JSMIN_TMP_BUILD/

echo
if [ -e /usr/local/bin/jsmin ]; then
  echo "##################################################"
  echo
  echo "jsmin was successfully installed to /usr/local/bin"
  echo
  echo "To use it, run:"
  echo "jsmin < foo.js > foo.min.js"
  echo
  echo "##################################################"
else
  echo "Something went wrong, try reading the output above and using your mind."
fi
echo