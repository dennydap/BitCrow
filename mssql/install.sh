#!/bin/bash

set -e

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server.list | sudo tee /etc/apt/sources.list.d/mssql-server.list
sudo apt-get -y update
sudo apt-get -y install mssql-server
sudo /opt/mssql/bin/sqlservr-setup
systemctl status mssql-server

exit 0
