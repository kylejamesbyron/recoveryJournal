#!/bin/bash
# A script to determine your sober date.

echo "How many days have you been sober?"

read startSober

daysSober=$(($startSober+1))

echo $((($(date +%s)-$(date +%s --date "2022-12-28"))/(3600*24))) days

echo $daysSober


