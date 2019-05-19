#!/bin/sh
cd ~/sbo/
for FILE in `cat ~/gpl3list.txt`; do
  sed -i "s/Free Software Foundation\; either version 3 of the License/Free Software Foundation\; either version 2 of the License/g" $FILE
  git add -A :/
  git commit -s -m "`echo $FILE | cut -d/ -f1-2`: Allow GPLv2."
done 
