#!/bin/bash
FNAME=$1
if [ -d ${FNAME} ]
then
  echo "${FNAME} is a directory"
  exit 1
elif [ -f ${FNAME} ]
then
  echo "${FNAME} is a regular file"
  exit 0
else
  echo "${FNAME} is some other file"
  exit 2
fi
