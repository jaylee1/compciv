cd data-hold
pdftotext -layout calidr.pdf
cat calidr.txt | sed -n -e 's/^.*Living//p' | cut -c 10- | cut -c -3
