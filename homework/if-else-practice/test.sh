if [[ "$#" -lt 1 ]]; then
  echo "You need at least one argument"

elif [[ "$#" -eq 1 ]]; then
# just one argument 
  echo "There is just one argument: $1"

elif [[ "$#" -eq 2 ]]; then

  echo "There are two arguments: $1 and $2"

  if [[ $1 -eq $2 ]]; then
    echo "$1 is equal to $2"

  if [[ $1 -gt $2 ]]; then
    echo "$1 is greater than $2"

  if [[ $1 -lt $2 ]]; then
    echo "$1 is less than $2"
    ## write the other conditions for less-than and
    ## greater-than yourself
  fi
fi
