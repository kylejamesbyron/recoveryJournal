#!/bin/bash
# A script to determine your sober date.

now=$(date +%s)
echo $now

past=$(date +%s --date "1999-12-28")
echo $past

difference=$(($now-$past))
echo $difference

seconds=$(($difference/(3600*24)))
echo $seconds

echo $(($seconds/364))
