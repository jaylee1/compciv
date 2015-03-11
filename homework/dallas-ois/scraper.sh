mkdir -p data-hold
cd data-hold
curl -s http://www.dallaspolice.net/ois/ois.html > 2013-14.html
curl -s http://www.dallaspolice.net/ois/ois_2012.html > 2012.html
curl -s http://www.dallaspolice.net/ois/ois_2011.html > 2011.html
curl -s http://www.dallaspolice.net/ois/ois_2010.html > 2010.html
curl -s http://www.dallaspolice.net/ois/ois_2009.html > 2009.html
curl -s http://www.dallaspolice.net/ois/ois_2008.html > 2008.html
curl -s http://www.dallaspolice.net/ois/ois_2007.html > 2007.html
curl -s http://www.dallaspolice.net/ois/ois_2006.html > 2006.html
curl -s http://www.dallaspolice.net/ois/ois_2005.html > 2005.html
curl -s http://www.dallaspolice.net/ois/ois_2004.html > 2004.html
curl -s http://www.dallaspolice.net/ois/ois_2003.html > 2003.html

cat *.html | ~/bin_compciv/pup 'a' | grep 'narrative' | cut -c 10- | cut -d '"' -f 1 > urls.txt
mkdir -p pdfs
mv urls.txt pdfs
cd pdfs
allthings=$(cat urls.txt)
mv urls.txt ..
for x in $allthings; do echo 'I am downloading' http://www.dallaspolice.net$x; curl http://www.dallaspolice.net/$x -O; done
for file in *.pdf; do pdftotext $file; done
for file in *.txt; do text=$(cat $file); echo $text > $file; done

