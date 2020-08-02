# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/manosriram/.oh-my-zsh"
export TERM="screen-256color"
export PATH=${PATH}:/usr/local/mysql/bin

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

function gacp() {
    git add .;
    git commit -m $1;
    git push $2 $3;
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
    tmux attach-session -t $1
}

function tdetach() {
    tmux detach
}

# Aliases.
alias lst="ls -l"
alias lsta="ls -a -l"
alias desk="cd desktop"
alias tvim=tvim
alias cprun=cprun
alias desk=CD_Desktop
alias nrd="npm run dev"
alias gacp=gacp
alias init=initIgnore
alias k="kubectl"

# Git Aliases.
alias gss="git status"
alias gaa="git add ."
alias gch=gitch
alias gbb="git branch"

# TMUX Alias
alias tm="tmux"
alias tls="tmux ls"
alias ta=tattach
alias td=tdetach
alias tk="tmux kill-server"
alias tx="exit"

ZSH_THEME="geoffgarside"
plugins=()
source $ZSH/oh-my-zsh.sh
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
