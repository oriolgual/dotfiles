# Install this: brew install bash-completion bash-git-prompt

# Prompt
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
COLUMNS=250
# Color prompt for git
reset=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput sgr0)$(tput setaf 6)
white=$(tput setaf 7)

GIT_COLOR=$'\001\e[0;34m\002'
GIT_STATUS='${GIT_COLOR}$(__git_ps1)'

PROMPT_CHAR=" \$"
export PS1="\[$cyan\]\u\[$green\]@\[$cyan\]\h \[$cyan\]\[$magenta\]\w\[$cyan\]\[$reset\]$GIT_STATUS\[$green\]$PROMPT_CHAR\[$reset\] "
source ~/.dotfiles/rake_bash_autocomplete.sh

# Autojump
source /usr/local/etc/profile.d/autojump.sh

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby 2.4.0

# Aliases
alias rmr="trash"
alias git_current_branch="git symbolic-ref --short HEAD"
alias ll="ls -la"
alias be="bundle exec"
alias rc="bundle exec rails console"
alias rs="bundle exec rails server"
alias bi="bundle install"
alias rake="bundle exec rake"
alias rspec="bundle exec rspec"

alias g='git'
alias gs='git show'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v -m '
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gcb='git checkout -b'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b '
alias gd='git diff'
alias gdca='git diff --cached'

alias gf="git fetch"

alias ggpull='git pull origin $(git_current_branch)'
alias ggpush='git push origin $(git_current_branch)'
alias glog="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"

alias gm='git merge'
alias gmom='git merge origin/master'
alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/master'

alias gp='git push'
alias gpd='git push --dry-run'
alias gpu='git push upstream'
alias gpv='git push -v'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i origin/master'
alias grbm='git rebase origin/master'
alias grbs='git rebase --skip'
alias gss='git status -s'
alias gst='git status'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'