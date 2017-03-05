#!/bin/sh
#161007.1534

rm -R test1
rm -R test2
mkdir test1
mkdir test2

URL1='jahia201.epfl.ch\:8080/site/portesouvertes/home'
URL2='jahia202.epfl.ch\:8080/site/portesouvertes/home'

echo wget $URL1 on test1
wget -p -k -E -m -e robots=off –w 2 --no-parent -U mozilla "http://$URL1" -P ./test1
echo wget $URL2 on test2
wget -p -k -E -m -e robots=off –w 2 --no-parent -U mozilla "http://$URL2" -P ./test2

echo sed 1
find . -name '*.html' -execdir sed -i.bak2 -E 's/value="[^"]+">/value="toto"/g' {} \;
echo sed 1
find . -name '*.html' -execdir sed -i.bak3 -E 's/login\?requestkey=[^"]+">/login\?requestkey=toto"/g' {} \;
echo sed 1
find . -name '*.html' -execdir sed -i.bak4 -E 's/<\/th><td> [^"]+ <\/td><\/tr>/<\/th><td> toto <\/td><\/tr>/g' {} \;

echo clean .bak*
#find . -name '*.bak2' -exec rm -R {} \;

echo diff $URL1  -  $URL2
diff -rq test1/$URL1/ test2/$URL2/ |grep diff |grep -v '.bak'
#diff -r test1/$URL1/ test2/$URL2/


