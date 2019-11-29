
# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/manosriram/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/manosriram/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/manosriram/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/manosriram/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH


HOST_NAME=_ManoSr

shopt -s autocd
shopt -s histappend

export PATH=$PATH:$HOME/bin

export HISTSIZE=5000
export HISTFILESIZE=10000

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

print_before_the_prompt () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    printf "\n $txtred%s: $bldgrn%s\n$txtrst" "$HOST_NAME" "$dir"
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1="→ "

function mkcd() {
	mkdir $1 && cd $1
}

function tvim() {
    touch $1 && vim $1
}

function cprun() {
    g++ -std=c++14 $1 && ./a.out && cat out.txt
}

function cpprun() {
    g++ -std=c++17 $1 && ./a.out
}

function gacp() {
    git add .;
    git commit -m $1;
    git push origin $2;
}

# -------
# Aliases
# -------
alias 🍺="git checkout -b drunk"
alias a='code .'
alias c='code .'
alias reveal-md="reveal-md --theme night --highlight-theme hybrid --port 1337"
alias ns='npm start'
alias start='npm start'
alias nr='npm run'
alias run='npm run'
alias nis='npm i -S'
alias l="ls" # List files in current directory
alias ll="ls -al" # List all files in current directory in long list format
alias o="open ." # Open the current directory in Finder
alias tvim=tvim
alias cprun=cprun
# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gi='git init'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias gss='git status -s'
alias gs='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'
