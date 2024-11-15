#!/usr/bin/env bash

pullRate=()
packsOpened=()
packOpenDate=()

averagePullRate=0

function createStatFile(){
 if [ -e "boosterPackLog.txt" ]; then
    echo "Log Updated."
 else
    touch "boosterPackLog.txt"
    echo "New log has been made!"
 fi
}


function addStats(){
   pullRate+=("$1")
   packsOpened+=("$2")
   packOpenDate+=("$3")
}



function getTotalPackNumber(){
 totalPackSum=0
 while IFS= read -r line; do
     packsOpened=$(echo "$line" | grep -o '[0-9]\+')  
     totalPackSum=$((totalPackSum + packsOpened))  
 done < "packTracker.txt"  
 echo "Total Packs Opened: $totalPackSum"
}

function getAveragePullRate(){
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



function printArrays(){
echo "Correct Card Percentage: ${pullRate[@]}%" >> "pullRateTracker.txt"
echo "Packs Opened: ${packsOpened[@]}"  >> "packTracker.txt"
echo "Time: $packOpenDate" >> "date.txt"
}



