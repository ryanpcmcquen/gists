#!/bin/sh
#
# This script configures WordPress file permissions based on recommendations
# from codex.wordpress.org/Hardening_WordPress#File_permissions
#
# https://gist.githubusercontent.com/ryanpcmcquen/52ec9f85e3c3356aae6f/raw/wordpress-file-permission-reset.sh
#
# hat tip to Michael Conigliaro <mike [at] conigliaro [dot] org>  [my version is a little more conservative ;-)]
#
WP_OWNER=www-data # <-- wordpress owner
WP_GROUP=www-data # <-- wordpress group
WP_ROOT=$1 # <-- wordpress root directory
WS_GROUP=www-data # <-- webserver group

# reset to safe defaults
find ${WP_ROOT} -exec chown ${WP_OWNER}:${WP_GROUP} {} \;
find ${WP_ROOT} -type d -exec chmod 755 {} \;
find ${WP_ROOT} -type f -exec chmod 644 {} \;

# allow wordpress to manage wp-config.php (but prevent world access)
chgrp ${WS_GROUP} ${WP_ROOT}/wp-config.php
chmod 600 ${WP_ROOT}/wp-config.php

# allow wordpress to manage wp-content
find ${WP_ROOT}/wp-content -exec chgrp ${WS_GROUP} {} \;
find ${WP_ROOT}/wp-content -type d -exec chmod 755 {} \;
find ${WP_ROOT}/wp-content -type f -exec chmod 644 {} \;
