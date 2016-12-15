# My dotfiles

```bash
  git clone git://github.com/oriolgual/dotfiles ~/.dotfiles
  git clone https://github.com/gmarik/vundle.git ~/.dotfiles/bundle/vundle
  vim +BundleInstall +qa!
  rm ~/.bashrc
  rm ~/.bash_profile
  ln -s ~/.dotfiles/bash_profile ~/.bash_profile
  ln -s ~/.dotfiles/bashrc ~/.bashrc
  ln -s ~/.dotfiles/gitconfig ~/.gitconfig
  ln -s ~/.dotfiles/gitignore ~/.gitignore
  ln -s ~/.dotfiles/spacemacs ~/.spacemacs
  ln -s ~/.dotfiles/vimrc ~/.vimrc
```

Have fun! :)
