# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/kostua/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker docker-compose kubectl vault terraform)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# 
# Run Vault
alias vlt="cd ~/Vault/unseal/ && ./unseal.sh"
alias jnks="cd ~/Jenkins && docker-compose up -d"
complete -C '/usr/local/bin/aws_completer' aws
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/vault
export VAULT_ADDR='http://127.0.0.1:8200'
autoload -Uz compinit
compinit
export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Python
export VIRTUALENVWRAPPER_SCRIPT=/opt/homebrew/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_VIRTUALENV=/opt/homebrew/bin/virtualenv
source /opt/homebrew/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_WORKON_CD=1
# source /usr/local/bin/virtualenvwrapper.sh
export PYTHONDONTWRITEBYTECODE=1
export HISTORY_IGNORE="(pwd|ls|ls -ltr|vault)"
alias config='/usr/bin/git --git-dir=/Users/kostua/.cfg/ --work-tree=/Users/kostua'
# Homebrew's sbin
export PATH="/usr/local/sbin:$PATH"
# Requirements for kube-ps1
# export KUBE_PS1_BINARY=oc
# source /usr/local/share/kube-ps1.sh
# PROMPT='$(kube_ps1)'$PROMPT
# kubeoff

export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export LDFLAGS=-L/opt/homebrew/opt/openssl@1.1/lib
export CPPFLAGS=-I/opt/homebrew/opt/openssl@1.1/include
# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
PATH=$(pyenv root)/shims:$PATH


# Secretive
export SSH_AUTH_SOCK=/Users/kostua/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

# Bartib

alias br="bartib"
export BARTIB_FILE="/Users/kostua/activities.bartib"

# Git shortcuts
#
## Git create a future branch
cb() {
    git checkout -b "feature/$1"
}

## Git create a fix branch
cf() {
    git checkout -b "fix/$1"
}

## Git create a commit
cc() {
    git commit -am "$1"
}

## Git status
alias st="git status -s"

## Git log
alias gl='git log --pretty=format:"%h - %an, %ar : %s"'

## Git cleanup
git_cleanup() {
    branch=$(git symbolic-ref --short HEAD)
    if [ "$branch" = "main" ] || [ "$branch" = "master" ]; then
        echo "Already on a mainline branch. Please switch to a feature branch first."
        return 1
    fi
    # Check if "main" branch exists in remote
    if git show-ref --verify --quiet refs/remotes/origin/main; then
        git checkout main
    else
        git checkout master
    fi
    git pull
    git branch -d $branch
    git push origin --delete $branch
}

## AWS assume role
alias awd='export AWS_DEFAULT_PROFILE=default; export AWS_PROFILE=default'
alias awa='cd /Users/kostua/.aws && source assume_role.sh'

## ChatGPT cli
alias chatgpt='chatgpt --model gpt-4 --init-prompt-from-file /Users/kostua/ChatGPT-shell-cli/initpormpt.txt'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kostua/GCP/CLI/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kostua/GCP/CLI/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kostua/GCP/CLI/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kostua/GCP/CLI/google-cloud-sdk/completion.zsh.inc'; fi
