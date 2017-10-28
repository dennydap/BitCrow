#!/bin/bash

set -e

if [ "$#" -ne 1 ]
  then
    echo "Illegal number of parameters"
    exit 1
fi

if [[ $EUID -eq 0 ]]; then
   echo "This script must not run as root"
   exit 1
fi

if [[ "$1" != "all" && "$1" != "config" && "$1" != "install" && "$1" != "settings" ]]
  then
    echo "Invalid parameter"
    echo "Usage: ./setup.sh <all/config/install/settings>"
    exit 1
fi

sudo echo "Starting Script!"

chmod +x $(dirname $0)/base/config.sh
chmod +x $(dirname $0)/base/install.sh
chmod +x $(dirname $0)/settings/settings.sh

if [ \( "$1" == "config" \) -o \( "$1" == "all" \) ]
  then
    ./$(dirname $0)/base/config.sh atom
    ./$(dirname $0)/base/config.sh blueman
    ./$(dirname $0)/base/config.sh chrome
    ./$(dirname $0)/base/config.sh docker
    ./$(dirname $0)/base/config.sh franz
    ./$(dirname $0)/base/config.sh git
    ./$(dirname $0)/base/config.sh nodejs
    ./$(dirname $0)/base/config.sh openssh
    ./$(dirname $0)/base/config.sh python
    ./$(dirname $0)/base/config.sh redshift
    ./$(dirname $0)/base/config.sh vlc
    ./$(dirname $0)/base/config.sh yarn
    ./$(dirname $0)/base/config.sh gimp
fi

if [ \( "$1" == "install" \) -o \( "$1" == "all" \) ]
  then
    sudo apt-get -y update
    sudo apt-get -y upgrade

    ./$(dirname $0)/base/install.sh atom
    ./$(dirname $0)/base/install.sh blueman
    ./$(dirname $0)/base/install.sh chrome
    ./$(dirname $0)/base/install.sh docker
    ./$(dirname $0)/base/install.sh franz
    ./$(dirname $0)/base/install.sh git
    ./$(dirname $0)/base/install.sh nodejs
    ./$(dirname $0)/base/install.sh openssh
    ./$(dirname $0)/base/install.sh python
    ./$(dirname $0)/base/install.sh redshift
    ./$(dirname $0)/base/install.sh vlc
    ./$(dirname $0)/base/install.sh yarn
    ./$(dirname $0)/base/install.sh gimp

    sudo apt -y autoremove
fi

if [ \( "$1" == "settings" \) -o \( "$1" == "all" \) ]
  then
    ./$(dirname $0)/settings/settings.sh
fi

echo "Script finished successfully!"

exit 0
