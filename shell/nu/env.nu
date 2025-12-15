# env.nu
#
# Installed by:
# version = "0.109.1"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

# Env.nu - Environment Variables

alias aider_opus4.1 = aider --model=claude-opus-4-20250514 --anthropic-api-key=(open ~/.private/anthropic_key | str trim);

# =====================
# PATH handling
# =====================

$env.PATH = (
  [
    $"($env.HOME)/neovim/bin"
    $"($env.HOME)/.cargo/bin"
    "/usr/local/bin"
    "/usr/bin"
    "/bin"
    "/usr/sbin"
    "/sbin"
    "/opt/homebrew/bin"
    "/opt/homebrew/opt/gnu-sed/libexec/gnubin"
    "/opt/homebrew/opt/llvm/bin"
    $"($env.HOME)/.local/bin"
    $"($env.HOME)/code/go/bin"
    $"($env.HOME)/.hishtory"
  ]
  | append $env.PATH
  | uniq
)

# =====================
# Editors
# =====================

if (which nvim | is-not-empty) {
  $env.EDITOR = "nvim"
  $env.GIT_EDITOR = "nvim"
  $env.PSQL_EDITOR = "nvim -c 'set filetype=sql'"
} else {
  $env.EDITOR = "vim"
  $env.GIT_EDITOR = "vim"
  $env.PSQL_EDITOR = "vim -c 'set filetype=sql'"
}

# =====================
# History
# =====================

$env.HISTFILE = $"($env.HOME)/.zsh_history"
$env.HISTSIZE = 50000
$env.SAVEHIST = 50000

# =====================
# Colors / UI
# =====================

$env.COLOR_PROFILE = "dark"
$env.LSCOLORS = "Gxfxcxdxbxegedabagacad"
$env.KEYTIMEOUT = 1

# =====================
# Golang
# =====================

$env.GOPATH = $"($env.HOME)/go/src"
$env.GOBIN = $"($env.GOPATH)/bin"

# =====================
# fzf + ripgrep
# =====================

if (which fzf | is-not-empty) and (which rg | is-not-empty) {
  $env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*" --glob "!vendor/*"'
  $env.FZF_CTRL_T_COMMAND = $env.FZF_DEFAULT_COMMAND
  $env.FZF_ALT_C_COMMAND = $env.FZF_DEFAULT_COMMAND
}

