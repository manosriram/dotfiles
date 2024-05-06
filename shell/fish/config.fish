if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x GOROOT /usr/local/go
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x GO111MODULE on

set -x GOPATH $HOME/go
set -x GOBIN $HOME/go/bin

fish_add_path $GOPATH
fish_add_path $GOROOT/bin
fish_add_path /opt/homebrew/bin/
fish_add_path /Users/manosriram/.local/bin
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /Users/manosriram/.cargo/bin/

function tmux_attach
    tmux attach-session -t $argv;
end

function tmux_kill_all_sessions
    pkill -f tmux;
end

function git_checkout
    git checkout $argv;
end

function git_checkout_to_new_branch
    git checkout -b $argv;
end

function git_commit
    git commit -m $argv;
end

function git_push
    git push origin $argv;
end

function git_pull
    git pull origin $argv;
end

abbr -a tmx tmux
abbr -a tls "tmux ls"
abbr -a tk "tmux kill-server"
abbr -a ta tmux_attach
abbr -a tx "exit"
abbr -a tka tmux_kill_all_sessions

abbr -a gss "git status"
abbr -a gaa "git add ."
abbr -a gbb "git branch"
abbr -a gl "git log"
abbr -a gd "git diff"
abbr -a gitch git_checkout
abbr -a gitchn git_checkout_to_new_branch
abbr -a gc git_commit
abbr -a gps git_push
abbr -a gpl git_pull
