#!/bin/bash -x
stake=100;
bet=1;
win=0;
loss=0;
newAmount=100;
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
