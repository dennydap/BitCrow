#!/bin/bash

set -e

echo "Would you like remove ubuntu amazon launcher(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo rm -rf /usr/share/applications/ubuntu-amazon-default.desktop
fi

echo "Would you like remove UXTerm launcher(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo rm -rf /usr/share/applications/debian-uxterm.desktop
fi

echo "Would you like remove XTerm launcher(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo rm -rf /usr/share/applications/debian-xterm.desktop
fi

echo "Would you like uninstall Firefox(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo apt-get -y remove firefox
fi

echo "Would you like uninstall Thunderbird(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo apt-get -y remove thunderbird
fi

echo "Would you like uninstall LibreOffice(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo apt-get -y remove libreoffice*
fi

echo "Would you like uninstall AisleRiot(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo apt-get -y remove aisleriot
fi

echo "Would you like uninstall Mahjongg(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo apt-get -y remove gnome-mahjongg
fi

echo "Would you like uninstall OnBoard(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo apt-get -y remove onboard
fi

echo "Would you like uninstall Mines(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo apt-get -y remove gnome-mines
fi

echo "Would you like uninstall Sudoku(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo apt-get -y remove gnome-sudoku
fi

unity-control-center activity-log-manager
unity-control-center display
unity-control-center power
unity-control-center screen
unity-control-center sound
vino-preferences
software-properties-gtk --open-tab=4

exit 0
