#!/bin/bash
#empty trashbin

trashbin=/home/smult/trash

#list the amount of files in trashbin and gives warning message
amountFiles=$(ls -l $trashbin | wc -l)
echo "there are $amountFiles files in the trashbin"
echo "are you sure you want to delete all files?"
read userInput

if [ $userInput == "yes" ] || [ $userInput == "y" ]; then
	rm -rf $trashbin/*
	echo "all files deleted"
elif [ $userInput == "no" ] || [ $userInput == "n" ]; then
	echo "exiting script ..."
else
	echo "please answer with yes(y) or no(n)"
fi
