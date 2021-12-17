export BASH_SILENCE_DEPRECATION_WARNING=1
export LC_ALL=en_US.UTF-8
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/opt/postgresql/bin:$PATH"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Prompt
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
if [ -f "/usr/local/etc/bash_completion.d/git-completion.bash" ]; then
    source "/usr/local/etc/bash_completion.d/git-completion.bash"
fi
# if [ -f "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh" ]; then
#     __GIT_PROMPT_DIR="/opt/homebrew/opt/bash-git-prompt/share"
#     source "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh"
# fi
# if [ -f "/usr/local/etc/bash_completion.d/git-prompt.sh" ]; then
#     source "/usr/local/etc/bash_completion.d/git-prompt.sh"
# fi

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

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
[ -f /user/local/etc/profile.d/autojump.sh ] && . /user/local/etc/profile.d/autojump.sh

ulimit -n 5000
. $(brew --prefix asdf)/asdf.sh

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
