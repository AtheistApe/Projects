#!/bin/bash
function file_count() {
  for FILE in $@
  do
    if [ ! -d $FILE ]
    then
      echo "${FILE} is NOT a directory"
    else
      local NUM_FILES=$(ls ${FILE} | wc -w)
      echo "There are ${NUM_FILES} files in directory ${FILE}"
    fi
  done
  return 0
}

file_count /etc /var /usr/bin ./exercise1.sh
