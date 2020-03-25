function worktrees -d "select worktree"
    git worktree list | fzf -0 -1 | awk '{print $1}'
end
