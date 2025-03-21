# My dotfiles

```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" # Installs homebrew
  brew install git
  git clone git://github.com/oriolgual/dotfiles ~/.dotfiles
  rm ~/.bashrc
  rm ~/.bash_profile
  ln -s ~/.dotfiles/bash_profile ~/.bash_profile
  ln -s ~/.dotfiles/bashrc ~/.bashrc
  ln -s ~/.dotfiles/bash_aliases ~/.bash_aliases
  ln -s ~/.dotfiles/gitconfig ~/.gitconfig
  ln -s ~/.dotfiles/gitignore ~/.gitignore
  ln -s ~/.dotfiles/vimrc ~/.vimrc
  ln -s ~/.dotfiles/Brewfile ~/Brewfile
  ln -s ~/.dotfiles/tool-versions ~/.tool-versions
  ln -s ~/.dotfiles/finicky.js ~/.finicky.js

  brew bundle

  curl -L https://iterm2.com/shell_integration/bash -o ~/.iterm2_shell_integration.bash

  sudo rm -rf /Library/Developer/CommandLineTools
  xcode-select --install

  asdf plugin add ruby
  asdf plugin add elixir
  asdf plugin add erlang
  asdf plugin add python
  asdf plugin add nodejs
  asdf install

  echo /usr/local/bin/bash | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/bash

  git clone https://github.com/fnune/base16-shell.git ~/.config/base16-shell
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +qa!
  base16_dracula

  gh auth login
  heroku login

  mkdir Code

  gpg --full-generate-key
  gpg --list-secret-keys --keyid-format LONG
  git config --global user.signingkey XXXXXXXXX
  gpg --armor --export XXXXXXXX | pbcopy
  open https://github.com/settings/gpg/new
  cd .dotfiles && git remote set-url origin git@github.com:oriolgual/dotfiles.git && cd ..
  sudo cp ~/.dotfiles/hosts /etc/hosts
```

# Other stuff I need to do

* Set caps lock as ESC
* Set fn as Emoji
* Install certificates
* Setup 1Password
* Set DuckDuckGo as search engine
* Safari settings: show full address, show develop menu, show status bar (command + /)
* Login aws
* Turn on settings sync at VSCode
