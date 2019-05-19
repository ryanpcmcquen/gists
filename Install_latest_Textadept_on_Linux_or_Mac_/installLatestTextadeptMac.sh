#!/bin/sh

# wget -N https://gist.githubusercontent.com/ryanpcmcquen/655cb3cc60f9d064738903e59504a5fd/raw/installLatestTextadeptMac.sh -P /tmp/ && bash /tmp/installLatestTextadeptMac.sh

APP="textadept"
ALTAPPNAME="Textadept"
APPSHORTCUT="ta"

# Download the latest version and put it in the right place.
wget -N https://foicica.com/${APP}/download/${APP}_LATEST.osx.zip -P /tmp/
wget -N https://foicica.com/${APP}/download/${APP}_LATEST.modules.zip -P /tmp/

# The main app:
unzip -u /tmp/${APP}_LATEST.osx.zip -d /tmp/
cp -R /tmp/${APP}_*.osx/*.app /Applications/

# Modules:
unzip -u /tmp/${APP}_LATEST.modules.zip -d /tmp/
cp -R /tmp/${APP}_*modules/modules/* /Applications/${ALTAPPNAME}.app/Contents/Resources/modules/

# Command line launcher:
mv /tmp/${APP}_*.osx/${APPSHORTCUT} /usr/local/bin/
chmod +x /usr/local/bin/${APPSHORTCUT}

# My config:
mkdir -p ~/.${APP}/
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.${APP}/init.lua -P ~/.${APP}/

# Cleanup:
rm -rf /tmp/${APP}_*
