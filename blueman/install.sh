#!/bin/bash

set -e

sudo apt-get -y install blueman

controllermode=$(cat $(dirname $0)/controllermode.config)

sudo cp /etc/bluetooth/main.conf /etc/bluetooth/main.conf.factory-defaults
sudo chmod a-w /etc/bluetooth/main.conf.factory-defaults

sudo bash -c "cat > /etc/bluetooth/main.conf << _EOF_
[General]
#Name = BlueZ

#Class = 0x000100

#DiscoverableTimeout = 0

#PairableTimeout = 0

#AutoConnectTimeout = 60

#DeviceID = bluetooth:1234:5678:abcd

#ReverseServiceDiscovery = true

#NameResolving = true

#DebugKeys = false

ControllerMode = $controllermode

#MultiProfile = off

#FastConnectable = false

[Policy]
#ReconnectUUIDs=00001112-0000-1000-8000-00805f9b34fb, 0000111f-0000-1000-8000-00805f9b34fb, 0000110a-0000-1000-8000-00805f9b34fb

#ReconnectAttempts=7

#ReconnectIntervals=1, 2, 4, 8, 16, 32, 64

AutoEnable=true
_EOF_"

sudo service bluetooth retart

exit 0
