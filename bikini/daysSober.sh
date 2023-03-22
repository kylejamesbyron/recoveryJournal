#!/bin/bash
# A script to determine your sober date.

echo "Please enter your sober date as YYYY-MM-DD!"

read startSober

echo $((($(date +%s)-$(date +%s --date $startSober))/(3600*24))) days



