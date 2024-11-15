#!/usr/bin/env bash

# source ./wonderPick.sh

source pullrate-tracker.sh


function printLog() {           #this functiong gets all states from all txt files line by line and echos them into the boosterPackLog file to display them in an ordered and readable fashion

    paste "/mnt/c/Week1Project/packTracker.txt" "/mnt/c/Week1Project/pullRateTracker.txt" "/mnt/c/Week1Project/date.txt" | while IFS=$'\t' read -r line1 line2 line3; do        #paste command is used to read each line in all 3 text files simultaneously as if they were 1 line 
        packsOpened=$(echo "$line1" | grep -o '[0-9]\+')                                    #obtains only the number from each line in the packTracker txt file
        pullRate=$(echo "$line2" | grep -o '[0-9]\+')                                       #obtains only the number from each line in the pullRateTracker txt file  
        time="$line3"                                                                       #obtains the full date from each line in the date file                           
    
        echo "Packs Opened: $packsOpened" >> "/mnt/c/Week1Project/boosterPackLog.txt"
        echo "Pull Rate Percentage: $pullRate%" >> "/mnt/c/Week1Project/boosterPackLog.txt"
        echo "Time: $time" >> "/mnt/c/Week1Project/boosterPackLog.txt"
        echo "" >> "/mnt/c/Week1Project/boosterPackLog.txt"
    done
}





createStatFile

printLog


#/mnt/c/Week1Project