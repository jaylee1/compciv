if [[ "$#" -lt 1 ]]; then
  echo "You need at least one argument"

elif [[ "$#" -eq 1 ]]; then

  echo "There is just one argument: $1"

elif [[ "$#" -eq 2 ]]; then

  echo "(fix this line yourself)"

fi

  if [[ $1 -eq $2 ]]; then
    echo "$1 is equal to $2"
fi
