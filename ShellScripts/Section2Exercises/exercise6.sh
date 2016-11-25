#!/bin/bash
read -p "Please input a file or directory name: " FNAME
if [ -f ${FNAME} ]
then
  echo "${FNAME} is a regular file."
elif [ -d ${FNAME} ]
then
  echo "${FNAME} is a directory."
else
  echo "${FNAME} is some other type of file."
fi

ls -l ${FNAME}
