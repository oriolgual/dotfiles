export BASH_SILENCE_DEPRECATION_WARNING=1
export LC_ALL=en_US.UTF-8
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export HOMEBREW_PREFIX=`brew --prefix`
set -o vi

[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
[[ -r "$HOMEBREW_PREFIX/etc/profile.d/autojump.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/autojump.sh"
[[ -r "$HOMEBREW_PREFIX/etc/bash_completion.d/git-prompt.sh" ]] && . "$HOMEBREW_PREFIX/etc/bash_completion.d/git-prompt.sh"
[[ -r "$HOMEBREW_PREFIX/etc/bash_completion.d/git-completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/bash_completion.d/git-completion.sh"
[[ -r "$HOMEBREW_PREFIX/etc/bash_completion.d/asdf.bash" ]] && . "$HOMEBREW_PREFIX/etc/bash_completion.d/asdf.bash"
. "/usr/local/opt/asdf/libexec/asdf.sh"

source ~/.iterm2_shell_integration.bash

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
        source "$BASE16_SHELL/profile_helper.sh"

ulimit -n 5000
eval "$(direnv hook bash)"

# pnpm
export PNPM_HOME="/Users/oriol/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end