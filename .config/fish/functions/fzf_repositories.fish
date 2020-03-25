function fzf_repositories -d 'search/select repositories'
    set -l query (commandline)
    [ -n "$query" ] && set -l flags --query="$query"

    set -l select (ghq list --full-path | sed 's;'"$HOME/"';;' | fzf $flags)
    [ -n "$select" ] && cd "$HOME/$select"

    commandline -f repaint
end
