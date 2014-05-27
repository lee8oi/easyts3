#!/bin/bash
#
# EasyTS3 client-install by Lee Forest (lee8oi@gmail.com)
#
# A simple script that performs a system-wide installation of the TeamSpeak3 client.

# Get architecture.
case `uname -m` in
	i686)
		arch=x86
		;;
	x86_64)
		arch=amd64
		;;
	*)
		echo "cannot determine architecture"
		exit
esac

# Grab Teamspeak client and icon image
wget http://dl.4players.de/ts/releases/3.0.14/TeamSpeak3-Client-linux_$arch-3.0.14.run
wget https://raw.githubusercontent.com/lee8oi/easyts3/master/teamspeak3.png

file=TeamSpeak3-Client-linux_$arch-3.0.14.run
# Run TeamSpeak self extracting file
chmod +x $file
./$file

# Create teamspeak.desktop file
echo "[Desktop Entry]" >> teamspeak.desktop
echo "Version=1.0" >> teamspeak.desktop
echo "Name=TeamSpeak 3" >> teamspeak.desktop
echo "GenericName=Teamspeak 3" >> teamspeak.desktop
echo "Comment=Voice chat for gamers." >> teamspeak.desktop
echo "Type=Application" >> teamspeak.desktop
echo "Categories=Internet" >> teamspeak.desktop
echo "Terminal=false" >> teamspeak.desktop
echo "Icon=/usr/local/TeamSpeak3-Client-linux_$arch/teamspeak3.png" >> teamspeak.desktop
echo "Exec=/usr/local/TeamSpeak3-Client-linux_$arch/ts3client_runscript.sh" >> teamspeak.desktop

# Install TeamSpeak system-wide
sudo mv TeamSpeak3-Client-linux_$arch/ /usr/local/
sudo mv teamspeak3.png /usr/local/TeamSpeak3-Client-linux_$arch/
sudo ln -s /usr/local/TeamSpeak3-Client-linux_$arch/ts3client_runscript.sh /usr/local/bin/teamspeak
sudo mv teamspeak.desktop /usr/share/applications/

# Remove .run file
rm $file

