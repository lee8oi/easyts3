#!/bin/bash
#
# EasyTS3 client-install by Lee Forest (lee8oi@gmail.com)
#
# A simple script that performs a system-wide removal of the TeamSpeak3 client
# (If it was installed by EasyTS3 client-install.sh).

sudo rm -rf /usr/local/bin/teamspeak /usr/local/share/TeamSpeak3-Client-linux_* /usr/share/applications/teamspeak.desktop
