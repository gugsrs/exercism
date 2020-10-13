#!/usr/bin/env bash

main () {
  total_sum=0
  while read -n1 digit; do
      total_sum=$(( digit ** ${#1} + total_sum))
  done < <(echo -n "$1")
  [[ $1 -eq $total_sum ]] && echo "true" || echo "false" 
}

main "$@"
