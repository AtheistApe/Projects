#!/bin/bash

FILE=$1

if [[ $FILE =~ (.+)\.c ]]
then
  FILE_NAME=${BASH_REMATCH[1]}
  # echo $FILE_NAME
else
  echo "$FILE is NOT a c file"
  exit 1
fi

# cc -std=c99 -Wall -Wstrict-prototypes -ansi -pedantic -g $FILE -o $FILE_NAME
# cc -std=c99 -Wall -Wstrict-prototypes -ansi -g $FILE -o $FILE_NAME
cc -std=c99 -Wall -Wstrict-prototypes -ansi -pedantic $FILE -o $FILE_NAME
