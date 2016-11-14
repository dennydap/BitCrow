#!/bin/bash

set -e

sudo apt-get install redshift

sudo bash -c "cat > ~/.config/autostart/redshift.desktop << _EOF_
[Desktop Entry]
Name=RedShift
Exec=redshift -l 65:19 -t 5700:3600 -g 0.8 -m randr -v
Terminal=false
X-GNOME-Autostart-enabled=true
_EOF_"

exit 0
