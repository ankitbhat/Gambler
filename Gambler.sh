#!/bin/bash -x
stake=100;
bet=1;
win=0;
loss=0;
newAmount=100;
TotalAmount=0;
for (( i=0;i<20;i++ ))
do
	while [ $newAmount -lt 150 -a $newAmount -gt 50 ]
	do
	random=$(( $RANDOM%2 ));
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
	newAmount=100;
done
if [ $TotalAmount -gt 2000 ]
	then
	echo Total Amount Won = $(( $TotalAmount-2000 ))
	else
	echo Total Amount Lost = $(( 2000-$TotalAmount ))
fi
