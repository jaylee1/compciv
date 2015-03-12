echo "
<!DOCTYPE html>
<html>
<head>
<title>HTML Table Cellpadding</title>
</head>
<body>
<table border="1" cellpadding="5" cellspacing="5">
<tr>
<th>
case number
</th>
<th>
date
</th>
<th>
address
</th>
<th>
suspect status
</th>
<th>
weapon
</th>
<th>
suspect
</th>
<th>
officer
</th>
<th>
grand jury
</th>
<th>latitude
</th>
<th>
longitude
</th>
<th>
narrative
</th>
</tr>" >> incidents.html

cat incidents.psv | while read -r line; do case=$(echo $line | cut -d '|' -f 1); date=$(echo $line | cut -d '|' -f 2); address=$(echo $line | cut -d '|' -f 3); status=$(echo $line | cut -d '|' -f 4); weapon=$(echo $line | cut -d '|' -f 5); suspect=$(echo $line | cut -d '|' -f 6); officer=$(echo $line | cut -d '|' -f 7); jury=$(echo $line | cut -d '|' -f 8); lat=$(echo $line | cut -d '|' -f 9); lng=$(echo $line | cut -d '|' -f 10); narrative=$(echo $line | cut -d '|' -f 11); echo "<tr><td>"$case"</td>""<td>"$date"</td>""<td>"$address"</td>" "<td>"$status"</td>""<td>"$weapon"</td>""<td>"$suspect"</td>""<td>"$officer"</td>""<td>"$jury"</td>""<td>"$lat"</td>""<td>"$lng"</td>""<td>"$narrative"</td>""</tr>"; done >> incidents.html



echo "
</table>
</body>
</html>" >> incidents.html


echo "
<!DOCTYPE html>
<html>
<head>
<title>HTML Table Cellpadding</title>
</head>
<body>
<table border="1" cellpadding="5" cellspacing="5">
<tr>
<th>
case number
</th>
<th>
date
</th>
<th>
suspect killed
</th>
<th>
weapon
</th>
<th>
first name
</th>
<th>
last name
</th>
<th>
race
</th>
<th>
gender
</th>
</tr>" >> officers.html

cat officers.psv | while read -r line; do case=$(echo $line | cut -d '|' -f 1); date=$(echo $line | cut -d '|' -f 2); killed=$(echo $line | cut -d '|' -f 3); weapon=$(echo $line | cut -d '|' -f 4); first=$(echo $line | cut -d '|' -f 5); last=$(echo $line | cut -d '|' -f 6); race=$(echo $line | cut -d '|' -f 7); gender=$(echo $line | cut -d '|' -f 8); echo "<tr><td>"$case"</td>""<td>"$date"</td>""<td>"$killed"</td>""<td>"$weapon"</td>""<td>"$first"</td>""<td>"$last"</td>""<td>"$race"</td>""<td>"$gender"</td>""</tr>"; done >> officers.html

echo "
</table>
</body>
</html>" >> officers.html

echo "
<!DOCTYPE html>
<html>
<head>
<title>HTML Table Cellpadding</title>
</head>
<body>
<table border="1" cellpadding="5" cellspacing="5">
<tr>
<th>
case number
</th>
<th>
date
</th>
<th>
weapon
</th>
<th>
first name
</th>
<th>
last name
</th>
<th>
race
</th>
<th>
gender
</th>
</tr>" >> suspects.html

cat suspects.psv | while read -r line; do case=$(echo $line | cut -d '|' -f 1); date=$(echo $line | cut -d '|' -f 2); weapon=$(echo $line | cut -d '|' -f 3); first=$(echo $line | cut -d '|' -f 4); last=$(echo $line | cut -d '|' -f 5); race=$(echo $line | cut -d '|' -f 6); gender=$(echo $line | cut -d '|' -f 7);echo "<tr><td>"$case"</td>""<td>"$date"</td>""<td>"$weapon"</td>""<td>"$first"</td>""<td>"$last"</td>""<td>"$race"</td>""<td>"$gender"</td>""</tr>"; done >> suspects.html


echo "
</table>
</body>
</html>" >> suspects.html
