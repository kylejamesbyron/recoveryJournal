#!/bin/bash
# A script to determine your sober date.

#now=$(date +%s)
#echo $now

#past=$(date +%s --date "1999-12-28")
#echo $past

#difference=$(($now-$past))
#echo $difference

#seconds=$(($difference/(3600*24)))
#echo $seconds

#echo $(($seconds/364))

#example
#let DIFF=($(date +%s -d 20210131)-$(date +%s -d 20210101))/86400
#echo $DIFF


#new way of doing.
echo "What year did you become sober?"
read yearSober

echo "What month did you become sober?"

DIFF=$(date +%y)

echo "$DIFF"

