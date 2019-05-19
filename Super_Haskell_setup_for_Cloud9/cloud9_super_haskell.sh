#!/bin/sh
#################################################################################
## READ THIS FIRST:                                                            ##
## https://community.c9.io/t/set-up-haskell-vim-now-on-a-c9-workspace/12023    ##
##                                                                             ##
## Most importantly, you should resize your workspace.                         ##
## And if you like being cool, update your font as well.                       ##
#################################################################################
##
## You can also run:
##   wget -N https://gist.githubusercontent.com/ryanpcmcquen/e94d4eddd0d4807156a2f693c86bc6dd/raw/cloud9_super_haskell.sh -P /tmp/
##   bash /tmp/cloud9_super_haskell.sh

## You have to update or it will not work!
sudo apt-get update
## Install the Haskell stack:
curl -sSL https://get.haskellstack.org/ | sh
## Install haskell-vim-now:
curl -L https://git.io/haskell-vim-now > /tmp/haskell-vim-now.sh
bash /tmp/haskell-vim-now.sh