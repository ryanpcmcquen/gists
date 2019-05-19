#!/bin/sh
removepkg /var/log/packages/*-4.14.3-*
removepkg libkscreen
removepkg kscreen
removepkg kactivities
removepkg kde-workspace
removepkg libmm-qt
removepkg libnm-qt
removepkg plasma-nm
removepkg polkit-kde-agent-1
removepkg polkit-kde-kcmodules-1
removepkg kdeconnect-kde
slackpkg update gpg && slackpkg update
slackpkg install bluedevil libktorrent
slackpkg upgrade ktown_testing
slackpkg install ktown_testing