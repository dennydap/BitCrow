#!/bin/bash

set -e

sudo flatpak uninstall com.xamarin.MonoDevelop || :
flatpak remote-add --from gnome https://sdk.gnome.org/gnome.flatpakrepo || :
flatpak install --from https://download.mono-project.com/repo/monodevelop.flatpakref || :

sudo bash -c "cat > /usr/share/applications/monodevelop.desktop << _EOF_
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=flatpak run com.xamarin.MonoDevelop
Name=MonoDevelop
Comment=IDE for c# development
Icon=/var/lib/flatpak/app/com.xamarin.MonoDevelop/current/active/export/share/icons/hicolor/48x48/apps/com.xamarin.MonoDevelop.png
_EOF_"
sudo chmod +x /usr/share/applications/monodevelop.desktop

exit 0
