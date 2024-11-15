#!/usr/bin/env bash

pullRate=()             #array to store all pull rates between instances 
packsOpened=()          #array to store all number of packs during each instance 
packOpenDate=()         #array to store all dates acquired in each instance

averagePullRate=0       #initialized average pull rate variable with 0

function createStatFile(){                                 #creates the boosterPackLog.txt file which is called in the printLog function
 if [ -e "boosterPackLog.txt" ]; then
    echo "Log Updated."
 else
    touch "boosterPackLog.txt"
    echo "New log has been made!"
 fi
}


function addStats(){                                        #function to add all values to their respective arrays every time script runs
   pullRate+=("$1")
   packsOpened+=("$2")
   packOpenDate+=("$3")
}

function getTotalPackNumber(){                              #this function reads through the packTracker file and adds ALL rows to display in the console the total number of packs that have been opened
 totalPackSum=0
 while IFS= read -r line; do
     packsOpened=$(echo "$line" | grep -o '[0-9]\+')  
     totalPackSum=$((totalPackSum + packsOpened))  
 done < "packTracker.txt"  
 echo "Total Packs Opened: $totalPackSum"
}

function getAveragePullRate(){                              #function gets the average pull rate for each instance the player opens packs until they stop playing to display in the console
 summonCounter=0
 totalPullRate=0
 while IFS= read -r line; do
     pullRate=$(echo "$line" | grep -o '[0-9]\+')
     summonCounter=$((summonCounter + 1))
     totalPullRate=$((totalPullRate + pullRate))
 done < "pullRateTracker.txt"

 averagePullRate=$((totalPullRate / summonCounter))
 echo "Your average pull rate in $totalPackSum packs is $averagePullRate%"
}



function printStatsToFiles(){                                                         #function to add all values from all arrays into their respective txt files 
echo "Correct Card Percentage: ${pullRate[@]}%" >> "pullRateTracker.txt"
echo "Packs Opened: ${packsOpened[@]}"  >> "packTracker.txt"
echo "Time: $packOpenDate" >> "date.txt"
}



