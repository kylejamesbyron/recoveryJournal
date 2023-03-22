#!/bin/bash


echo "Lets get started!"

echo "Please enter your first name."

read firstName

echo "Please enter your last name."

read lastName

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

echo firstName=$(db_get firstName)
echo lastName=$(db_get lastName)
echo soberDate-$(db_get soberDate)