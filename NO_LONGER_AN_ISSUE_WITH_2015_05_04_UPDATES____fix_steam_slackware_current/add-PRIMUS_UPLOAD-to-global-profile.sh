#!/bin/sh
## curl https://gist.githubusercontent.com/ryanpcmcquen/8eb13008a23422379e23/raw/add-PRIMUS_UPLOAD-to-global-profile.sh | sh
## this script must be run as root,
## note that the requirement for this variable may go away

if [ ! $UID = 0 ]; then
  cat << EOF
This script must be run as root.
EOF
  exit 1
fi

if [ -z "`cat /etc/profile | grep PRIMUS_UPLOAD`" ]; then
  echo >> /etc/profile
  echo "## thanks to Nick Blizzard for the PRIMUS_UPLOAD=2 recommendation" >> /etc/profile
  echo "## this variable may break things or become" >> /etc/profile
  echo "## unnecessary, remove at will" >> /etc/profile
  echo "export PRIMUS_UPLOAD=2" >> /etc/profile
  echo >> /etc/profile
fi
