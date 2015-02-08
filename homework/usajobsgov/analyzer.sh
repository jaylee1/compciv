cd data-hold
cd $@
cd temp
yearly_jobs=$(cat *.json | ~/bin_compciv/jq '.JobData[] | select(.SalaryBasis == "Per Year")')
simple_rows=$(echo $yearly_jobs | ~/bin_compciv/jq '. | {JobTitle, SalaryMin, SalaryMax}')

while read line; do
title=$(echo $line | grep -oE '[[:alpha:]].+');
filtered_rows=$(echo $simple_rows | ~/bin_compciv/jq "select(.JobTitle == \"$title\")" );
min=$(echo $filtered_rows |  ~/bin_compciv/jq -r '.SalaryMin' | tr -d '$' | tr -d ',' | sort -n | head -n 1);
max=$(echo $filtered_rows |  ~/bin_compciv/jq -r '.SalaryMax' | tr -d '$' | tr -d ',' | sort -n | head -n 1);
echo "$title | $min | $max";
done < <(echo $simple_rows | ~/bin_compciv/jq -r '.JobTitle' | sort | uniq -c | sort -rn | head -n 25)


