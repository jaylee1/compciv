if [[ "$#" -lt 1 ]]; then
  echo "You need at least one argument"

elif [[ "$#" -eq 1 ]]; then
# just one argument 
  echo "There is just one argument: $1"

elif [[ "$#" -eq 2 ]]; then

  echo "There are two arguments: $1 and $2"

  if [[ $1 -eq $2 ]]; then
    echo "$1 is equal to $2"

  elif [[ $1 -gt $2 ]]; then
    echo "$1 is greater than $2"

  elif [[ $1 -lt $2 ]]; then
    echo "$1 is less than $2"
    ## write the other conditions for less-than and
    ## greater-than yourself
  fi

elif [[ "$#" -eq 3 ]]; then

  echo "There are three arguments: $1, $2, and $3"

  # There are a few ways to do this next part, I'm going with
  # the strategy of having one string variable for dealing
  # with comparing $1 to $2, and the other string for $1 vs $3,
  # and then concatenating them at the end.

  # You can fill out what I've done, or come up with 
  # your own branching logic

  if [[ $1 -eq $2 ]]; then
    str_a="is equal to $2"
  elif [[ $1 -lt $2 ]]; then
    str_a="is less than $2"
  elif [[ $1 -gt $2 ]]; then
    str_a="is greater than $2"
  ## and so forth
  fi
    
  if [[ $1 -eq $3 ]]; then
    str_b="is equal to $3"
  elif [[ $1 -lt $3 ]]; then
    str_b="is less then $3"
  elif [[ $1 -gt $3 ]]; then
    str_b="is greater than $3"
    ## and so forth
  fi

  # finally, echo the full comparison statement
  echo "$1 $str_a and $str_b"

### Almost done
### You need to write in one last conditional branch to deal with 
### more than 3 arguments, i.e.

else
  echo "Way too many arguments, asshole"
fi
