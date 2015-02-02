cd data-hold
pdftotext -layout calidr.pdf calidr.txt 
cat calidr.txt | grep -oE "Living.+" | grep -oE '\b[A-Z]{3}\b'
