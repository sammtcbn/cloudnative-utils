#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade
sudo snap install docker

# Running Docker as normal user
# refer to https://snapcraft.io/docker
sudo addgroup --system docker
sudo adduser $USER docker
newgrp docker
sudo snap disable docker
sudo snap enable docker
