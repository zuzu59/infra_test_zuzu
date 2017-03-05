sudo apt-get update
sudo apt-get install lighttpd tree

sudo sed -i.bak 's/"\/var\/www"/"\/home\/ubuntu\/portesouvertes.epfl.ch"/' /etc/lighttpd/lighttpd.conf
sudo service lighttpd restart




