# =====================
# Nushell config
# =====================

$env.config = {
  show_banner: false
  edit_mode: vi
  buffer_editor: vi
  history: {
    max_size: 50000
    sync_on_enter: true
  }
  completions: {
    case_sensitive: false
    quick: true
  }
}

# =====================
# Aliases
# =====================

# tmux
alias tmx = tmux
alias tls = tmux ls
alias tn = tmux new
alias td = tmux detach
alias tk = tmux kill-server
alias tka = pkill -f tmux

def ta [session?: string] {
  tmux attach-session -t $session
}

# git
alias gss = git status
alias gaa = git add -A
alias gc = git commit
alias gcm = git checkout main
alias gd = git diff
alias gdc = git diff --cached
alias gps = git push origin
alias gpl = git pull origin

# kubectl
alias k = kubectl

# =====================
# Git helper functions
# =====================

def fo [] {
  git branch --sort=-committerdate
  | lines
  | str trim
  | fzf
  | if $in != "" { git checkout $in }
}

def gitch [branch: string] {
  git checkout $branch
}

def gitchn [branch: string] {
  git checkout -b $branch
}
