source "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats ' (%b)'
zstyle ':vcs_info:*' enable git

setopt PROMPT_SUBST
PROMPT='%n@%m %~${vcs_info_msg_0_}%# '
PROMPT='%~${vcs_info_msg_0_}
%n@%m %# '

zstyle ':completion:*' menu select

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_THEME="sammy"

DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

autoload -U colors && colors

#############
## PRIVATE ##
#############
private="${HOME}/.zsh.d/private.sh"
[[ -f ${private} ]] && source ${private}

##########
# HISTORY
##########
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt INC_APPEND_HISTORY EXTENDED_HISTORY HIST_EXPIRE_DUPS_FIRST \
       HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS \
       HIST_IGNORE_SPACE HIST_SAVE_NO_DUPS SHARE_HISTORY
unsetopt HIST_VERIFY

#############
# COMPLETION
#############
if (( $+commands[brew] )); then
	FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz compinit
# Speed up completion by only rebuilding the dump if it's older than 24 hours
zcd=(~/.zcompdump(N.mh+24))
if [[ ${#zcd} -gt 0 ]]; then
  compinit
else
  compinit -C
fi

unsetopt flowcontrol
setopt auto_menu complete_in_word always_to_end auto_pushd

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

###############
# KEY BINDINGS
###############
bindkey "^Q" push-input

# Up/down arrow to end of line
bindkey "\eOA" up-line-or-history
bindkey "\eOB" down-line-or-history
bindkey "\eOC" forward-char
bindkey "\eOD" backward-char

# History searches
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^Y' accept-search

# Arrow keys search forward/backward
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Bash-style history forward/backward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Backspace
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char

# Emacs keybindings
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

#########
# Aliases
#########
case $OSTYPE in
  linux*)
    [[ -f "${HOME}/.zsh.d/aliases.Linux.sh" ]] && source "${HOME}/.zsh.d/aliases.Linux.sh"
  ;;
  darwin*)
    [[ -f "${HOME}/.zsh.d/aliases.Darwin.sh" ]] && source "${HOME}/.zsh.d/aliases.Darwin.sh"
  ;;
esac

(( $+commands[lsd] )) && alias ls=lsd
alias lls='ls -lh --sort=size --reverse'
alias llt='ls -lrt'
alias ll='ls -l'
alias bear='clear && echo "Clear as a bear!"'

alias history='history 1'
alias hs='history | grep '

# TMUX
alias tmx="tmux"
alias tls="tmux ls"
alias ta="tmux attach-session -t $1"
alias td="tmux detach"
alias tk="tmux kill-server"
alias tx="exit"
alias tn="tmux new"
alias tks="tmux kill-session -t $1" # Renamed from tk to avoid duplicate alias
alias tka="pkill -f tmux"

alias rsyncssh='rsync -Pr --rsh=ssh'

alias ez='vim ~/.zshrc'
alias sz='source ~/.zshrc'

# Git
alias gss='git status'
alias gaa='git add -A'
alias gc='git commit'
alias gcm='git checkout main'
alias gd='git diff'
alias gdc='git diff --cached'
alias gitch='git checkout $1'
alias gitchn='git checkout -b $1'
alias gps='git push origin $1'
alias gpl='git pull origin $1'

fo() {
  git branch --no-color --sort=-committerdate --format='%(refname:short)' | fzf --header 'git checkout' | xargs git checkout
}

alias k='kubectl'

########
# ENV
########
export COLOR_PROFILE="dark"
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export KEYTIMEOUT=1

case $OSTYPE in
  linux*)
    [[ -f "${HOME}/.zsh.d/env.Linux.sh" ]] && source "${HOME}/.zsh.d/env.Linux.sh"
  ;;
  darwin*)
    [[ -f "${HOME}/.zsh.d/env.Darwin.sh" ]] && source "${HOME}/.zsh.d/env.Darwin.sh"
  ;;
esac

# Establish base system PATHs first to avoid overwriting later

if (( $+commands[nvim] )); then
  alias vim="nvim"
  export EDITOR="nvim"
  export PSQL_EDITOR='nvim -c"set filetype=sql"'
  export GIT_EDITOR="nvim"
else
  export EDITOR='vim'
  export PSQL_EDITOR='vim -c"set filetype=sql"'
  export GIT_EDITOR='vim'
fi

[[ -x "$HOME/code/clones/lua-language-server/3rd/luamake/luamake" ]] && alias luamake="$HOME/code/clones/lua-language-server/3rd/luamake/luamake"

# Go
export GOPATH="$HOME/code/go"
export GOBIN="$GOPATH/bin"
export PATH=""

# direnv & mise
(( $+commands[direnv] )) && eval "$(direnv hook zsh)"
(( $+commands[mise] ))   && eval "$(mise activate zsh)"

# fzf
if (( $+commands[fzf] )) && (( $+commands[rg] )); then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!vendor/*"'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# z
[[ -f /usr/local/etc/profile.d/z.sh ]] && source /usr/local/etc/profile.d/z.sh
[[ -f /opt/homebrew/etc/profile.d/z.sh ]] && source /opt/homebrew/etc/profile.d/z.sh

bindkey '^[^?' backward-kill-word

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin:/Users/manosriram/.local/bin:/opt/homebrew/opt/llvm/bin:$HOME/neovim/bin:$HOME/.cargo/bin:/opt/homebrew/opt/gnu-sed/libexec/gnubin:$GOBIN:$PATH"

typeset -U PATH
