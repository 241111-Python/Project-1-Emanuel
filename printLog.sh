source ./pullrate-tracker.sh


function createStatFile(){
 if [ -e "boosterPackLog.txt" ]; then
    echo "Log exists."
 else
    touch "boosterPackLog.txt"
    echo "New log has been made!"
 fi
}


function printLog(){
echo "Packs Opened: ${packsOpened[@]}"  >> boosterPackLog.txt
echo "Number of Lucky Packs: $luckyPack" >> boosterPackLog.txt
echo "Correct Card Percentage: ${pullRate[@]}%" >> boosterPackLog.txt
echo "${date[@]}" >> boosterPackLog.txt
}

createStatFile

printLog