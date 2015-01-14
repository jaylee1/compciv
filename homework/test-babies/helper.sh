# first, make the data-hold subdirectory if it doesn't already exist
mkdir -p data-hold
# then change into data-hold so that the data is downloaded there
cd data-hold
# download the file into the current directory, i.e. data-hold/
curl -o namesbystate.zip http://stash.compciv.org/ssa_baby_names/namesbystate.zip
# unzip the file; it should dump the data into your current location, i.e.
# the data-hold/ directory
unzip namesbystate.zip
# go back to the parent directory, i.e. ~/compciv/homework/test-babies
cd ..

