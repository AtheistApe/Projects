#!/bin/bash
FILE="/etc/shadow"
if [ -e ${FILE} ]
then
  echo "Shadow passwords are enabled"
  if [ -w ${FILE} ]
  then
    echo "You have permissions to ${FILE}."
  else
    echo "You do NOT have permissions to ${FILE}"
  fi
else
  echo "Shadow passwords are NOT enabled."
fi
