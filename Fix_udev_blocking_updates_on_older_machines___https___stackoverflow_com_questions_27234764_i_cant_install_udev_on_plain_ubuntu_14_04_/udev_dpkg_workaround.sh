#!/bin/sh
## curl https://gist.githubusercontent.com/ryanpcmcquen/7ef4bf8dea788f73d82397c2b9d1d796/raw/udev_dpkg_workaround.sh | bash
[ ! "$(grep -A1 '### END INIT INFO' /etc/init.d/udev | grep 'dpkg --configure -a || exit 0')" ] \
&& sudo sed -i 's/### END INIT INFO/### END INIT INFO\
dpkg --configure -a || exit 0/' /etc/init.d/udev
