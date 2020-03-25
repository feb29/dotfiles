if status --is-interactive && type -q direnv
    direnv hook fish | source
    alias tmux  "direnv exec / command tmux" # https://github.com/direnv/direnv/wiki/Tmux
end
