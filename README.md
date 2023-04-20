# Content Extractor

## Description
This shell script extracts media content and documents from a directory specified by the user. It searches for images, videos, and documents in the directory and its subdirectories, and copies them to new directories, categorized by their file format.

## How It Works

The script prompts the user to enter an absolute path to the directory containing the content. It then creates three new directories, one for extracted images, one for extracted videos, and one for extracted documents.

For each format, the script searches for files with the corresponding extension and copies them to the appropriate directory, indicating how many files of each format copied. If no files of a certain format are found, the script will not include this directory.

## Installation

1. Download the shell script to a local directory on your machine. You can do this by enetring the following command in your terminal.
```terminal
$ git clone https://github.com/ilyaboo/content_extractor.git
```
2. Navigate to the directory where the script is saved entering the following command.
```terminal
$ cd content_extractor
```
3. Make the script executable by running the following command.
```terminal
$ chmod +x extract_media.sh
```

## How To Use

1. Run the script by typing the follwoing command into the terminal. 
```terminal
$ ./extract_media.sh
```
2. Follow the prompts to enter the absolute path to the directory containing the content.
3. Wait for the script to complete the extraction process.
4. The extracted images, videos, and documents will be saved in separate directories named `images_extracted`, `videos_extracted`, and `documents_extracted` respectively, in the same directory as the script.
5. If no media content is found, the script will output a message indicating that no content were found.

## Enjoy! :)
