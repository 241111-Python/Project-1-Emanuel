#!/usr/bin/env bash

# source ./wonderPick.sh

source pullrate-tracker.sh

function createStatFile(){
 if [ -e "/mnt/c/Week1Project/boosterPackLog.txt" ]; then
    echo "Log Updated."
 else
    touch "/mnt/c/Week1Project/boosterPackLog.txt"
    echo "New log has been made!"
 fi
}


function printLog() {
    
    paste "/mnt/c/Week1Project/packTracker.txt" "/mnt/c/Week1Project/pullRateTracker.txt" "/mnt/c/Week1Project/date.txt" | while IFS=$'\t' read -r line1 line2 line3; do
        packsOpened=$(echo "$line1" | grep -o '[0-9]\+')
        pullRate=$(echo "$line2" | grep -o '[0-9]\+')
        time="$line3"  

    
        echo "Packs Opened: $packsOpened" >> "/mnt/c/Week1Project/boosterPackLog.txt"
        echo "Pull Rate Percentage: $pullRate%" >> "/mnt/c/Week1Project/boosterPackLog.txt"
        echo "Time: $time" >> "/mnt/c/Week1Project/boosterPackLog.txt"
        echo "" >> "/mnt/c/Week1Project/boosterPackLog.txt"
    done
}





createStatFile

printLog

#/mnt/c/Week1Project