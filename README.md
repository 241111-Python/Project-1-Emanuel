# Wonder Pick Game!

Simple game created using bash scripts to simulate a card picker that will return win percentage statistics

## How to Run

Once in the directory of the project open a bash terminal and run the command 'bash wonderPick.sh' to run the game script.
From there follow the prompt and play the game.

The **boosterPackLog.txt** file contains all the information in regards to each play session condensed for readability (packs opened, percentage of correct cards picked, date)

To automatically update the boosterPackLog using a cron job, run the command **'crontab -e'** in ubuntu and then run  **'* * * * * /mnt/c/Week1Project/printLog.sh'** 


