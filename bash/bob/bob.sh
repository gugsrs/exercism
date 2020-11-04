#!/usr/bin/env bash

main () {
  yell="false"
  question="false"
  cleaned_string=${1// }
  if [[ -z "${cleaned_string//[$'\t\r\n']}" ]]; then
    echo "Fine. Be that way!"
    return
  fi
  if ! [[ $cleaned_string =~ [a-z] ]] && [[ $cleaned_string =~ [A-Z] ]]; then
    yell="true"
  fi
  if [[ ${cleaned_string: -1} == "?" ]]; then
    question="true"
  fi
  if [ $question == "true" ] && [ $yell == "true" ]; then
    echo "Calm down, I know what I'm doing!"
  elif [ $question == "false" ] && [ $yell == "true" ]; then
    echo "Whoa, chill out!"
  elif [ $question == "true" ] && [ $yell == "false" ]; then
    echo "Sure."
  else
    echo "Whatever."
  fi
}

main "$@"
