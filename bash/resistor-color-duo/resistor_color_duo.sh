#!/usr/bin/env bash

declare -A colors=([black]=0 [brown]=1 [red]=2 [orange]=3 [yellow]=4 [green]=5 [blue]=6 [violet]=7 [grey]=8 [white]=9)

main () {
    result=""
    for color in "$@"
    do
        result="${result}${colors[$color]}"
    done
    if [[ -z "$result" ]]; then
        echo "invalid color"
        exit 1
    fi
    echo "${result:0:2}"
}

main "$@"
