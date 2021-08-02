#!/bin/sh
find ./ -depth -name '.*' -exec sudo rename -v 's|/\.+([^/]+)$|/$1|' {} \;