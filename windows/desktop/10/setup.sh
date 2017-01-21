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

echo "Starting Script!"

chmod +x $(dirname $0)/base/config.sh
chmod +x $(dirname $0)/base/install.sh
chmod +x $(dirname $0)/settings/settings.sh

if [ \( "$1" == "config" \) -o \( "$1" == "all" \) ]
  then
    ./$(dirname $0)/base/config.sh atom
fi

if [ \( "$1" == "install" \) -o \( "$1" == "all" \) ]
  then
    ./$(dirname $0)/base/install.sh atom
fi

if [ \( "$1" == "settings" \) -o \( "$1" == "all" \) ]
  then
    ./$(dirname $0)/settings/settings.sh
fi

echo "Script finished successfully!"

exit 0
