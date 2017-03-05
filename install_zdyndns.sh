#!/bin/bash
#Installation de zdyndns
#zf16115.1425


echo ---------- install and setup supervisor
sudo apt-get -y install supervisor

sudo cp /vagrant/zdyndns_client.conf /etc/supervisor/conf.d/zdyndns_client.conf
sudo cp /vagrant/zdyndns_client.sh /home/ubuntu/zdyndns_client.sh

sudo service supervisor restart
