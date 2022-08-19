#!/bin/bash

files="bash_profile gitconfig bashrc bash_aliases gitconfig gitignore"

for file in $files
do
  if [ -L $HOME/.$file ]; then
    unlink $HOME/.$file
  fi
  ln -s $HOME/.dotfiles/$file $HOME
done
