#!/bin/bash

set -e

sudo add-apt-repository ppa:remmina-ppa-team/remmina-master
sudo apt-get update
sudo apt-get install remmina remmina-plugin-rdp

exit 0
