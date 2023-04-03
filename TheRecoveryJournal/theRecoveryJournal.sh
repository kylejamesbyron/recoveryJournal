#!/bin/bash

# A program for the Recovering Addict.
# Stripped down version 23.04

dateFormat=$(date +%F)

#Welcome Screen
clear

echo "Welcome to The Recovery Journal."

sleep 1s

echo "A program for the Recovering addict."

sleep 1s

echo "First lets login."

echo "What is your first name?"
read firstName
clear
echo "What is your last name?"
read lastName
clear

# Define Database location
DATABASE_FILE=~/Documents/GitHub/recoveryJournal/TheRecoveryJournal/Data/$lastName.$firstName.csv

function db_clear() {
  rm -f "$DATABASE_FILE"
}
 
function db_set() {
  echo "$1,$2" >> "$DATABASE_FILE"
}
 
function db_get() {
  grep "^$1," "$DATABASE_FILE" | sed -e "s/^$1,//" | tail -n 1
}
 
function db_remove() {
  db_set $1 ""
}

function mainMenu() {

        journalFolder = ~/Documents/GitHub/recoveryJournal/TheRecoveryJournal/Data/$lastName.$firstName/
        cd $journalFolder
        clear
        echo "Welcome to The Recovery Journal."
        echo "Sober since $(db_get soberDate)!"

        sleep 1s

        echo "1. New Entry"
        echo "2. Exit"
        echo "Please input number of your choice:"

        read option
        sleep 2s
        clear

  
        elif [ $option = 1 ]
        then
                echo "New Entry"
                echo "" >> $journal.txt
                echo $(date) >> $journal.txt
                echo "" >> $journal.txt
                nano $journal.txt
        elif [ $option = 2 ]
        then
                exit
        fi
        sleep 2s
        clear

        mainMenu
}

echo "Please enter your password:"
read password

# if password is correct then proceed. -function
if [ $password = $(db_get password) ]
then
        echo "Welcome to Recovery Journal $firstName!"
else    
        echo "Wrong Password!"
        sleep 5s
        exit
        

fi

# clear


echo "Did you stay sober today? (Y/N)"
read soberToday

if [ $soberToday = "Y" ]
then 
        echo "Congratulations!"
        sleep 1s
        clear
elif [ $soberToday = "N" ]
then    
        echo "That's okay!  Stay sober today."
        # script to change soberdate
fi

# write  if then for soberToday.

clear

echo "Welcome to Recovery Journal $firstName!"

# Just for testing:
echo "Password is $(db_get password)"


# Need a function to calculate days since sober date.

mainMenu



echo "Test Text"
