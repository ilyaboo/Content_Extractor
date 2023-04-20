#!/bin/bash

# reading user's input (path)
echo "Enter the absolute path to the directory from which you want to extract media:"
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
echo -e "\nMedia content will be extracted from the following directory:"
echo -e $path"\n"
echo -e "Starting extraction...\n"



# setting up parameters for image extraction
mkdir images_extracted   # createing directory for extracted images
cd images_extracted
formats_img=("jpeg" "jpg" "png" "heif" "bmp")   # image formats script extracts

for format in ${formats_img[@]}; do   # iterrating over picture formats
    mkdir $format   # creating a directory for a format
    find $path -type f -iname "*.$format" -exec cp {} $format \;   # searching and copying images of the format
    if [ -z "$(ls $format)" ]; then   # checking if we extracted any images of the format
        echo "No images of type: $format"
        rmdir $format   # no images of this format
    else
        echo "Ectracted images of type: $format"
    fi
done

cd ..

if [ -z "$(ls images_extracted)" ]; then   # checking if we extracted any images of any format
    rmdir images_extracted   # no images in total
    echo "NO IMAGES FOUND"
fi

echo



# setting up parameters for video extraction
mkdir videos_extracted   # createing directory for extracted vidoes
cd videos_extracted
formats_vid=("mp4" "mov" "wmv" "avi" "flv" "mkv" "webm")   # vidoe formats script extracts

for format in ${formats_vid[@]}; do   # iterrating over video formats
    mkdir $format   # creating a directory for a format
    find $path -type f -iname "*.$format" -exec cp {} $format \;   # searching and copying vidoes of the format
    if [ -z "$(ls $format)" ]; then   # checking if we extracted any video of the format
        echo "No vidoes of type: $format"
        rmdir $format   # no videos of this format
    else
        echo "Ectracted vidoes of type: $format"
    fi
done

cd ..

if [ -z "$(ls videos_extracted)" ]; then   # checking if we extracted any videos of any format
    rmdir videos_extracted   # no videos in total
    echo "NO VIDEOS FOUND"
fi

echo

echo "Done!"