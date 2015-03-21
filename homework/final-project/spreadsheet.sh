##create master spreadsheet containing the data I need
cat companies.csv | while read -r line;
do
name=$(echo $line | cut -d '|' -f 2);
category=$(echo $line | cut -d '|' -f 4);
funding=$(echo $line | cut -d '|' -f 6);
status=$(echo $line | cut -d '|' -f 7);
region=$(echo $line | cut -d '|' -f 10);
founded=$(echo $line | cut -d '|' -f 13);
echo $name"|"$category"|"$funding"|"$status"|"$region"|"$founded;
done > master.csv
