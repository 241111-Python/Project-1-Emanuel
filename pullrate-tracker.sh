#!/usr/bin/env bash

pullRate=()
date=()
packsOpened=()


averagePullRate=0

# function createStatFile(){
#  if [ -e "boosterPackLog.txt" ]; then
#     echo "Log exists."
#  else
#     touch "boosterPackLog.txt"
#     echo "New log has been made!"
#  fi
# }


function addStats(){
   pullRate+=("$1")
   packsOpened+=("$2")
   date+=("$3")
}



function getTotalPackNumber(){
 totalPackSum=0
 while IFS= read -r line; do
     packsOpened=$(echo "$line" | grep -o '[0-9]\+')  # Store each line in the packsOpened array which is then stored in packTracker file
     totalPackSum=$((totalPackSum + packsOpened))  # Add the line's value to the totalPackSum
 done < "packTracker.txt"  # Read from the packTracker.txt file
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
echo "Correct Card Percentage: ${pullRate[@]}%" >> pullRateTracker.txt
echo "Packs Opened: ${packsOpened[@]}"  >> packTracker.txt
}

echo ${pullRate[@]}
echo ${packsOpened[@]}


# function printLog(){
# echo "Packs Opened: ${packsOpened[@]}"  >> boosterPackLog.txt
# echo "Number of Lucky Packs: $luckyPack" >> boosterPackLog.txt
# echo "Correct Card Percentage: ${pullRate[@]}%" >> boosterPackLog.txt
# echo "${date[@]}" >> boosterPackLog.txt
# }





