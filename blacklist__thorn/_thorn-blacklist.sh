if [ -z "$(cat /etc/slackpkg/blacklist | grep _thorn)" ]; then
  echo [0-9]+_thorn >> /etc/slackpkg/blacklist
  echo >> /etc/slackpkg/blacklist
fi