#!/bin/bash

# Begnining to the journal functions of RJP.

dateFormat=$(date +%F)


echo "Welcome to Recovery Journal $user.  Today's date is:   $dateFormat"

echo "1. Read Journal"
echo "2. New Entry"
echo "3. List Entries"
echo "4. Ready Entry"

read option

if $option=1
then
echo "Read Journal"
fi

touch $dateFormat.txt

echo $(date) >> $dateFormat.txt

nano $dateFormat.txt
