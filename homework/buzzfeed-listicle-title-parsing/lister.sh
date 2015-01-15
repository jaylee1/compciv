d_start='2014-01-01'
d_end='2014-12-31'
days_diff=$(( ( $(date -ud $d_end +'%s') - $(date -ud $d_start +'%s') )/ 60 / 60 / 24 ))

for num in $(seq 0 $days_diff); do 
  file="data-hold/$(date -d "$d_start $num days" +%Y/%m/%d)"
done
