#!/bin/bash
# this is a script to make shell scripts into commands

echo "What would you like to make executable"

read scriptName

echo "$scriptName"

#Now we ask if we should change permissions.

echo "Should we change "

chmod 755 "$scriptName"