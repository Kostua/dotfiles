if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
export PATH="/usr/local/bin:$PATH"
set -o vi
export GLASSFISH_HOME=/usr/local/opt/glassfish/libexec
alias ll='ls -la'
alias rm='rm -i'
alias config='/usr/bin/git --git-dir=/Users/kostua/.cfg/ --work-tree=/Users/kostua'
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH=~/bin:$PATH
# export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
