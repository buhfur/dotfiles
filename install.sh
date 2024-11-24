#!/bin/bash

# simple script which creates symlinks from the dotfiles contained in the repo to the users home directory 

DOTFILE_DIR="${1:-.}" # defaults to current working directory 
#DOTFILES=(".bashrc",".vimrc", ".zshrc",".zshenv",".bash_profile")

for DOTFILE in "$DOTFILE_DIR"/.*; do
    # Checks if the dotfile exists
    if [ -f $DOTFILE ]; then
        # Verify $DOTFILE isn't the script name 
        echo "Dotfile found : $DOTFILE"
        # Create symbolic link to users home 
        ln -s $DOTFILE $HOME/${DOTFILE#./}

    fi
done

