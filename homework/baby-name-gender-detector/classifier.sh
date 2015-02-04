# this script expects `helper.sh` to have created a 
# file at ./data-hold/namesample.txt to use
datafile='data-hold/namesample.txt'

# for now, set name to a constant
name=$name
if [[ $@ == '' ]]; then
echo "Pleae input at least one name, dipshit"
fi

for name in "$@"; do
# this step matches every line with the $name followed 
#   immediately by a comma
#   So that "Pat" doesn't match "Patrick" and "Patty"
name_matches=$(cat $datafile | grep "$name,")

# we'll set up a couple of variables at 0
# and for each value in $name_matches, sum up the
# baby count by gender
m_count=0
f_count=0  

# for each value in $name_matches
for row in $name_matches; do
  # get the baby count, which is in the third column, i.e.
  # Jessie,F,999
  # and set it to the `babies` variable
  babies=$(echo $row | cut -d ',' -f '3')
  if [[ $row =~ ',M,' ]]
    then    
      # if the row is for male babies,
      # add to $m_count
      # Note that in shell arithmetic, you don't have to use
      # the dollar sign to reference the variables
      m_count=$((m_count + babies))
    else
	f_count=$((f_count + babies))
      ##### HEY YOU
      # You fill in the code here. Should
      # be similar to the branch above
  fi      
done
# The for-loop needed to sum up the babies is done

# let's calculate a percentage of babies that are female
#  and make it a whole number, i.e.
#  num_of_girl_babies 
#     divided by (boys + girls), then multipled by 100
if [[ m_count -eq 0 && f_count -eq 0 ]]; then echo "$name,NA,0,0"
else
total_babies=$((m_count + f_count))

#### NOTE:
# This next step will result in an ERROR if both 
# $m_count and $f_count are 0. Another way to think 
# of it is that $name_matches, which was used for the
# for-loop, is empty.
#
#    (also, remember you have to print something like:
#       Zarkkon,NA,0,0
#     for the no-boys-or-girls scenario)
#
# Either way, you need some kind of conditional branching
# to deal with that situation before you reach this next
# command or you will get an error:
pct_female=$((100 * f_count / total_babies))
pct_male=$((100 * m_count / total_babies))

# If the percentage is greater to or equal to 50
if [[ $pct_female -ge 50 ]]; then
  g_and_pct="F,$pct_female"

elif [[ $pct_female == 50 ]]; then
	g_and_pct="F,$pct_female"

else
  ##### HEY YOU
  # You fill in the code here. Should
  # be similar to the branch above
	g_and_pct="M,$pct_male" 

fi

# If you've fixed the code properly, and name=Jessie,
# this line should print out:
# Jessie,M,57,1902 
echo "$name,$g_and_pct,$total_babies"
# When that works, remove the hardcoded $name value and move
# on to the next step of modularizing the script
fi
done
