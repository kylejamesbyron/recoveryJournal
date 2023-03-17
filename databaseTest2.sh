#!/bin/bash
 
DATABASE_FILE=dab.csv
 
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

db_clear
 
db_set key key1
# key=key1
echo key=$(db_get key)  
 
db_set key key2
# key=key2
echo key=$(db_get key)
 
db_set name helloacm
db_set age 20
 
# name=helloacm
echo name=$(db_get name)
# age=20
echo age=$(db_get age) 
# 404=
echo 404=$(db_get 404)
 


echo "Testing here"
db_set maisom Mark
echo maisom=$(db_get maisom)

echo "This is $(db_get maisom)"

#echo DATBASE contents
# key,key1
# key,key2
# name,helloacm 
# age,20
# The following displays the whole Database.
#cat "$DATABASE_FILE"