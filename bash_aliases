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

tmux_frontend_command () {
  tmux send-keys -t 2.0 "$1" Enter
}

factorial_vite () {
  tmux send-keys -t 2.0 C-c
  tmux_frontend_command 'rm -fr node_modules'
  tmux_frontend_command 'pnpm i'
  tmux_frontend_command 'pnpm start'
}

factorial_update () {
  echo "Restarting vite..."
  factorial_vite

  echo "Updating Rails' dependencies..."
  cd /Users/oriol/code/factorial/backend
  spring stop
  RUBYOPT=W0 bundle install 1> /dev/null

  echo "Resetting development database and seeding..."
  git fetch
  gco origin/main -- db/schema.rb db/data_schema.rb
  RUBYOPT=W0 RAILS_ENV=development rails db:drop db:create db:schema:load:with_data db:migrate:with_data db:seed db:seeds:banking 1> /dev/null

  echo "Restarting Puma..."
  rm -fr log/*.log
  rm -fr tmp/*
  touch tmp/restart.txt

  echo "Resetting test database..."
  RUBYOPT=W0 RAILS_ENV=test rails db:drop db:create db:schema:load 1> /dev/null
}

switch_to () {
  echo "Switching to $1..."
  git fetch 1> /dev/null
  git switch $1 --guess 1> /dev/null && git reset --hard origin/$1 1> /dev/null
}

alias gsw='switch_to'
alias fpc='factorial_console production'
alias fdc='factorial_console demo'
alias fdevc='factorial_console development'
alias f!='cd /Users/oriol/code/factorial && tmuxinator start -p .local-dev/tmuxinator.yml'
alias e2e!='cd /Users/oriol/code/factorial && tmuxinator start -p .local-dev/tmuxinator_e2e.yml'
alias fupdate='factorial_update'
alias restart_vite='factorial_vite'
alias fopen='open https://app.dev-factorial.com'
alias flogin='open https://api.dev-factorial.com/users/sign_in'
alias fbackoffice='open https://api.dev-factorial.com/backoffice'
alias fcypress='APP_HOST=app.dev-factorial.com API_HOST=api.dev-factorial.com PUBLIC_HOST=api.dev-factorial.com CYPRESS_BASE_URL=https://app.dev-factorial.com CYPRESS_API_ENDPOINT=https://api.dev-factorial.com CYPRESS_FAIL_FAST_ENABLED=false API_ENDPOINT=https://api.dev-factorial.com API_LOCATION=https://api.dev-factorial.com npx cypress open'
alias runtodo=' cd /Users/oriol/code/factorial/ && bin/run-todo 1> /dev/null && gco backend/sorbet/rbi/dsl/perftools/profiles/'
