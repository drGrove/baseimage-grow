#/bin/bash

URL=https://raw.github.com/grow/pygrow/$1/install.py

scratch=$(mktemp -d -t tmp.XXXXXXXXXX) || exit
script_file=$scratch/install_growsdk.py

curl -fsSL $URL > $script_file || exit
chmod 775 $script_file

echo "Running install script from: $script_file"
python $script_file --force
