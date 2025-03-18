# Aliases for file operations
alias rmr="trash"  # Move files to trash instead of deleting permanently

# Git branch and listing aliases
alias git_current_branch="git symbolic-ref --short HEAD"
alias ll="ls -la"

# Rails and Bundler shortcuts
alias be="bundle exec"
alias rc="bin/rails console"
alias rs="bin/rails s"
alias cypress_rs="CYPRESS=1 bin/rails s"
alias bi="bundle install"
alias rake="spring rake"
alias rspec="spring rspec"

# Git command shortcuts
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

# Git fetch and push aliases
alias gf="git fetch"
alias ggpull='git pull origin $(git_current_branch)'
alias ggpush='git push origin $(git_current_branch)'
alias ggpush!='git push origin $(git_current_branch) --force'
alias glog="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"

# Git merge and rebase shortcuts
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
alias gsw='switch_to'

# Miscellaneous shortcuts
alias mns='gaa && gcn! && ggpush!' # 🙈 Commit all changes and push force
alias grewrite='git reset HEAD~1' # Undo last commit

# Fixing common typos and shortcuts
alias ggpuhs="ggpush"
alias heorku="heroku"
alias gti="git"
alias nom="npm"
alias xit="exit"
alias bake="rake"
alias vargo="cargo"
alias tuby="ruby"
alias riby="ruby"

# Factorial project-specific shortcuts
alias fdevc='factorial_console development'
alias go_to_factorial="cd /Users/oriol/code/factorial"
alias fpause=factorial_pause
alias fcontinue=factorial_continue
alias fstop=factorial_stop
alias fdump=factorial_reset_dump
alias fupdate='factorial_update && fsetup'
alias restart_vite='factorial_vite'
alias fopen='open https://app.dev-factorial.com:8080'
alias hellen='open https://app.dev-factorial.com:8080/demo/login_as_hellen'
alias flogin='open https://api.dev-factorial.com:8081/users/sign_in'
alias fbackoffice='open https://api.dev-factorial.com:8081/backoffice'
alias fsidekiq='open https://api.dev-factorial.com:8081/sidekiq/retries'
alias fletteropener="open https://api.dev-factorial.com:8081/letter_opener"
alias fgraphiql='open https://api.dev-factorial.com:8081/graphiql'
alias runtodo='go_to_factorial && bin/run-todo 1> /dev/null'

# AWS login and console shortcuts
alias demo_console="instance_id=\$(aws ec2 describe-instances --profile demo --filters 'Name=tag:Name,Values=demo-green/k8s-console' --query 'Reservations[].Instances[].InstanceId' --output text); aws ssm start-session --profile=demo --target \$instance_id"
alias production_console="instance_id=\$(aws ec2 describe-instances --profile production --filters 'Name=tag:Name,Values=production-blue/k8s-console' --query 'Reservations[].Instances[].InstanceId' --output text); aws ssm start-session --profile=production --target \$instance_id"

# Server management shortcuts
alias killservers="pkill -9 -f sidekiq && pkill -9 -f puma"
alias ks="killservers"
alias ss="spring stop"

# Navigation shortcuts
alias go_to_factorial_backend="go_to_factorial && cd backend"
alias go_to_factorial_frontend="go_to_factorial && cd frontend"

# Database and code generation shortcuts
alias seeds="go_to_factorial_backend && SEED_PRESET=english_micro bin/rails db:seeds:restore"
alias fggql="go_to_factorial_backend && bin/rails autodiscovery:gg && go_to_factorial_frontend && pnpm run graphql-codegen && go_to_factorial "
alias ggql=fggql
alias resetdb="go_to_factorial_backend && gf && gco origin/main -- db/schema.rb && rails db:drop db:create db:schema:load:with_data && rails db:migrate && seeds"
alias rrcache="go_to_factorial_backend && DISABLE_SPRING=true ENABLE_RR_CACHE=false bin/rails resource_registry:generate_cache"
alias codegen="go_to_factorial_frontend && pnpm run graphql-codegen"
alias fsetup="go_to_factorial && DISABLE_SPRING=true ENABLE_RR_CACHE=false bin/update && go_to_factorial && go_to_factorial_frontend && pnpm i && go_to_factorial && git checkout backend/db/schema.rb backend/db/data_schema.rb && codegen && go_to_factorial"
alias gclean="gaa & git reset --hard"
alias factorial="/Users/oriol/code/factorial/cli/bin/factorial"

