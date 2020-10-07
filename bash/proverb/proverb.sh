#!/usr/bin/env bash

main () {
    for (( i=1; i<$#; i++ )); do
        next_index=$(( i + 1 ))
        echo "For want of a ${!i} the ${!next_index} was lost."
    done
    [[ -n $1 ]] && echo "And all for the want of a $1." || echo ""
}

main "$@"
