#!/bin/bash

# Begnining to the journal functions of RJP.

dateFormat=$(date +%F)


echo "Welcome to Recovery Journal $user.  Today's date is:   $dateFormat"

echo "1. Read Journal"
echo "2. New Entry"
echo "3. List Entries"
echo "4. Read Entry"

read option

echo $option

if [ $option = 1 ]
then
	echo "Read Journal"
elif [ $option = 2 ]
then	
	echo "New Entry"
	touch $dateFormat.txt
	echo $(date) >> $dateFormat.txt
	nano $dateFormat.txt
elif [ $option = 3 ]
then
	echo "List entries."
	ls
elif [ $option = 4 ]
then
	echo "Read Entry"
fi
