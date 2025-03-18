# Load Homebrew environment variables
eval "$(/opt/homebrew/bin/brew shellenv)"

# Suppress deprecation warning for macOS default shell
export BASH_SILENCE_DEPRECATION_WARNING=1

# Set locale to UTF-8 to avoid encoding issues
export LC_ALL=en_US.UTF-8

# Set default command for fzf (fuzzy finder) to use fd (faster alternative to find)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Get the Homebrew prefix dynamically
export HOMEBREW_PREFIX=$(brew --prefix)

# Enable vi mode for command line editing
set -o vi

# Load aliases and functions if available
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_functions ] && source ~/.bash_functions

# Load additional shell utilities if they exist
[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
[[ -r "$HOMEBREW_PREFIX/etc/profile.d/autojump.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/autojump.sh"
[[ -r "$HOMEBREW_PREFIX/etc/bash_completion.d/git-prompt.sh" ]] && . "$HOMEBREW_PREFIX/etc/bash_completion.d/git-prompt.sh"
[[ -r "$HOMEBREW_PREFIX/etc/bash_completion.d/git-completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/bash_completion.d/git-completion.sh"
[[ -r "$HOMEBREW_PREFIX/etc/bash_completion.d/asdf.bash" ]] && . "$HOMEBREW_PREFIX/etc/bash_completion.d/asdf.bash"
[[ -r "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh" ]] && . "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh"

# Load iTerm2 shell integration
source ~/.iterm2_shell_integration.bash

# Enable Git prompt enhancements (shows unstaged/staged changes)
GIT_PS1_SHOWDIRTYSTATE=true

# Set terminal width for better formatting
COLUMNS=250

# Define colors for prompt
reset=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput sgr0)$(tput setaf 6)
white=$(tput setaf 7)

# Customize Git status appearance in prompt
GIT_COLOR=$'\001\e[0;34m\002'
GIT_STATUS='${GIT_COLOR}$(__git_ps1)'

# Define prompt appearance with username, hostname, working directory, and Git status
PROMPT_CHAR=" \$"
export PS1="\[$cyan\]\u\[$green\]@\[$cyan\]\h \[$cyan\]\[$magenta\]\w\[$cyan\]\[$reset\]$GIT_STATUS\[$green\]$PROMPT_CHAR\[$reset\] "

# Load Base16 Shell for theme support
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] &&
  [ -s "$BASE16_SHELL/profile_helper.sh" ] &&
  source "$BASE16_SHELL/profile_helper.sh"

# Increase file descriptor limit
ulimit -n 65535

# Load direnv for automatic environment variable management
eval "$(direnv hook bash)"

# Configure pnpm (JavaScript package manager)
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Enable fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
