cd data-hold
##joins the narratives with the data.psv
cat data.psv | while read -r line; do narrative=$(echo $line | cut -d '|' -f 1 | cut -c  26- | tr '.pdf' '.txt'); narrativetext=$(cat pdfs/$narrative); echo $line"|"$narrativetext >> newdata.psv; done
##takes the geocodes.psv and joins the data.psv using the geocodes locations (there will be multiple address, we will need to delete the first column probably
cat geocodes.psv | while read -r line; do add=$(echo $line | cut -d '|' -f 1 | tr + ' ' | cut -c -13); rest=$(echo $line | cut -d '|' -f 3,4); echo $add"|"$rest >> geocodes2.psv; done
cat newdata.psv | while read -r line; do addsearch=$(echo $line | cut -d '|' -f 4 | cut -c -12); join=$(cat geocodes2.psv | grep "$addsearch"); echo $line"|"$join >> mincidents.psv; done
##cleans up and creates final incidents.psv
cat mincidents.psv | cut -d '|' -f 2,3,4,5,6,7,8,9,10,12,13 > pincidents.psv
cat pincidents.psv | while read -r line; do first=$(echo $line | cut -d '|' -f 1,2,3,4,5,6,7,8); second=$(echo $line | cut -d '|' -f 9); third=$(echo $line | cut -d '|' -f 10,11); echo $first"|"$third"|"$second >> incidents.psv; done
cp incidents.psv ..

cat incidents.psv | cut -d '|' -f 1,2,4,5,7 > officerswork.psv
cat incidents.psv | cut -d '|' -f 1,2,5,6 > suspectswork.psv

cat officerswork.psv | while read -r line
do
start=$(echo $line | cut -d '|' -f 1,2)
suspect=$(echo $line | cut -d '|' -f 3)
weapon=$(echo $line | cut -d '|' -f 4)
officernames=$(echo $line | cut -d '|' -f 5)
echo $officernames | sed "s/\/M/\/M#/g" | sed "s/\/F/\/M#/g" | grep -oE "[^#]+" > officernames.txt
cat officernames.txt | while read -r officers
do
if [[ $suspect == 'Deceased' ]]; then
echo $start"|""TRUE""|"$weapon "|"$officers
else
echo $start"|""FALSE""|"$weapon "|"$officers
fi
done
done > finalofficers.psv


cat finalofficers.psv | while read -r line;
do
start=$(echo $line | cut -d '|' -f 1,2,3,4)
col=$(echo $line | cut -d '|' -f 5);
last=$(echo $col | cut -d ',' -f 1);
gender=$(echo $col | cut -d '/' -f 2);
rest=$(echo $col | cut -d ',' -f 2 | cut -d '/' -f 1);
num=$(echo $rest | wc -c)
sub=1
newnum=$((num - sub));
nextnum=$((newnum - sub));
race=$(echo $rest | cut -c $newnum)
first=$(echo $rest | cut -c -$nextnum)
echo $start "|" $first "|" $last "|" $race "|" $gender
done > officers.psv
cp officers.psv ..


cat suspectswork.psv | while read -r line;
do
rest=$(echo $line | cut -d '|' -f 1,2,3);
suspectnames=$(echo $line | cut -d '|' -f 4);
echo $suspectnames | sed "s/\/M/\/M#/g" | sed "s/\/F/\/M#/g" | grep -oE "[^#]+" > suspectnames.txt;
cat suspectnames.txt | while read -r suspects
do
echo $rest "|" $suspects
done
done > finalsuspects.psv

cat finalsuspects.psv | while read -r line;
do
start=$(echo $line | cut -d '|' -f 1,2,3)
sus=$(echo $line | cut -d '|' -f 4)
last=$(echo $sus | cut -d ',' -f 1)
gender=$(echo $sus | cut -d '/' -f 2)
rest=$(echo $sus | cut -d ',' -f 2 | cut -d '/' -f 1)
num=$(echo $rest | wc -c)
sub=1
newnum=$((num - sub));
nextnum=$((newnum - sub));
race=$(echo $rest | cut -c $newnum)
first=$(echo $rest | cut -c -$nextnum)
echo $start "|" $first "|" $last "|" $race "|" $gender
done > suspects.psv
cp suspects.psv ..
