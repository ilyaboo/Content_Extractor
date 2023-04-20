#!/bin/bash

# reading user's input (path)
echo "Enter the absolute path to the directory from which you want to extract pictures:"
while true; do
    read
    if test -d $REPLY; then   # checking if the path is valid
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

mkdir pictures_extracted

formats_pic=(".jpeg" ".jpg" ".png" ".heif" ".bmp")

for format in ${formats_pic[@]}; do   # iterrating over picture formats
    mkdir pictures_extracted/$format   # creating a directory for a format
    find $path -type f -name "*$format" -exec cp {} pictures_extracted/$format \;
done

echo "Done!"