#!/bin/bash

echo "Installe pleins d'utilitaires pour l'installation desktop"
ZVER="161110.1314"
echo -e "zf "$ZVER

RED='\033[1;31m'
GREEN='\033[1;32m'
NOCOL='\033[0m'

echo ""
echo -e ${GREEN}$0 "start..."${NOCOL}
echo ""

		
echo -e ${GREEN}$0 "install and configure Collectd"${NOCOL}
/vagrant/install_collectd.sh

echo -e ${GREEN}$0 "install Firefox et JAVA Sun"${NOCOL}
/vagrant/install_sun_jre.sh

echo -e ${GREEN}$0 "install xfce4 utils"${NOCOL}
sudo apt-get -y install xfce4-terminal xfce4-goodies x11vnc

echo -e ${GREEN}$0 "install conky"${NOCOL}
sudo apt-get -y install conky
echo "conky -a top_right -d" > /home/ubuntu/zconky.sh
chmod +x /home/ubuntu/zconky.sh

echo -e ${GREEN}$0 "install utils"${NOCOL}
sudo apt-get -y install git evince htop


echo ""
echo -e ${GREEN}$0 "end..."${NOCOL}
echo ""

