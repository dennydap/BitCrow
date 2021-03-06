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

if [[ "$1" != "all" && "$1" != "config" && "$1" != "install" ]]
  then
    echo "Invalid parameter"
    echo "Usage: ./setup.sh <all/config/install>"
    exit 1
fi

sudo echo "Starting Script!"

chmod +x $(dirname $0)/base/config.sh
chmod +x $(dirname $0)/base/install.sh

if [ \( "$1" == "config" \) -o \( "$1" == "all" \) ]
  then
    ./$(dirname $0)/base/config.sh docker
    ./$(dirname $0)/base/config.sh git
    ./$(dirname $0)/base/config.sh jenkins
    ./$(dirname $0)/base/config.sh nodejs
    ./$(dirname $0)/base/config.sh openssh
    ./$(dirname $0)/base/config.sh plex
    ./$(dirname $0)/base/config.sh python
    ./$(dirname $0)/base/config.sh yarn
fi

if [ \( "$1" == "install" \) -o \( "$1" == "all" \) ]
  then
    sudo apt-get -y update
    sudo apt-get -y upgrade

    ./$(dirname $0)/base/install.sh docker
    ./$(dirname $0)/base/install.sh git
    ./$(dirname $0)/base/install.sh jenkins
    ./$(dirname $0)/base/install.sh nodejs
    ./$(dirname $0)/base/install.sh openssh
    ./$(dirname $0)/base/install.sh plex
    ./$(dirname $0)/base/install.sh python
    ./$(dirname $0)/base/install.sh yarn

    sudo apt -y autoremove
fi

echo "Script finished successfully!"

exit 0
