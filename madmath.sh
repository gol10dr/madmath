#!/bin/bash
# set the colors for correct and incorrect
bldred=$(tput setaf 1)
bldgreen=$(tput setaf 2)
bldyellow=$(tput setaf 3)
treset=$(tput sgr0)
# Clear screen and begin app
clear
echo $bldyellow"What's your name?"
read NAME
echo "Hello $NAME! Are you ready for some mad math?"
echo ""
echo "Select (1) for Addition(+) or (2) for Subtraction(-)"
read TYPE
echo "Enter math level... $treset"
read LEVEL
numc=0
numw=0
# Loop till either X for exit or L for new level is entered
for (( ; ;))
do 
RANGE=10
number=$RANDOM
let "number %= $RANGE"
if [ $TYPE = 1 ];
then
echo "$LEVEL + $number = ?"
else
	if [ $LEVEL -ge $number ];
		then
echo "$LEVEL - $number = ?"
else
	echo "$number - $LEVEL = ?"
fi
fi
echo ""
echo "Type an answer and hit ENTER (t - change add/sub, l - change level, x - exit)"
selection=$number

read ANSWER
if [ $TYPE = 1 ];
then
CORRECT=$(($LEVEL + $selection))
else
	if [ $LEVEL -ge $number ];
		then
CORRECT=$(($LEVEL - $selection))
else
CORRECT=$(($selection - $LEVEL))
fi
fi	
if [ $ANSWER = $CORRECT ];
then
numc=$((1+$numc))
echo "Correct: $numc | Incorrect: $numw"
echo $bldgreen"CORRECT!!!" $treset
elif [ -z "$ANSWER" ]; 
then
echo "Please enter an answer"
elif [ $ANSWER = 'l' ];
then
echo "Enter a new math level.."
read LEVEL
numc=0
numw=0
elif [  $ANSWER = 't' ];
then
echo "Select (1) for Addition(+) or (2) for Subtraction(-)"
read TYPE
numc=0
numw=0
elif [  $ANSWER = 'x' ];
then 
echo "Great Job $NAME! See you next time for MAD MATH! $treset"
echo "You got $numc correct and $numw wrong on $LEVEL's"
exit
else
numw=$((1+$numw))
echo "Correct: $numc | Incorrect: $numw" 
echo $bldred"Ooops...wrong "
echo "The correct answer is: "$(($LEVEL+$selection)) $treset
fi
done