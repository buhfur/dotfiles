#!/bin/bash

# Copies dotfiles from my home directory to the repo 

DOTFILES=( ".oh-my-zsh" ".vimrc" ".zshrc" ".zshenv" ".tmux.conf" )


for FILE in ${DOTFILES[@]}; do
    cp -rv $HOME/$FILE $HOME/dotfiles
done
