#!/bin/bash
# A script to start a shell script.

echo "What would you like to name your shell script."

read "name"

echo "$name"

touch "$name.sh"

echo "#!/bin/bash" >> "$name.sh"

chmod 755 "$name.sh"




