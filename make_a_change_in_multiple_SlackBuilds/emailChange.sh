#!/bin/sh
cd ~/sbo/
for FILE in `cat ~/oldEmailList.txt`; do
  sed -i "s/foo@bar.baz/baz@zot.qux/g" $FILE
  git add -A :/
  git commit -sm "$(echo $FILE | cut -d/ -f1-2): Change email."
done