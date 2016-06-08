#/bin/bash!

# Install python
yum install gcc
cd /usr/src
wget https://www.python.org/ftp/python/3.4.4/Python-3.4.4.tgz
tar xzf Python-3.4.4.tgz
cd Python-3.4.4
sudo ./configure
sudo make altinstall
sudo python get-pip.py
sudo pip install virtualenv

# Install DCOS-CLI
cd
mkdir dcos && cd dcos
curl -O https://downloads.dcos.io/dcos-cli/install.sh
bash -y install.sh . http://$1.westus.cloudapp.azure.com
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
