##clean up the data by making new lines with {/= into \n, and then switch out the pipes into /, make it all lowercase then create it into -data
cd orig-data
cp companies.csv ..
cp rounds.csv ..
cd ..
cat companies.csv | tr { '\n' | tr '|' /| tr [:upper:] [:lower:] > companies-data.csv
cat rounds.csv | tr = '\n' | tr '|' /| tr [:upper:] [:lower:] > rounds-data.csv

##make it pipe-delimited, put it back into companies/rounds csv
csvfix echo -osep '|' -smq companies-data.csv > companies.csv
csvfix echo -osep '|' -smq rounds-data.csv > rounds.csv

rm companies-data.csv
rm rounds-data.csv

##create list of top 11 types of industries
cat companies.csv | cut -d '|' -f 4 | tr / '\n' | sort | uniq -c | sort -r | head -n 11 > top-list.txt
cat top-list.txt | cut -d ' ' -f 5 > top-sectors.txt
rm top-list.txt
