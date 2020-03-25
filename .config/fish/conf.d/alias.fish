# See [A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles).
alias dotfiles "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

if status --is-interactive
    alias cp    "cp -i"
    alias mv    "mv -i"
    alias rm    "rm -i"
    alias tr1   "exa -FT -L=1"
    alias tr2   "exa -FT -L=2"
    alias tr3   "exa -FT -L=3"
    alias untar "tar -zxvf"

    if type -q xdg-open
        alias open xdg-open
    end

    if type -q pbcopy
        alias yank "pbcopy"
    else if type -q xsel
        alias yank "xsel --clipboard --input"
    end
end
