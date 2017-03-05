#!/bin/sh
#161003.1506


URL1='portesouvertes.epfl.ch'
URL2='portesouvertes-test.epfl.ch'

find . -name '*.html' -execdir sed -i.bak2 -E 's/value="[^"]+">/value="toto"/g' {} \;
find . -name '*.html' -execdir sed -i.bak2 -E 's/login\?requestkey=[^"]+">/login\?requestkey=toto"/g' {} \;
find . -name '*.html' -execdir sed -i.bak2 -E 's/<\/th><td> [^"]+ <\/td><\/tr>/<\/th><td> toto <\/td><\/tr>/g' {} \;

find . -name '*.bak2' -exec rm -R {} \;



#diff -rq test1/$URL1/ test2/$URL2/ |grep diff
diff -r test1/$URL1/ test2/$URL2/


