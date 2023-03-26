#!/bin/bash

# A program for the Recovering Addict.

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
        echo "Sober since $(db_get soberDate)!"

        sleep 1s

        echo "1. Read Journal"
        echo "2. New Entry"
        echo "3. List Entries"
        echo "4. Read Specific Entry"
        echo "5. Read Journal"
        echo "6. Exit"
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
        elif [ $option = 5 ]
        then
                echo "Read Journal"
        elif [ $option = 6 ]
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

clear

echo "Welcome to Recovery Journal $firstName!"

# Need a function to calculate days since sober date.

mainMenu



echo "Test Text"