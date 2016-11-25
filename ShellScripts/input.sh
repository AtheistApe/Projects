#!/bin/bash
# To read user input from the console (STDIN), use the 'read' command. The
# syntax is:
#
# read -p "PROMPT" VARIABLE
#
read -p "Enter a user name: " USER
echo "Archiving user:  $USER"
