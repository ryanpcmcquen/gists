#!/bin/sh
## reasonable batch processing with ffmpeg,
## run this in any folder with a lot of video files
for VID in *
  do ffmpeg -i "${VID}" -crf 32 "OPTIMIZED_${VID}"
done