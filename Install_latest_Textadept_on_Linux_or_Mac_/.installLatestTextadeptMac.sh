#!/bin/sh

# wget -N https://gist.githubusercontent.com/ryanpcmcquen/655cb3cc60f9d064738903e59504a5fd/raw/.installLatestTextadeptMac.sh -P ~/ && bash ~/.installLatestTextadeptMac.sh

APP="textadept"
ALTAPPNAME="Textadept"
APPSHORTCUT="ta"

# Download the latest version and put it in the right place.
DOWNLOADS="$(curl https://api.github.com/repos/orbitalquark/textadept/releases/latest | grep browser_download_url)"
MAC_ARCHIVE="$(echo ${DOWNLOADS} | grep -io '[^"]*macos[^"]*')"
MODULES_ARCHIVE="$(echo ${DOWNLOADS} | grep -io '[^"]*modules[^"]*')"
wget -N "${MAC_ARCHIVE}" -P /tmp/
wget -N "${MODULES_ARCHIVE}" -P /tmp/

# The main app:
unzip -u "/tmp/$(basename ${MAC_ARCHIVE})" -d /tmp/
cp -R /tmp/${APP}_*.osx/*.app /Applications/

# Modules:
unzip -u "/tmp/$(basename ${MODULES_ARCHIVE})" -d /tmp/
cp -R /tmp/${APP}_*modules/modules/* /Applications/${ALTAPPNAME}.app/Contents/Resources/modules/

# Command line launcher:
mv /tmp/${APP}_*.osx/${APPSHORTCUT} /usr/local/bin/
chmod +x /usr/local/bin/${APPSHORTCUT}

# My config:
mkdir -p ~/.${APP}/
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.${APP}/init.lua -P ~/.${APP}/

# Cleanup:
rm -rf /tmp/${APP}_*
