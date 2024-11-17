#!/bin/bash
#
#Copies dotfiles from the host  to the repo 
# takes absolute file path of directory will dotfiles will be stored 


# input validation for target directory 
if [ $# -ne 1 ]; then
    echo "Usage : $0 <target-directory>"
fi


# Assign target dir where dotfiles will be installed 
TARGET_DIR=$1
# Validate directory exists 

if [ ! -d "$TARGET_DIR" ]; then
    echo "Target directory does not exist $TARGET_DIR"
    exit 2 
fi


# Copy dotfiles
cp -vr $HOME/.??* $TARGET_DIR


# Confirmation message 
echo "Dotfiles have been successfully copied to $TARGET_DIR"

