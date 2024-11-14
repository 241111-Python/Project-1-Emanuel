#!/usr/bin/env bash

source ./pullrate-tracker.sh

createStatFile


echo "Select a Card!"
echo -n "Select a Card from 1 to 5: "

read -r res
echo "Your card is $res"

min=1
max=5
luckyPack=0
correctCard=$(($RANDOM % ($max - $min + 1) + $min))
echo "The correct card is $correctCard"

openedPacks=1

if [[ $res -eq $correctCard ]]; then
    luckyPack=$((luckyPack + 1))
    echo "Congrats!"
fi

echo "Would you like to open another pack? (yes/no)"
read -r res

while [ "$res" == "yes" ]; do
    echo -n "Select a Card from 1 to 5: "
    read -r res
    correctCard=$(($RANDOM % ($max - $min + 1) + $min))
    echo "The correct card is $correctCard"

    openedPacks=$((openedPacks + 1))

    if [[ $res -eq $correctCard ]]; then
        luckyPack=$((luckyPack + 1))
	echo "Congrats!"
    fi

    echo "Would you like to open another pack? (yes/no)"
    read -r res
done

luckyPackPercentage=$((100 * luckyPack / openedPacks)) 
echo "Number of Lucky Packs: $luckyPack"
echo "Number of Packs Opened: $openedPacks"
echo "Percentage of lucky packs: $luckyPackPercentage%"


addStats "$luckyPackPercentage" "$openedPacks" "$(date)"

printArrays

getTotalPackNumber

getAveragePullRate


