#!/bin/sh
for F in "$(find . -name *:*)"; do mv -v "$F" "$(echo "$F" | tr ':' '-')"; done