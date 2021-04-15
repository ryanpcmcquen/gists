#!/bin/sh
tar czf - foo/ | split --bytes=2GB - foo.tar.gz