#!/usr/bin/env bash

apt-get update
apt-get install -y -q software-properties-common python-software-properties
add-apt-repository ppa:webupd8team/java
apt-get update

echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
apt-get install -y -q oracle-java8-installer
java -version

apt-get install -y -q git
git --version

ssh-keygen -t rsa -f /home/vagrant/.ssh/github_rsa -C "ong.graeme@gmail.com" -N ""

echo "Host github.com" >> /home/vagrant/.ssh/config
echo "     IdentityFile ~/.ssh/github_rsa" >> /home/vagrant/.ssh/config
cat /home/vagrant/.ssh/config

chown vagrant /home/vagrant/.ssh/config
chown vagrant /home/vagrant/.ssh/github_rsa*

