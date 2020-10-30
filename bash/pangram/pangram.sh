#!/usr/bin/env bash

main () {
  if [[ ${#1} -lt 26 ]]; then
    echo "false"
    return
  fi
  ALPHABET="abcdefghijklmnopqrstuvwxyz"
  input=`echo $1 |  sed "s/[^a-zA-Z0-9]//g" | tr '[:upper:]' '[:lower:]'`
  for (( i=0; i<${#ALPHABET}; i++ )); do
    if ! [[ "$input" =~ "${ALPHABET:i:1}" ]]; then
      echo "false"
      return
    fi
  done
  echo "true"
}

main "$@"
