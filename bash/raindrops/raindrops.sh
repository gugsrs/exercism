#!/usr/bin/env bash

main () {
  raindrops=""
  if (( $1 % 3 == 0)); then
    raindrops="Pling"
  fi
  if (( $1 % 5 == 0)); then
    raindrops+="Plang"
  fi
  if (( $1 % 7 == 0)); then
    raindrops+="Plong"
  fi
  if [[ -z "$raindrops" ]]; then
    echo "$1"
  else
    echo "${raindrops}"
  fi
}

main "$@"
