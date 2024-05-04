# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p11k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p11k-instant-prompt-${(%):-%n}.zsh"
fi

# alias python=python3

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# ZSH_THEME="wedisagree"
export ZSH="/Users/manosriram/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
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
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export HOMEBREW_NO_AUTO_UPDATE=1
export GO111MODULE=on
set KEYTIMEOUT=1
bindkey "^[^[[D" forward-word
bindkey "^[^[[C" backward-word

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/repos/znap/znap.zsh  # Start Znap

function gitch() {
    git checkout $1;
}

function tattach() {
    tmux attach-session -t $1;
}

function tdetach() {
    tmux detach;
}

function tkill() {
    tmux kill-session -t $1;
}

function gc() {
    git commit -m $1;
}

function killAllSessions() {
    pkill -f tmux
}

function gitCheckoutNewBranch() {
		git checkout -b $1
}

# Git Aliases.
alias gss="git status"
alias gaa="git add ."
alias gch=gitch
alias gbb="git branch"
alias gd="git diff"
alias gc=gc
alias gitchn=gitCheckoutNewBranch
alias glog="git log"

# TMUX Alias
alias tmx="tmux"
alias tls="tmux ls"
alias ta=tattach
alias td=tdetach
alias tk="tmux kill-server"
alias tx="exit"
alias tn="tmux neww"
alias gp=gp
alias tk=tkill
alias tka=killAllSessions

DISABLE_AUTO_TITLE="true"
source $ZSH/oh-my-zsh.sh
export PATH="/usr/local/opt/ruby/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pnpm end
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
