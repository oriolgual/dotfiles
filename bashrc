# Install this: brew install bash-completion bash-git-prompt

# Prompt
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='[\u@mbp \w$(__git_ps1)]\$ '

# Autojump
source /usr/local/etc/profile.d/autojump.sh

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh

# Aliases
alias ll="ls -la"
alias be="bundle exec"
alias rc="bundle exec rails console"
alias rs="bundle exec rails server"