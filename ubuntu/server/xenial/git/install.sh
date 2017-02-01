#!/bin/bash

set -e

sudo apt-get -y install git

email=$(cat $(dirname $0)/email.config)
name=$(cat $(dirname $0)/name.config)

git config --global user.email "$email"
git config --global user.name "$name"

if [ ! -f ~/.ssh/id_rsa ]
  then
    ssh-keygen -t rsa -b 4096 -C "$email"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    cat ~/.ssh/id_rsa.pub
fi

installgitlfs=$(cat $(dirname $0)/installgitlfs.config)
if [ $installgitlfs == "y" ]
  then
    wget https://github.com/github/git-lfs/releases/download/v1.5.5/git-lfs-linux-amd64-1.5.5.tar.gz
    tar -zxvf git-lfs-linux-amd64-1.5.5.tar.gz
    rm git-lfs-linux-amd64-1.5.5.tar.gz
    chmod +x git-lfs-1.5.5/install.sh
    cd git-lfs-1.5.5 && sudo ./install.sh && cd ..
    sudo rm -rf git-lfs-1.5.5
fi

exit 0
