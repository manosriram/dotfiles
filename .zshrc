# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias python=python3

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
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export HOMEBREW_NO_AUTO_UPDATE=1
export GO111MODULE=on
set KEYTIMEOUT=1
bindkey "^[^[[D" forward-word
bindkey "^[^[[C" backward-word

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

function cprun() {
    g++ -std=c++14 $1 && ./a.out && cat out.txt
}

function cpprun() {
    g++ -std=c++17 $1 && ./a.out
}

function CD_Desktop() {
    cd ~/desktop/$1
}

function tvim() {
    touch $1 && vim $1
}

function gp() {
    git push origin $1;
}

function initIgnore() {
    touch .gitignore;
    echo "a.out" >> .gitignore;
    echo ".DS_Store" >> .gitignore;
    echo "node_modules" >> .gitignore;
}

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

function pret() {
    prettier --config .prettierrc --write './Source/assets/js/core/source/*.js'
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

# Aliases.
alias lst="ls -l"
alias lsta="ls -a -l"
alias desk="cd desktop"
alias tvim=tvim
alias cprun=cprun
alias desk=CD_Desktop
alias nrd="npm run dev"
alias init=initIgnore
alias k="kubectl"
alias goo="cd $GOPATH/src"
alias mvim="~/mvim.sh"
alias c="clear"

# Git Aliases.
alias gss="git status"
alias gaa="git add ."
alias gch=gitch
alias gbb="git branch"
alias gd="git diff"
alias gc=gc
alias gitchn=gitCheckoutNewBranch

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
plugins=()
source $ZSH/oh-my-zsh.sh
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/Users/manosriram/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end