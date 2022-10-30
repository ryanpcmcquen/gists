#!/bin/sh

## rename a bunch of images to a sequence of
## ascending numbers, offering uniformity
NUM=10001
for FILE in *
  do mv "$FILE" "image_$NUM.jpg"
  let NUM++
done

## create the html to display those images
for FILE in *
  do echo "<div><img src='//SOME.CRAZY.URL/$FILE'></div>" >> fiddle.html
done
