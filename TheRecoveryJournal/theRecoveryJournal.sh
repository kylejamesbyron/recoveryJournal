#!/bin/bash

# A program for the Recovering Addict.

#! add database functions here.
dateFormat=$(date +%F)

#Welcome Screen

echo "Welcome to The Recovery Journal."

sleep 1s

echo "A program for the Recoverying addict."

sleep 1s

echo "First lets login."

echo "What is your first name?"
read firstName

echo "What is your last name?"
read lastName

# Database = Data / $lastName.$firstName.csv

echo "Please enter your password:"

# if password is correct then proceed. -function

sleep 1s

clear

echo "Welcome to Recovery Journal $firstName!"

# Need a function to calculate days since sober date.

echo "Congratulations on $daysSober sober!"

sleep 1s

echo "1. Read Journal"
echo "2. New Entry"
echo "3. List Entries"
echo "4. Read Specific Entry"
echo "5. Read Journal"
echo "Please input number of your choice:"
read option
sleep 2s
clear

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
