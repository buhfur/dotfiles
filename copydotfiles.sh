#!/bin/bash

# Copies dotfiles from my home directory to the repo 

DOTFILES=(".oh-my-zsh",".config",".vimrc",".zshrc",".zshenv",".tmux.conf")


for FILE in ${DOTFILES[@]}; do
    echo -n "$FILE\n"
done
