#!/bin/bash

#This is the testing ground for RJP initial setup script.

#Initial Create

mkdir userFolders
#Should we create database here -!?

#Collect information
#add to  database - !
echo "What is your first name?"
read firstName

echo "What is your last name?"
read lastName

echo "Please choose a username?"
read userName

echo "Please enter your sober date as mm/dd/yyyy."
read soberDate

#Create user folders.

cd userFolders
mkdir $userName
cd $userName
touch database
mkdir quotes
mkdir internetContent
mkdir journal

#IDEAS
#Each journal entry is different text file and we add them all together to read
