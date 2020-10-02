#!/usr/bin/env bash

declare -A matching_brackets=(["]"]="[" [")"]="(" ["}"]="{")

main () {
    BRACKETS_OPEN="[({"
    characters=""
    for char in `echo $1 |  sed '/[[:alnum:]]*[[:punct:]]*/{ s/[^][)(}{]//g}' | sed -e "s/\(.\)/\1\n/g"`; do
        if [[ "$BRACKETS_OPEN" =~ "$char" ]]; then
            characters+="${char}"
        elif [[ "${#characters}" -eq 0 ]]; then
            echo "false"
            return
        else
            length=$(("${#characters}" - 1))
            last_char="${characters:length:1}"
            if [[ "${last_char}" != "${matching_brackets[$char]}" ]]; then
                echo "false"
                return
            fi
            characters="${characters:0:length}"
        fi
    done
    if [[ "${#characters}" -gt 0 ]]; then
        echo "false"
        return
    fi
    echo "true"
}

main "$@"
