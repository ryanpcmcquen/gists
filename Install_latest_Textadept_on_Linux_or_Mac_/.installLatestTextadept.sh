#!/bin/sh

# wget -N https://gist.githubusercontent.com/ryanpcmcquen/655cb3cc60f9d064738903e59504a5fd/raw/.installLatestTextadept.sh -P ~/ && bash ~/.installLatestTextadept.sh

# Maybe for later:
#TEXTADEPT_VERSION=$(curl https://foicica.com/textadept/feed | grep 'Download:' -A5 | grep '.osx.zip' | head -n1 | egrep -o "download/textadept_.*.osx.zip" | cut -d _ -f 2 | cut -d '"' -f 1 | sed 's/.osx.zip.*//g')

APP="textadept"
APPSHORTCUT="ta"

if [ "$(getconf LONG_BIT)" = "32" ]; then
    PKGARCH="i386"
else
    PKGARCH="x86_64"
fi

# Download the latest version and put it in the right place.
# Also, remove any other versions.
wget -N https://orbitalquark.github.io/${APP}/download/${APP}_LATEST.${PKGARCH}.tgz -P /tmp/
wget -N https://orbitalquark.github.io/${APP}/download/${APP}_LATEST.modules.zip -P /tmp/
sudo rm -rf /opt/${APP}*
# Some distros (like Solus), have no /opt/!
sudo mkdir /opt/
sudo tar xf /tmp/${APP}_LATEST.*.tgz -C /opt/
sudo mv /opt/${APP}* /opt/${APP}

unzip -u /tmp/${APP}_LATEST.modules.zip -d /tmp/
sudo cp -ru /tmp/${APP}_*modules/modules/* /opt/${APP}/modules/
rm -rf /tmp/${APP}_*modules/

# Grab a script that adds ${APP} to the user's path.
# I use the /usr/local/bin/ script for now,
# but this may be useful in the future.
#sudo wget -N https://gist.githubusercontent.com/ryanpcmcquen/655cb3cc60f9d064738903e59504a5fd/raw/${APP}.sh -P /etc/profile.d/

# Grab a script that will conveniently launch ${APP} from the command line with arguments:
sudo wget -N https://gist.githubusercontent.com/ryanpcmcquen/655cb3cc60f9d064738903e59504a5fd/raw/${APPSHORTCUT} -P /usr/local/bin/
sudo chmod +x /usr/local/bin/${APPSHORTCUT}
sudo cp /usr/local/bin/${APPSHORTCUT} /usr/bin/${APP}

# Get ${APP} to show up in menus:
sudo cp /opt/${APP}/src/${APP}.desktop /usr/share/applications/
sudo cp /opt/${APP}/core/images/${APP}.svg /usr/share/pixmaps/

# My config:
mkdir -p ~/.${APP}/
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.${APP}/init.lua -P ~/.${APP}/
