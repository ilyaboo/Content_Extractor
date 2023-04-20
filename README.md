# Content Extractor

## Description
This shell script extracts media content from a directory specified by the user. It searches for images and videos in the directory and its subdirectories, and copies them to new directories, categorized by their file format.

## How It Works

The script prompts the user to enter an absolute path to the directory containing the media content. It then creates two new directories, one for extracted images and one for extracted videos.

For each media format, the script searches for files with the corresponding extension and copies them to the appropriate directory. If no files of a certain format are found, the corresponding directory is deleted.

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
2. Follow the prompts to enter the absolute path to the directory containing the media content.
3. Wait for the script to complete the extraction process.
4. The extracted images and videos will be saved in separate directories named images_extracted and videos_extracted, respectively, in the same directory as the script.
5. If no media content is found, the script will output a message indicating that no images or videos were found.

## Enjoy! :)
