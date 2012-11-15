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
echo ""
echo "Hello $NAME! Are you ready for some mad math?"
echo ""
echo "Select (1) for Addition(+) or (2) for Subtraction(-)"
read TYPE
echo ""
echo "Enter math level or type (r) for random..."
read LEVEL
echo "$treset"
numc=0
numw=0
# Loop till either X for exit or L for new level is entered
for (( ; ;))
do 
RANGE2=9
number2=$RANDOM
let "number2 %= $RANGE2"
if [ $LEVEL = 'r' ];
then
RANGE1=9
number1=$RANDOM
let "number1 %= $RANGE1"
else
number1=$LEVEL
fi
if [ $TYPE = 1 ];
then
echo "$number1 + $number2 = ?"
else
	if [ $number1 -ge $number2 ];
		then
echo "$number1 - $number2 = ?"
else
	echo "$number2 - $number1 = ?"
fi
fi
echo ""
echo "Type an answer and hit ENTER (t - change add/sub, l - change level, x - exit)"
selection=$number2

read ANSWER
if [ $TYPE = 1 ];
then
CORRECT=$(($number1 + $selection))
else
	if [ $number1 -ge $number2 ];
		then
CORRECT=$(($number1 - $selection))
else
CORRECT=$(($selection - $number1))
fi
fi	
if [ $ANSWER = $CORRECT ];
then
numc=$((1+$numc))
echo ""
echo "Correct: $numc | Incorrect: $numw"
echo $bldgreen"CORRECT!!!" $treset
echo ""
elif [ -z "$ANSWER" ]; 
then
echo "Please enter an answer"
elif [ $ANSWER = 'l' ];
then
echo ""
echo "Enter a new math level or type (r) for random..."
read LEVEL
echo ""
numc=0
numw=0
elif [  $ANSWER = 't' ];
then
echo ""
echo "Select (1) for Addition(+) or (2) for Subtraction(-)"
read TYPE
echo ""
numc=0
numw=0
elif [  $ANSWER = 'x' ];
then 
echo ""
echo "Great Job $NAME! See you next time for MAD MATH! $treset"
echo "Your score was $numc correct and $numw wrong"
echo ""
exit
else
numw=$((1+$numw))
echo ""
echo "Correct: $numc | Incorrect: $numw" 
echo $bldred"Ooops...wrong "
echo "The correct answer is: "$(($number1+$selection)) $treset
echo ""
fi
done