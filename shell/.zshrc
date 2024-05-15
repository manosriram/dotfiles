plugins=(
  zsh-autosuggestions
)

export ZSH="/Users/manosriram/.oh-my-zsh"
ZSH_THEME="robbyrussell"
export TERM="screen-256color"
export PATH=${PATH}:/usr/local/mysql/bin
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOROOT:$GOPATH:$GOBIN
export PATH=/Users/manosriram/.local/bin:$PATH
export PATH=/opt/homebrew/opt/llvm/bin:$PATH
export HOMEBREW_NO_AUTO_UPDATE=1
export GO111MODULE=on
set KEYTIMEOUT=1
bindkey "^[^[[D" forward-word
bindkey "^[^[[C" backward-word

function tmux_attach() {
    tmux attach-session -t $1;
}

function tmux_kill_all_sessions() {
    pkill -f tmux;
}

function git_checkout() {
    git checkout $1;
}

function git_checkout_to_new_branch() {
    git checkout -b $1;
}

function git_commit() {
    git commit
}

function git_push() {
    git push origin $1;
}

function git_pull() {
    git pull origin $1;
}

# Git Aliases.
alias gss="git status"
alias gaa="git add ."
alias gbb="git branch"
alias gd="git diff"
alias gc=git_commit
alias gitchn=git_checkout_to_new_branch
alias gitch=git_checkout

# TMUX Alias
alias tmx="tmux"
alias tls="tmux ls"
alias tx="exit"
alias tk="tmux kill-server"
alias ta=tmux_attach
alias tka=tmux_kill_all_sessions

DISABLE_AUTO_TITLE="true"
source $ZSH/oh-my-zsh.sh
