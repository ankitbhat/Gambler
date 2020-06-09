#!/bin/bash -x
stake=100;
bet=1;
win=0;
loss=0;
random=$(( $RANDOM%2 ));
if [[ $random -eq 1 ]]
	then
	win=$(( $win+1 ));
	echo Win Amount = $win
	else
	loss=$(( $loss+1 )); 
	echo Loss Amount = $loss
fi
