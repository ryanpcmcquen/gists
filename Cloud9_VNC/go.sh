#!/bin/sh
## Thanks to:
## https://github.com/noobkilervip/cloud9-vnc
##
## curl https://gist.githubusercontent.com/ryanpcmcquen/ec59deeacbfcccc6ef0bb5240c70b9a6/raw/go.sh | bash
##

cd
sudo apt-get update
git clone https://github.com/acabey/cloud9-vnc.git
cd ~/cloud9-vnc/
sudo ./install.sh
if [ -z "$(grep c9vnc ~/.bash_aliases)" ]; then
  echo alias c9vnc=/opt/c9vnc/c9vnc.sh >> ~/.bash_aliases
fi