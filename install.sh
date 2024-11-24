#!/bin/bash

# simple script which creates symlinks from the dotfiles contained in the repo to the users home directory 

DOTFILE_DIR="${1:-.}" # defaults to current working directory 
EXCLUDED_FILES=(".gitignore" ".install.sh.swp") # Files which shoulden't be copied / made symbolic links to 
#DOTFILES=(".bashrc" ".vimrc", ".zshrc" ".zshenv" ".bash_profile")

for DOTFILE in "$DOTFILE_DIR"/.*; do

    # TODO: Absolute and Relative paths for the dotfile contained within repo. Absolute path is required for the symbolic link to be created 

    # Verify 
    # TODO: create list which specifies which files should be ignored



    DOTFILE_REL_PATH="${DOTFILE#./}"
    DOTFILE_ABS_PATH="$(realpath "$DOTFILE")" 
    DOTFILE_BACKUP_DIR=/tmp/dotfile-backup # default dir for backups 
     
    # copy oh-my-zsh config manually 
    if [ $DOTFILE_REL_PATH == ".oh-my-zsh" ]; then
        # Check for existing oh-my-zsh config 
        if [ -d $HOME/.oh-my-zsh ]; then
            echo "cp -vr $HOME/.oh-my-zsh $DOTFILE_BACKUP_DIR"
            # Create symlink to oh-my-zsh config in repo  
            echo "sudo ln -sf $DOTFILE_ABS_PATH $HOME/.oh-my-zsh"
        fi
    fi

    # Checks if the dotfile exists
    if [[ -f $DOTFILE_ABS_PATH ]]; then

        # Check if dotfile exists in users $HOME if it does , copy to /tmp 
        if [[ -f $HOME/$DOTFILE_REL_PATH || -d $HOME/$DOTFILE_REL_PATH ]]; then
            if [ ! -d $DOTFILE_BACKUP_DIR ]; then # Creates backup directory which holds a copy of current dotfiles
                echo "No $DOTFILE_BACKUP_DIR found , Creating... "
                mkdir $DOTFILE_BACKUP_DIR
                echo "Successfully created $DOTFILE_BACKUP_DIR"
            fi

        else
            echo "INFO: $HOME/$DOTFILE_REL_PATH was not found. Skipping..."
        fi

        # Copy old dotfiles to backup-dir 
        if [ -f $HOME/$DOTFILE_REL_PATH ]; then

            echo "cp -rv $HOME/$DOTFILE_REL_PATH $DOTFILE_BACKUP_DIR"
            echo "Target : $HOME/$DOTFILE_REL_PATH copied to $DOTFILE_BACKUP_DIR"
        fi

        # Check if the dotfile is in the EXCLUDED_FILES list 

        if [[ "${EXCLUDED_FILES[@]}" =~ "${DOTFILE_REL_PATH}" ]]; then 
            echo "INFO: Ignored Target $DOTFILE_REL_PATH detected, skipping..."
        else
            echo "sudo ln -sf $DOTFILE_ABS_PATH $HOME/$DOTFILE_REL_PATH"
        fi
    fi

done

