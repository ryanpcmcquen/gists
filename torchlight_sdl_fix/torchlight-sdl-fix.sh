#!/bin/sh
## curl https://gist.githubusercontent.com/ryanpcmcquen/687747c6de09693a6916/raw/torchlight-sdl-fix.sh | sh
# set this to your Torchlight directory
TORCHLIGHTDIR=/usr/local/games/Torchlight

## grab the SDL repo
hg clone http://hg.libsdl.org/SDL

## enter the directory
cd SDL

# check out the revision before the one that introduces the bug as advised here: http://forums.runicgames.com/viewtopic.php?f=24&t=33360&start=60#p474739
hg up 4de584a3a027 --clean

# Fix X11 compilation issues with another changeset
hg export 6caad66a4966 > patch
hg import patch

# just in case
./autogen.sh 

# use build dir else configure will complain
mkdir build
cd build
../configure
make

# copy the resulting lib to the game's lib64 directory
cp -Rv build/.libs/libSDL2*so* $TORCHLIGHTDIR/lib64/
