#!/bin/bash

set -e

sudo apt-get -y update
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository -y 'deb https://apt.dockerproject.org/repo ubuntu-trusty main'
sudo apt-get -y update
sudo apt-get -y install docker-engine

exit 0
