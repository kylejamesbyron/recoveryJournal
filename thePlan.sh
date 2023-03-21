#!/bin/bash

#RJP plan

#Setup
  Initial create:
    mkdir recoveryJournal
    cd recoveryJournal
    mkdir userFolders
  
  Collect information:
    firstName
    lastName
    userName
    soberDate
  Create folders
     mkdir /userFolders/userName
     cd /userFolders/userName
     mkdir data
      touch database
      mkdir quotes
      mkdir internetContent
     mkdir journal

IDEAS
each journal entry is different text file and we add them all together to read.
