# Grab Teamspeak client and icon image
wget http://hellhawks.net/teamspeak/TeamSpeak3-Client-linux_amd64.run
wget http://hellhawks.net/teamspeak/teamspeak-icon.png

# Run TeamSpeak self extracting file
chmod +x TeamSpeak3-Client-linux_amd64.run
./TeamSpeak3-Client-linux_amd64.run

# Create teamspeak.desktop file
echo "[Desktop Entry]" >> teamspeak.desktop
echo "Version=1.0" >> teamspeak.desktop
echo "Name=TeamSpeak 3" >> teamspeak.desktop
echo "GenericName=Teamspeak 3" >> teamspeak.desktop
echo "Comment=Voice chat for gamers." >> teamspeak.desktop
echo "Type=Application" >> teamspeak.desktop
echo "Categories=Internet" >> teamspeak.desktop
echo "Terminal=false" >> teamspeak.desktop
echo "Icon=/usr/local/share/TeamSpeak3-Client-linux_amd64/teamspeak-icon.png" >> teamspeak.desktop
echo "Exec=/usr/local/share/TeamSpeak3-Client-linux_amd64/ts3client_runscript.sh" >> teamspeak.desktop

# Install TeamSpeak system-wide
sudo mv TeamSpeak3-Client-linux_amd64/ /usr/local/share/
sudo mv teamspeak-icon.png /usr/local/share/TeamSpeak3-Client-linux_amd64/
sudo ln -s /usr/local/share/TeamSpeak3-Client-linux_amd64/ts3client_runscript.sh /usr/local/bin/teamspeak
sudo mv teamspeak.desktop /usr/share/applications/

# Remove .run file
rm TeamSpeak3-Client-linux_amd64.run

