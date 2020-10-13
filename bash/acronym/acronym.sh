#!/usr/bin/env bash

main () {
  result=""
  for word in `echo "$1" | sed 's/-/ /g' | sed 's/[[:punct:]]*//g'`; do
    result+="${word:0:1}"
  done
  echo "${result^^}"
}

main "$@"
