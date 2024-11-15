#!/usr/bin/env bash

source ./pullrate-tracker.sh                                #Works in conjunction with pull-rate tracker file to make functional game and create tracker files for each individual statistic
echo "================================"
echo "Select a Card!"
echo -n "Select a Card from 1 to 5: "
read -r res                                                 #reads user input res
echo ""
echo "Your card is $res"

min=1                           
max=5
luckyPack=0
correctCard=$(($RANDOM % ($max - $min + 1) + $min))         #calculates a random value between 1 and 5 that the player must match

echo "The correct card is $correctCard"
openedPacks=1                                               #initialize the value of packs opened with 1 since the game will begin with an open pack

if [[ $res -eq $correctCard ]]; then
    luckyPack=$((luckyPack + 1))
    echo "Congrats!"                                        #prints congrats if the player gets the same card number as the one picked by the script
fi

echo ""

packOpenDate=$(date)

echo "================================"
echo "Would you like to open another pack? (yes/no)"    
read -r res

while [ "$res" == "yes" ]; do                               #will loop the game if the player inputs yes to the prompt, it will keep running the game until player says no
    echo -n "Select a Card from 1 to 5: "
    echo "--------------------------------"
    read -r res
    correctCard=$(($RANDOM % ($max - $min + 1) + $min))
    echo "The correct card is $correctCard"

    openedPacks=$((openedPacks + 1))

    if [[ $res -eq $correctCard ]]; then
        luckyPack=$((luckyPack + 1))
	echo "Congrats!"
    fi

    echo ""
    echo "================================"
    echo "Would you like to open another pack? (yes/no)"
    read -r res
done

echo ""

luckyPackPercentage=$((100 * luckyPack / openedPacks))      #calculates the percentage of correct cards picked from the number of packs opened in an instance     
echo "-----------------------"     
echo "Number of Lucky Packs: $luckyPack"
echo "Number of Packs Opened: $openedPacks"
echo "-----------------------" 
# echo "Percentage of lucky packs: $luckyPackPercentage%"
echo ""         

addStats "$luckyPackPercentage" "$openedPacks" "$packOpenDate"   #calls the addStats function in the pullrate-tracker script which will add these values to arrays for each statistic (percentage, number of packs, date)

printStatsToFiles #calls the printStatsToFiles function in the pullrate-tracker script to add the values in each array into their own txt files for each of the statistics 

echo "-----------------------" 
getTotalPackNumber #calls this function in the pullrate-tracker script to get the total number of packs open to be displayed in the console whenever the player finishes opening packs
getAveragePullRate #similar to the function above except it will display the average pull rate
echo "-----------------------" 

