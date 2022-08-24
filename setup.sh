#!/bin/bash

files="bash_profile bashrc bash_aliases gitignore vimrc"

for file in $files
do
  if [ -L $HOME/.$file ]; then
    unlink $HOME/.$file
  fi
  ln -s $HOME/.dotfiles/$file $HOME/.$file
done
