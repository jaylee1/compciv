cd data-hold
cat *.html | ~/bin_compciv/pup 'table table tr json{}' |   ~/bin_compciv/jq  --raw-output '.[] .children | [ 
    .[0] .children[0] .href,
    .[0] .children[0] .text,
    .[1] .text ,
    .[2] .text,
    .[3] .text,
    .[4] .text,
    .[5] .text,
    .[6] .text,
    .[7] .text
  ] | @csv' > data.csv

csvfix echo -osep '|' -smq data.csv > data.psv
cat data.psv | grep -v Officer > data.psv

cat data.psv | cut -d '|' -f 4 | grep -v 'Location'| grep -v 'Handgun' | tr ' ' '+' > locations-urls.psv
cat data.psv | cut -d '|' -f 4 | grep -v 'Location'| grep -v 'Handgun' > locations.psv

url=https://maps.googleapis.com/maps/api/geocode/json?address=
API=AIzaSyCCcENig6toflWOjr1f0cbbwsp8wLVZvTo
location=$(cat locations-urls.psv)
filler=',+Dallas,+TX&key='
for x in $location; do curl -s $url$x$filler$API > $x.json ; done
echo "location|latitude|longitude|" > geocodes.psv

for file in *.json; do geocodes=$(cat $file | jq -r '.results[0] | [.formatted_address, .geometry.location.lat, .geometry.location.lng] | @csv');  echo $file","$geocodes >> geocodes.csv; done
csvfix echo -osep '|' -smq geocodes.csv > geocodes.psv
