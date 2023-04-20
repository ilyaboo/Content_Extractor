#!/bin/bash

# reading user's input (path)
echo "Enter the absolute path to the directory from which you want to extract media:"
while true; do
    read
    if test -d $REPLY; then   # checking if the path is valid
        break
    else
        echo -e "\n\033[31m"$REPLY" is not a valid absolute path!"
        echo -e "Please try again.\033[0m\n"
    fi
done

path=$REPLY
echo -e "\nMedia content will be extracted from the following directory:"
echo -e $path"\n"
echo -e "\033[32mStarting extraction...\033[0m\n"



# setting up parameters for image extraction
mkdir images_extracted   # createing directory for extracted images
cd images_extracted

# image formats script extracts
formats_img=("jpg" "jpeg" "png" "svg" "gif" \
            "bmp" "tiff" "webp" "heif" "ai" \
            "eps" "psd" "xcf" "ico" "icns" \
            "pcx" "dng" "orf" "cr2")

for format in ${formats_img[@]}; do   # iterrating over picture formats
    mkdir $format   # creating a directory for a format
    find $path -type f -iname "*.$format" -exec cp {} $format \;   # searching and copying images of the format
    if [ -z "$(ls $format)" ]; then   # checking if we extracted any images of the format
        echo "No images of type: $format"
        rmdir $format   # no images of this format
    else
        num_files_extracted=$(ls $format | wc -l)   # number of files copied
        num_files_extracted=$(echo $num_files_extracted)   # removing spaced produced by wc command
        echo -e "\033[32mEctracted images of type: $format ($num_files_extracted)\033[0m"
    fi
done

cd ..

if [ -z "$(ls images_extracted)" ]; then   # checking if we extracted any images of any format
    rmdir images_extracted   # no images in total
    echo -e "\n\033[31mNO IMAGES FOUND\033[0m"
fi

echo



# setting up parameters for video extraction
mkdir videos_extracted   # createing directory for extracted vidoes
cd videos_extracted

# vidoe formats script extracts
formats_vid=("mp4" "avi" "mov" "wmv" "flv" \
            "mkv" "mpg" "3gp" "webm" "m4v" \
            "vob" "mts" "m2ts" "divx" "ogg" \
            "ogv" "mov" "rm" "rmvb" "asf")   

for format in ${formats_vid[@]}; do   # iterrating over video formats
    mkdir $format   # creating a directory for a format
    find $path -type f -iname "*.$format" -exec cp {} $format \;   # searching and copying vidoes of the format
    if [ -z "$(ls $format)" ]; then   # checking if we extracted any video of the format
        echo "No vidoes of type: $format"
        rmdir $format   # no videos of this format
    else
        num_files_extracted=$(ls $format | wc -l)   # number of files copied
        num_files_extracted=$(echo $num_files_extracted)   # removing spaced produced by wc command
        echo -e "\033[32mEctracted vidoes of type: $format ($num_files_extracted)\033[0m"
    fi
done

cd ..

if [ -z "$(ls videos_extracted)" ]; then   # checking if we extracted any videos of any format
    rmdir videos_extracted   # no videos in total
    echo -e "\n\033[31mNO VIDEOS FOUND\033[0m"
fi

echo



# setting up parameters for document extraction
mkdir documents_extracted   # createing directory for extracted documents
cd documents_extracted

# documents formats script extracts
formats_doc=("pdf" "docx" "pptx" "xlsx" "doc" \
            "ppt" "xls" "txt" "rtf" "odt" \
            "ods" "odp" "pages" "numbers" "key" \
            "md" "tex" "csv" "log" "xml")   

for format in ${formats_doc[@]}; do   # iterrating over documents formats
    mkdir $format   # creating a directory for a format
    find $path -type f -iname "*.$format" -exec cp {} $format \;   # searching and copying documents of the format
    if [ -z "$(ls $format)" ]; then   # checking if we extracted any document of the format
        echo "No documents of type: $format"
        rmdir $format   # no documents of this format
    else
        num_files_extracted=$(ls $format | wc -l)   # number of files copied
        num_files_extracted=$(echo $num_files_extracted)   # removing spaced produced by wc command
        echo -e "\033[32mEctracted documents of type: $format ($num_files_extracted)\033[0m"
    fi
done

cd ..

if [ -z "$(ls documents_extracted)" ]; then   # checking if we extracted any documents of any format
    rmdir documents_extracted   # no documents in total
    echo -e "\n\033[31mNO DOCUMENTS FOUND\033[0m"
fi

echo

echo -e "\033[32mExtraction completed!\033[0m"