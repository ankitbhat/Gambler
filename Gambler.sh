#!/bin/bash -x
STAKE=100;
BET=1;
declare -A winArray
declare -A lossArray
TOTAL_DAYS=20;
MONTHLY_STAKE=2000;
function gamble(){
	read -p "Enter the betting limit for the day: " limit
	winLimit=$(( $STAKE+$limit ))
	lossLimit=$(( $STAKE-$limit ))
	newAmount=$STAKE
	while [ $newAmount -lt $winLimit -a $newAmount -gt $lossLimit ]
	do
		random=$(( (($RANDOM%100))%2 ));
		if [[ $random -eq 1 ]]
			then
			newAmount=$(( $newAmount+$BET ));
			echo Amount Left = $newAmount
			else
			newAmount=$(( $newAmount-$BET )); 
			echo Amount Left= $newAmount
		fi
	done
}
function totalGamble(){
	for (( i=1;i<=$TOTAL_DAYS;i++ ))
	do
		gamble
		totalAmount=$(( $totalAmount+$newAmount ))
		if [ $newAmount -ge $STAKE ]
			then
			winArray[Day$i]=$(( $newAmount-$STAKE ))
			else
			lossArray[Day$i]=$(( $STAKE-$newAmount ))
		fi

	done
	if [ $totalAmount -gt $MONTHLY_STAKE ]
		then
		echo Total Amount Won = $(( $totalAmount-$MONTHLY_STAKE ))
		else
		echo Total Amount Lost = $(( $MONTHLY_STAKE-$totalAmount ))
	fi
}
function daysWonOrLost(){
	for element in ${!winArray[@]}
	do
		set +x
		echo $element "-  Won by " ${winArray[$element]} "dollars"
	done
	for element in ${!lossArray[@]}
	do
		echo $element "-  Lost by " ${lossArray[$element]} "dollars"
	done
}
totalGamble
daysWonOrLost
function luckiest(){
	for element in ${!winArray[@]}
	do
		echo ${winArray[$element]}
	done| sort -nr| uniq -u| head -1
}
function unluckiest(){
	for element in ${!lossArray[@]}
        do
                echo ${lossArray[$element]}
        done| sort -nr| uniq -u| head -1
}
function luck(){
	maxWin=$(luckiest)
	maxLoss=$(unluckiest)
	for element in ${!winArray[@]}
	do
		if [ ${winArray[$element]} -eq $maxWin ]
			then
			echo Luckiest Day is $element with max win of  $maxWin dollars
		fi
	done
	for element in ${!lossArray[@]}
        do
                if [ ${lossArray[$element]} -eq $maxLoss ]
			then
                        echo Unluckiest Day is $element with max loss of  $maxLoss dollars 
                fi
	done
}
luck
