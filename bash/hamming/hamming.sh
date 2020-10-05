#!/usr/bin/env bash

main () {
	if (( $# != 2 )); then
		echo "Usage: hamming.sh <string1> <string2>"
		return 1
    elif (( ${#1} != ${#2} )); then
        echo "left and right strands must be of equal length"
        return 1
	fi
    hamming=0
    for (( i=0; i<${#1}; i++ ))
    do
        left_char="${1:$i:1}"
        right_char="${2:$i:1}"
        if [ $left_char != $right_char ]; then
            hamming=$(( $hamming + 1 ))
        fi
    done 
    echo $hamming
}

main "$@"
