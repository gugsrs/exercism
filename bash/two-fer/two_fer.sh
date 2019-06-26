#!/usr/bin/env bash

set -o errexit

main() {
  name="you"
  if (( $# >= 1 )); then
	name=$1
  fi
  echo "One for $name, one for me."
}

main "$@"
