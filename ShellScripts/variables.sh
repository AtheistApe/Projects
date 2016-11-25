#!/bin/bash
MY_SHELL="bash"

# To use the contents of the variable, preceed it with a '$' sign.
echo "I like the $MY_SHELL shell"

# If the contents of the variable will be immediately preceeded or
# followed by additional data.
echo "I like ${MY_SHELL}ing out scripts"

# To assign a variable the output of a command, place the command within '()'
# and preceed it with a '$' sign. In older scripts, the same functionality is
# attained by putting the command in ``.
THIS_SHELL=$(echo $SHELL)
SERVER_NAME=$(hostname)
CURRENT_DIRECTORY=`pwd`

echo "The default system shell is $THIS_SHELL"
echo "You are running this script on ${SERVER_NAME}."
echo "The current directory is ${CURRENT_DIRECTORY}."

# Tests are performed by placing conditional expressions within [].
# The syntax is: [ contition-to-test-for ]. To see a list of possible tests,
# enter 'help test' or 'man test'.
#
# For example '[ -e /etc/passwd ]', the '-e' tests if the following file
# exists; If so. returns true

echo ''
if [ -e /etc/passwd ]
then
  echo "The '/etc/passwd' file exists."
else
  echo "The '/etc/passwd' file DOES NOT exist"
fi

# Within tests, put variables in quotes to prevent unexpected side effects.
echo ''
if [ "$MY_SHELL" = "bash" ]
then
  echo "You seem to like the bash shell."
fi

# The if/else/elif commands
echo ''
MY_SHELL="zsh"

if [ "MY_SHELL" = "bash" ]
then
  echo "You seem to like the bash shell."
elif [ "MY_SHELL" = "csh" ]
then
  echo "You seem to like the csh shell."
else
  echo "You don't seem to like the bash or csh shells."
fi

# The 'for' loop. The syntax is:
# for VARIABLE_NAME in ITEM_1 ... ITEM_N
# do
#   command_1
#   command_2
#   command_N
# done
echo ''
for COLOR in red green blue
do
  echo "COLOR: $COLOR"
done

# Can also store the list of items in a variable as below:
echo ''
COLORS="red green blue"
for COLOR in $COLORS
do
  echo "COLOR: $COLOR"
done

# The following code renames pictures ending in 'jpg' by prefixing them with
# the current date. First create a collection of empty files ending in 'jpg':
for INDEX in 1 2 3 4 5 6 7 8 9 10
do
  touch "file${INDEX}.jpg"
done
# Now rename these files:
echo ''
PICTURES=$(ls *jpg)
DATE=$(date +%F)

for PICTURE in $PICTURES
do
  echo "Renaming ${PICTURE} to ${DATE}-${PICTURE}"
  mv ${PICTURE} ${DATE}-${PICTURE}
done

# Uncomment the following line to remove the previously created files
rm *.jpg

# Positional Parameters. These are variables that contain the contents of the
# command line. If the command line is:
#
# $ scrript.sh param1 param2 param3
#
# then the positional paramaters are/contain:
# $0: "script.sh"
# $1: "param1"
# $2: "param2"
# $3: "param3"
#
# Can have up to 9 positional paramaters $0 ... $9
#
# For example, the following code (contained in the file
# 'archive_user.sh') creates an archive of the current
# users home directory.
#
# #!/bin/bash
# ARCHIVE_DIR="/archives/"
# echo "Executing script: $0"
# echo "Checking if archive directory already exists. If not, create it."
# if [ ! -d $ARCHIVE_DIR ]
# then
#   echo "Making directory ${ARCHIVE_DIR}."
#   sudo mkdir $ARCHIVE_DIR
# else
#   echo "$ARCHIVE_DIR already exists."
# fi
#
# echo "Archiving user: $1"
# # Lock the account
# passwd -l $1
# # Create an archive of the home directory.
# tar cf ${ARCHIVE_DIR}${1}.tar.gz /home/${1}
