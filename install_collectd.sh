#!/bin/bash
#Installation de collectd pour pousser sur le Grafana de siipc6.epfl.ch
#zf161109.1143


echo ---------- install and setup collectd
sudo apt-get -y install collectd

sudo cp /vagrant/collectd_graphite.conf /etc/collectd/collectd.conf.d/graphite.conf

sudo service collectd restart
