cd data-hold
cd names-nationwide

secondyear=$(cat yob$2.txt)
cat yob$1.txt | grep -v secondyear | sort
