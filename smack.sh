#!/bin/bash
# Install python
sudo apt-get update
sudo apt-get -y install gcc-4.9
sudo update-alternatives --config gcc

#Pre-requisites
sudo apt-get install build-essential checkinstall
sudo apt-get -y install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

#installation
sudo cd /usr/src
sudo wget https://www.python.org/ftp/python/3.4.4/Python-3.4.4.tgz
sudo tar xzf Python-3.4.4.tgz
sudo cd Python-3.4.4
sudo ./configure
sudo make altinstall

sudo wget http://peak.telecommunity.com/dist/ez_setup.py; 
sudo python ez_setup.py
sudo easy_install pip
sudo pip install virtualenv


# Install DCOS-CLI
cd
mkdir dcos && cd dcos
curl -O https://downloads.dcos.io/dcos-cli/install.sh
sudo sed -i "s/read -p /ANSWER=yes #/g" ./install.sh
bash install.sh . http://$1.westus.cloudapp.azure.com
source /home/sysadmin/dcos/bin/env-setup && dcos help

# Install Cassandra
dcos package install cassandra
dcos cassandra --help

# Install Kafka
dcos package install Kafka
dcos kafka --help

# Install Spark
dcos package install spark
dcos spark --help
