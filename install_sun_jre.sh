#!/bin/bash

echo "Installe la dernière version de SUN JAVA JRE"
ZVER="161110.1304"
echo -e "zf "$ZVER

RED='\033[1;31m'
GREEN='\033[1;32m'
NOCOL='\033[0m'

echo -e ${GREEN}$0 "start..."${NOCOL}

echo "deb http://www.duinsoft.nl/pkg debs all" | sudo tee -a /etc/apt/sources.list 1>/dev/null
sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 5CB26B26
echo "----------------apt-get update..."
sudo apt-get update > /dev/null
echo "----------------apt-get install..."
sudo apt-get -y install update-sun-jre

echo ""
echo -e ${GREEN}$0 "end..."${NOCOL}
echo ""

