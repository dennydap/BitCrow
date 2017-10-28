#!/bin/bash

set -e

sudo add-apt-repository ppa:otto-kesselgulasch/gimp-edge
sudo apt-get update
sudo apt install -y gimp gimp-gmic

exit 0
