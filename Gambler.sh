#!/bin/bash -x
stake=100;
bet=1;
newAmount=100;
declare -A win_array
declare -A loss_array
TotalAmount=0;
for (( i=1;i<=20;i++ ))
do
	while [ $newAmount -lt 150 -a $newAmount -gt 50 ]
	do
	random=$(( (($RANDOM%100))%2 ));
	if [[ $random -eq 1 ]]
		then
		newAmount=$(( $newAmount+1 ));
		echo Amount Left = $newAmount
		else
		newAmount=$(( $newAmount-1 )); 
		echo Amount Left= $newAmount
	fi
	done
	TotalAmount=$(( $TotalAmount+$newAmount ))
	if [ $newAmount -ge 100 ]
		then
		win_array[Day$i]="Won by $(( $newAmount-100 )) dollars"
		else
		loss_array[Day$i]="Lost by $(( 100-$newAmount )) dollars"
	fi 
		newAmount=100;

done
if [ $TotalAmount -gt 2000 ]
	then
	echo Total Amount Won = $(( $TotalAmount-2000 ))
	else
	echo Total Amount Lost = $(( 2000-$TotalAmount ))
fi
for element in ${!win_array[@]}
do
set +x
echo $element "-" ${win_array[$element]}
done
for element in ${!loss_array[@]}
do
echo $element "-" ${loss_array[$element]}
done
