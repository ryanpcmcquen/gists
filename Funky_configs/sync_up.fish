#!/usr/bin/env fish
wget -N https://gist.githubusercontent.com/ryanpcmcquen/d0f0a265dde5cfdbd8b49d126083da6a/raw/sync_up.fish -P /usr/local/bin/ && chmod +x /usr/local/bin/sync_up.fish
for dir in (find ~/repos -maxdepth 1 -type d); cd $dir; echo $dir; git pull --all; cd; end
brew update; brew upgrade; npm update -g; pip install --upgrade pipupgrade; pipupgrade --latest --yes; sudo gem update
curl -o ~/.osx https://gist.githubusercontent.com/ryanpcmcquen/d0f0a265dde5cfdbd8b49d126083da6a/raw/.osx && bash ~/.osx
