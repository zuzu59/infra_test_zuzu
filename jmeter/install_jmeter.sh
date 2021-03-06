#!/bin/bash

echo "Installe la dernière version de SUN JAVA JRE"
ZVER="161028.1524"
echo -e "zf "$ZVER

RED='\033[1;31m'
GREEN='\033[1;32m'
NOCOL='\033[0m'

echo -e ${GREEN}$0 "start..."${NOCOL}

echo -e ${GREEN}$0 "install JRE..."${NOCOL}
/vagrant/install_sun_jre.sh

echo -e ${GREEN}$0 "install jMeter..."${NOCOL}
JMETER='apache-jmeter-3.0'
sudo rm -R /opt/apache-jmeter
sudo mkdir /opt/apache-jmeter
cd /opt/apache-jmeter
sudo wget http://www.pirbot.com/mirrors/apache//jmeter/binaries/$JMETER.tgz
sudo tar xzf $JMETER.tgz
sudo rm /usr/bin/jmeter
sudo ln -s /opt/apache-jmeter/$JMETER/bin/jmeter /usr/bin/jmeter

echo -e ${GREEN}$0 "install done..."${NOCOL}


