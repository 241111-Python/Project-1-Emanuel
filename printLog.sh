#!/usr/bin/env bash

# source ./wonderPick.sh

source /mnt/c/Week1Project/pullrate-tracker.sh

function createStatFile(){
 if [ -e "/mnt/c/Week1Project/boosterPackLog.txt" ]; then
    echo "Log Updated."
 else
    touch "/mnt/c/Week1Project/boosterPackLog.txt"
    echo "New log has been made!"
 fi
}


function printLog(){
while IFS= read -r line; do
  packsOpened=$(echo "$line" | grep -o '[0-9]\+')
  echo ""
  echo "Packs Opened: ${packsOpened[@]}"  >> "/mnt/c/Week1Project/boosterPackLog.txt"
 done < "/mnt/c/Week1Project/packTracker.txt"
}


createStatFile

printLog

#/mnt/c/Week1Project