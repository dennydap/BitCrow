#!/bin/bash

set -e

sudo apt-get install redshift

sudo bash -c "cat > ~/.config/autostart/redshift.desktop << _EOF_
[Desktop Entry]
Name=RedShift
Comment=To help you sleep
Exec=redshift -l 65:19 -t 6400:1000
Icon=icon.svg
Terminal=false
Type=Application
Categories=Utility
X-GNOME-Autostart-enabled=true
_EOF_"
sudo chmod +x ~/.config/autostart/redshift.desktop

exit 0
