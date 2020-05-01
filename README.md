# My dotfiles

```bash
  git clone git://github.com/oriolgual/dotfiles ~/.dotfiles
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +qa!
  rm ~/.bashrc
  rm ~/.bash_profile
  ln -s ~/.dotfiles/bash_profile ~/.bash_profile
  ln -s ~/.dotfiles/bashrc ~/.bashrc
  ln -s ~/.dotfiles/gitconfig ~/.gitconfig
  ln -s ~/.dotfiles/gitignore ~/.gitignore
  ln -s ~/.dotfiles/vimrc ~/.vimrc
```

Have fun! :)
