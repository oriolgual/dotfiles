function mkfile() {
  mkdir -p "$(dirname "$1")" && touch "$1"
}

factorial_console() {
  local profile=$1
  aws sso login --profile="$profile"
  local target
  target=$(aws ec2 describe-instances --profile="$profile" --filters "Name=tag:Name,Values=$profile/k8s-console" --query 'Reservations[].Instances[].InstanceId' --output text)
  aws ssm start-session --profile="$profile" --target="$target"
}

factorial_update() {
  go_to_factorial_backend
  echo "Stopping servers..."
  pkill -f puma || echo "No puma process found"
  pkill -f sidekiq || echo "No sidekiq process found"
  spring stop
  echo "Updating everything..."
  git pull origin "$(git rev-parse --abbrev-ref HEAD)"
  bundle install --quiet
  yarn install --silent
}

factorial_reset_dump() {
  echo "Updating Rails' dependencies..."
  cd "$HOME/code/factorial/backend" || { echo "❌ Directory not found"; return 1; }
  spring stop
  RUBYOPT=W0 bundle install >/dev/null 2>&1
  echo "Resetting database..."
  RUBYOPT=W0 RAILS_ENV=development rails db:environment:set db:do_reset db:seeds:e2e >/dev/null 2>&1
  echo "Dumping..."
  RUBYOPT=W0 RAILS_ENV=development rails db:dump >/dev/null 2>&1
  echo "✅ Done!"
}

switch_to() {
  local branch=$1
  echo "Switching to $branch..."
  git fetch --quiet
  if git rev-parse --verify "$branch" >/dev/null 2>&1; then
    git switch "$branch" --guess --quiet
    git reset --hard "origin/$branch" --quiet
    echo "✅ Switched to $branch"
  else
    echo "❌ Branch $branch not found"
    return 1
  fi
}

# Reusable login check function
aws_is_logged_in() {
  local profile="$1"
  aws sts get-caller-identity --profile "$profile" --output json >/dev/null 2>&1
}

# Reusable AWS login function
aws_login() {
  local profile=$1
  if aws_is_logged_in "$profile"; then
    echo "✅ Already logged in to AWS SSO ($profile)."
  else
    echo "🔐 Logging in to AWS SSO ($profile)..."
    aws sso login --profile="$profile" || {
      echo "❌ Login failed. Aborting."
      return 1
    }
  fi
}

# Function for fpc: Production login + console
fpc() {
  aws_login "production" && production_console
}

# Function for fdc: Demo login + console
fdc() {
  aws_login "demo" && demo_console
}

# Function for fdev: Development login + export credentials
fdev() {
  aws_login "development"
  echo "⚙️ Exporting temporary credentials for development..."
  eval "$(aws configure export-credentials --profile development --format env)"
  echo "✅ Development credentials exported and ready!"
}

