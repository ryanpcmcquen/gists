#!/bin/sh
for F in $(egrep -lr '“|‘|”|’' $1); do
  sed -i.smartQuoteBackup 's/“/"/g' $F
  sed -i.smartQuoteBackup 's/”/"/g' $F
  sed -i.smartQuoteBackup "s/‘/'/g" $F
  sed -i.smartQuoteBackup "s/’/'/g" $F
done