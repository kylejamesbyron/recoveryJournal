#!/bin/bash

#A Script to setup Recovery Journal.

echo "Welcome to the Recovery Journal.  This file will setup the Recovery Journal environment as well as collecting some information about you."

sleep 1s

#Collecting info for database.

echo "Lets get started!"

echo "Please enter your first name."

read firstName

echo "Please enter your last name."

read lastName

echo "Please enter your sober date in the format YYYY-MM-DD so we can help you keep track of day's sober."

read soberDate

echo "That is all we need for now.  One moment while we setup the program.  We  will be ready for your first entry shortly."

#Lets collect a simple password to implement a simple password check later.

echo "What would you like your password to be?"

read password

#create the Recovery Journal folder
mkdir TheRecoveryJournal
cd TheRecoveryJournal
mkdir Data
mkdir journals
cd journals
mkdir $lastName.$firstName
cd ..
cd Data

# Create database file.

touch $lastName.$firstName.csv

DATABASE_FILE=$lastName.$firstName.csv
 
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

# db_clear

# Now we add to the database
db_set firstName $firstName
db_set lastName $lastName
db_set soberDate $soberDate
db_set password $password


echo firstName=$(db_get firstName)
echo lastName=$(db_get lastName)
echo soberDate-$(db_get soberDate)