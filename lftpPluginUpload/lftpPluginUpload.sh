#!/bin/sh
##
## run like so:
## sh lftpPluginUpload.sh /PATH/TO/PLUGIN/ /PATH/TO/NEWLINE/DELIMITED/LIST/OF/SFTP/USERS/ SERVER SERVER_PORT
##
## example:
## sh lftpPluginUpload.sh ~/foo/ ~/install-list.txt example.com 22
##

PASSWORD=${PASSWORD:-}

for USER in `cat ${2}`; do
  lftp -c "open sftp://${3}:${4}
    user ${USER} ${PASSWORD}
    set sftp:auto-confirm yes
    set net:reconnect-interval-base 9
    set net:reconnect-interval-max 9
    set net:max-retries 2
    mirror --reverse --delete --verbose ${1} /wp-content/plugins/"
  if [ $? = 0 ]; then
    echo "$USER complete."
  else
    echo "$USER failed."
  fi
  lftp -c "open sftp://${3}:${4}
    user ${USER}-staging ${PASSWORD}
    set sftp:auto-confirm yes
    set net:reconnect-interval-base 9
    set net:reconnect-interval-max 9
    set net:max-retries 2
    mirror --reverse --delete --verbose ${1} /wp-content/plugins/"
  if [ $? = 0 ]; then
    echo "$USER-staging complete."
  else
    echo "$USER-staging failed."
  fi
done