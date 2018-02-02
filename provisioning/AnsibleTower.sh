#!/bin/bash
### Script for docker env. 
#sudo apt-get install libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev -y
#vagrant box add ubuntu1404 http://
#vagrant plugin install vagrant-libvirt 
#vagrant plugin install vagrant-mutate

sudo apt-get remove docker docker-engine
sudo apt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce -y
apt-cache madison docker-ce

# Docker-compose install
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose
chmod 755 /usr/bin/docker-compose

Source="/data/source"
mkdir -p $Source
cd $Source 

## Get the dcs from docker
curl -sL bit.ly/ralf_dcs -o ./dcs
sudo chmod 755 ./dcs
sudo mv ./dcs /usr/bin/dcs

#sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/server
#sudo mkdir /vagrant/rancher_db 
#sudo docker run -d -v /vagrant/rancher_db/mysql/:/var/lib/mysql --restart=unless-stopped -p 8080:8080 rancher/server
sudo mkdir /vagrant/ansible_tower_db 
sudo docker run -d -p 443:443 -v /vagrant/tower_db:/var/lib/postgresql/9.4/main --name ansible-tower ybalt/ansible-tower


## Docker image pull for default use
sudo docker pull ubuntu:14.04
