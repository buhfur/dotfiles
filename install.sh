#!/bin/bash

# simple script which creates symlinks from the dotfiles contained in the repo to the users home directory 

DOTFILE_DIR="${1:-.}" # defaults to current working directory 
EXCLUDED_FILES=(".gitignore" ".install.sh.swp") # Files which shoulden't be copied / made symbolic links to 

for DOTFILE in "$DOTFILE_DIR"/.*; do

    DOTFILE_REL_PATH="${DOTFILE#./}"
    DOTFILE_ABS_PATH="$(realpath "$DOTFILE")" 
    DOTFILE_BACKUP_DIR=/tmp/dotfile-backup # default dir for backups 



    if [[ -f $DOTFILE_ABS_PATH ]]; then # Checks if the dotfile exists

        if [[ -f $HOME/$DOTFILE_REL_PATH || -d $HOME/$DOTFILE_REL_PATH ]]; then # Check if dotfile exists in users $HOME if it does , copy to /tmp 
            if [ ! -d $DOTFILE_BACKUP_DIR ]; then # Creates backup directory which holds a copy of current dotfiles
                echo "INFO: Target directory : $DOTFILE_BACKUP_DIR not found , Creating... "
                mkdir $DOTFILE_BACKUP_DIR
                echo "INFO: Successfully created $DOTFILE_BACKUP_DIR"
            fi
        else
            echo "INFO: $HOME/$DOTFILE_REL_PATH was not found. Skipping..."
        fi


        if [ -f $HOME/$DOTFILE_REL_PATH ]; then # Copy old dotfiles to backup-dir 
            cp -rv $HOME/$DOTFILE_REL_PATH $DOTFILE_BACKUP_DIR
            echo "INFO: Target $HOME/$DOTFILE_REL_PATH copied to $DOTFILE_BACKUP_DIR successfully"
        fi


        if [[ "${EXCLUDED_FILES[@]}" =~ "${DOTFILE_REL_PATH}" ]]; then # Check if the dotfile is in the EXCLUDED_FILES list 
            echo "INFO: Target $DOTFILE_REL_PATH detected in ignore list, skipping..."
        else
            echo "INFO: Creating symbolic links to dotfiles..."
            sudo ln -svf $DOTFILE_ABS_PATH $HOME/$DOTFILE_REL_PATH
            echo "INFO: Successfully created symbolic links to dotfiles! "
        fi


    fi

done

