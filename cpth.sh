#!/bin/bash
# Copies dotfiles from specified directory to users $HOME directory 

# Input validation for specified repo dotfile directory  
if [ $# -ne 1 ] then;
    echo "Usage: $0 <dotfile-directory>"
    exit 1 
fi

DELETE_BACKUP_DIR=0 # Boolean value , deletes backup dir automatically if set to 1, disabled by default for testing , will be enabled in prod
DOTFILE_DIRECTORY=$1
BACKUP_DIRECTORY="/tmp/dotfile-backup" # Path to store hosts current dotfiles before writing over them 
# Verify dotfile-directory exists 
if [ ! -d $DOTFILE_DIRECTORY ]; then
    echo "Target directory does not exist : $DOTFILE_DIRECTORY"
    exit 2
fi

# Verify if BACKUP_DIRECTORY exists
if [ ! -d $BACKUP_DIRECTORY ]; then 
    mkdir $BACKUP_DIRECTORY
    echo "Successfully Created backup dotfile directory : $BACKUP_DIRECTORY"
fi 

# Checks if dotfiles backup directory specified in BACKUP_DIRECTORY exists

if [ -d $BACKUP_DIRECTORY ]; 
    # Prompt the user to ask if they would like to restore their previous dotfiles  
    read -p "Detected existing backup directory at $BACKUP_DIRECTORY, restore dotfiles ? (y/n): " answer
    case $answer in
        [Yy]* )
            # Copy files from $BACKUP_DIRECTORY to hosts home 
            cp -vr $BACKUP_DIRECTORY/.??* $HOME
            echo "Successfully Restored Dotfiles"
            # Remove $BACKUP_DIRECTORY if $DELETE_BACKUP_DIR is set to true 
            if [ $DELETE_BACKUP_DIR -eq 1 ]; then
                rm -rf $BACKUP_DIRECTORY
                echo "Succssfully removed target directory : $BACKUP_DIRECTORY"
            fi
            
            ;;
        [Nn]* )
            echo "Skipping restore"
            ;;
        * ) 
            echo "Please input [y|y] or [N|n]"
            ;;
        esac

fi




# Copy dotfiles from dotfile-directory to users $HOME 
cp -vr $DOTFILE_DIRECTORY/.??* $HOME

