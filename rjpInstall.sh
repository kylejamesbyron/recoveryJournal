#!/bin/bash

#A Script to setup Recovery Journal.

echo "Welcome to the Recovery Journal.  This file will setup the Recovery Journal environment as well as collecting some information about you."

sleep 5s

echo "Lets get started!"

echo "Please enter your first name."

read firstName

echo "Please enter your last name."

read lastName

echo "Please enter your sober date in the format YYYY-MM-DD so we can help you keep track of day's sober."

read soberDate

echo "That is all we need for now.  One moment while we setup the program.  We  will be ready for your first entry shortly."

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

db_set lastName $lastName

echo name=$(db_get lastName)
