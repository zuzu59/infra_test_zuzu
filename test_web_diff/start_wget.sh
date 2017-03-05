#!/bin/sh
#161003.1706

rm -R test1
rm -R test2
mkdir test1
mkdir test2

URL1='portesouvertes.epfl.ch'
URL2='portesouvertes-test.epfl.ch'

#wget -r -k --level=10 -np --span-hosts -e robots=off -D $URL1 -U mozilla 'http://'$URL1 -P ./test1
#wget -r -k --level=10 -np --span-hosts -e robots=off -D $URL2 -U mozilla 'http://'$URL2 -P ./test2

#wget -p -k -E -m -e robots=off –w 2 --no-parent  http://portesouvertes.epfl.ch
wget -p -k -E -m -e robots=off –w 2 --no-parent -U mozilla 'http://'$URL1 -P ./test1
wget -p -k -E -m -e robots=off –w 2 --no-parent -U mozilla 'http://'$URL2 -P ./test2



#diff -rq test1/$URL1/ test2/$URL2/ |grep diff

