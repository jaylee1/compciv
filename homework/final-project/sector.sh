for sector in "$@"; do

cat master.csv | grep $sector |  while read -r line;
do
name=$(echo $line | cut -d '|' -f 1);
funding=$(echo $line | cut -d '|' -f 3);
status=$(echo $line | cut -d '|' -f 4);
region=$(echo $line | cut -d '|' -f 5);
founded=$(echo $line | cut -d '|' -f 6);

cat rounds.csv | while read -r rounds;
do
rname=$(echo $rounds | cut -d '|' -f 2);
type=$(echo $rounds | cut -d '|' -f 10);
date=$(echo $rounds | cut -d '|' -f 12);
amount=$(echo $rounds | cut -d '|' -f 16);

if [[ $name == $rname ]]; then
echo $name"|"$status"|"$region"|"$founded"|"$type"|"$date"|"$amount
fi
done
done
done
