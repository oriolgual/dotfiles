# Aliases
alias rmr="trash"
alias git_current_branch="git symbolic-ref --short HEAD"
alias ll="ls -la"
alias be="bundle exec"
alias rc="spring rails console"
alias rs="bundle exec rails server"
alias bi="bundle install"
alias rake="spring rake"
alias rspec="spring rspec"
alias wallcat="ruby wallcat.rb"

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
alias ggpush!='git push origin $(git_current_branch) --force'
alias glog="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"

alias gm='git merge'
alias gmom='git merge origin/main'
alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/main'

alias gpp='git push'
alias gpd='git push --dry-run'
alias gpu='git push upstream'
alias gpv='git push -v'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i origin/main'
alias grbdi='git rebase -i origin/develop'
alias grbm='git rebase origin/main'
alias grbd='git rebase origin/develop'
alias grbs='git rebase --skip'
alias gss='git status -s'
alias gst='git status'
alias gchp='git cherry-pick'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gclean='git checkout main && git branch | grep -v "*" | xargs git branch -D'
alias mns='gaa && gcn! && ggpush!' # 🙈
alias grewrite='git reset HEAD~1'

alias ggpuhs="ggpush"
alias heorku="heroku"
alias gti="git"
alias nom="npm"
alias xit="exit"
alias bake="rake"
alias vargo="cargo"
alias tuby="ruby"
alias riby="ruby"

factorial_console () {
  aws sso login --profile=$1
  target=$(aws ec2 describe-instances --profile=$1 --filters "Name=tag:Name,Values=$1/k8s-console" --query 'Reservations[].Instances[].InstanceId' --output text)
  aws ssm start-session --profile=$1 --target=$target
}

alias fpc='factorial_console production'
alias fdc='factorial_console demo'
