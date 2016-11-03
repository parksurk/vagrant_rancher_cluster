#!/bin/bash
### Script for docker env. 
#sudo apt-get install libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev -y
#vagrant box add ubuntu1404 http://
#vagrant plugin install vagrant-libvirt 
#vagrant plugin install vagrant-mutate

wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker root
service docker start

# Docker-compose install
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose
chmod 755 /usr/bin/docker-compose


Source="/data/source/"
mkdir -p $Source

# elk stack compose file download
cd $Source 


## Get the dcs from docker
curl -sL bit.ly/ralf_dcs -o ./dcs
sudo chmod 755 ./dcs
sudo mv ./dcs /usr/bin/dcs

sudo docker pull ubuntu:14.04
sudo docker pull rancher/agent-instance:v0.8.3
sudo docker pull rancher/agent:v1.0.2