#!/bin/bash
function hello() {
  for NAME in $@
  do
    echo "Hello ${NAME}."
  done
  return 0
}

hello Gary John James Cody Evan
