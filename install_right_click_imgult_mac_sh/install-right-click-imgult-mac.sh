#!/bin/sh

## curl https://gist.githubusercontent.com/ryanpcmcquen/2cb42266052a57992d55/raw/install-right-click-imgult-mac.sh | sh

cd

## Get the command line tools!
xcode-select --install

## You have to do this:
sudo xcodebuild -license accept

## Homebrew!
if [ ! `which brew` ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

## Imgult deps!
brew install wget jpegoptim mozjpeg optipng pngquant gifsicle exiv2 node

npm install -g svgo

## Here comes the imgult:
wget -N https://raw.githubusercontent.com/ryanpcmcquen/image-ultimator/master/imgult; sudo install -m755 imgult /usr/local/bin/; rm imgult

## Recreate the automator package:
mkdir -pv ~/Library/Services/imgult.workflow/Contents/QuickLook/

wget -N https://raw.githubusercontent.com/ryanpcmcquen/imgult.workflow/master/imgult-all.workflow/Contents/QuickLook/Thumbnail.png -P ~/Library/Services/imgult.workflow/Contents/QuickLook/

wget -N https://raw.githubusercontent.com/ryanpcmcquen/imgult.workflow/master/imgult-all.workflow/Contents/document.wflow -P ~/Library/Services/imgult.workflow/Contents/
wget -N https://raw.githubusercontent.com/ryanpcmcquen/imgult.workflow/master/imgult-all.workflow/Contents/Info.plist -P ~/Library/Services/imgult.workflow/Contents/

echo
echo "****************************************************************************** "
echo "                 ___           ___           ___           ___       ___      "
echo "     ___        /\__\         /\  \         /\__\         /\__\     /\  \     "
echo "    /\  \      /::|  |       /::\  \       /:/  /        /:/  /     \:\  \    "
echo "    \:\  \    /:|:|  |      /:/\:\  \     /:/  /        /:/  /       \:\  \   "
echo "    /::\__\  /:/|:|__|__   /:/  \:\  \   /:/  /  ___   /:/  /        /::\  \  "
echo " __/:/\/__/ /:/ |::::\__\ /:/__/_\:\__\ /:/__/  /\__\ /:/__/        /:/\:\__\ "
echo "/\/:/  /    \/__/--/:/  / \:\  /\ \/__/ \:\  \ /:/  / \:\  \       /:/  \/__/ "
echo "\::/__/           /:/  /   \:\ \:\__\    \:\  /:/  /   \:\  \     /:/  /      "
echo " \:\__\          /:/  /     \:\/:/  /     \:\/:/  /     \:\  \    \/__/       "
echo "  \/__/         /:/  /       \::/  /       \::/  /       \:\__\               "
echo "                \/__/         \/__/         \/__/         \/__/               "
echo
echo "****************************************************************************** "
echo
echo "That should do it, happy imgulting `whoami`!"
echo
echo "P.S. Run the script again after the xcode install completes."
echo
