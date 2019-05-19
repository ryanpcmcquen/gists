#!/bin/sh
for F in *:*; do mv -v "$F" "$(echo "$F" | tr ':' '-')"; done