#!/bin/bash

# reading user's input (path)
echo "Enter the absolute path to the directory from which you want to extract pictures:"


while true; do
    read
    if test -d $REPLY; then
        break
    else
        echo -e "\n"$REPLY" is not a valid absolute path!"
        echo -e "Please try again.\n"
    fi
done

path=$REPLY
echo -e "\nPictures will be extracted from the following directory:"
echo -e $path"\n"
echo -e "Starting extraction...\n"

