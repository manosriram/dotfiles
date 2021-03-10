# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/manosriram/.oh-my-zsh"
export TERM="screen-256color"
export PATH=${PATH}:/usr/local/mysql/bin
bindkey "^[^[[D" forward-word
bindkey "^[^[[C" backward-word

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

function gpush() {
    dir="$(pwd)";
    branch="$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)";
    if [[ "$dir" = "/Users/manosriram/desktop/apnahood-backend" ]] && [[ "$branch" = "mano/dev" ]]; then
        git add .;
        git commit -m $1;
        echo "Pushing to mano/dev.";
        git push origin mano/dev;
        echo "Checking out branch mano/remote.";
        git checkout mano/remote;
        echo "Merging mano/remote with mano/dev.";
        git merge mano/dev;
        echo "Pushing mano/remote and deploying.";
        git push origin mano/remote;
    else
        if [[ "$dir" != "/Users/manosriram/desktop/apnahood-backend" ]]; then
            echo "Not in apnahood directory";
        fi
        if [[ "$branch" != "mano/dev" ]]; then
            echo "mano/dev branch not checked-out";
        fi
    fi
}

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

# Git Aliases.
alias gss="git status"
alias gaa="git add ."
alias gch=gitch
alias gbb="git branch"
alias gps=gpush

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

ZSH_THEME="geoffgarside"
DISABLE_AUTO_TITLE="true"
plugins=()
source $ZSH/oh-my-zsh.sh
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
