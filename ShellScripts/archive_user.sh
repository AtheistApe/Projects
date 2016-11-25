#!/bin/bash

# The following code creates an archive of the current
# users home directory in an archive directory.

ARCHIVE_DIR="/archives/"
echo "Executing script: $0"
echo "Checking if archive directory already exists. If not, create it."
if [ ! -d $ARCHIVE_DIR ]
then
  echo "Making directory ${ARCHIVE_DIR}."
  sudo mkdir $ARCHIVE_DIR
else
  echo "$ARCHIVE_DIR already exists."
fi

echo "Archiving user: $1"
# Lock the account
passwd -l $1
# Create an archive of the home directory.
tar cf ${ARCHIVE_DIR}${1}.tar.gz /home/${1}

# All the positional parameters starting at $1 are stored in the variable
# '$@'. We can use this in a for loop to archive multiple users home
# directories as follows:
#
# for USER in $@
# do
#   echo "Archiving user: $USER"
#   # Lock the account
#   passwd -l $USER
#   # Create an archive of the home directory.
#   tar cf ${ARCHIVE_DIR}${USER}.tar.gz /home/${USER}
# done
