# A bare Git repository
# https://www.atlassian.com/git/tutorials/dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dot=dotfiles

# https://github.com/direnv/direnv/wiki/Tmux
alias tmux='direnv exec / command tmux'
alias t='tmux'
alias q='exit'
alias j='z'

alias ls='ls --color=auto -F' # assume coreutils installed
alias ll='ls -lh'
alias la='ls -lha'

alias tr1="exa -FT --git-ignore -L=1"
alias tr2="exa -FT --git-ignore -L=2"
alias tr3="exa -FT --git-ignore -L=3"

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias -g A='| awk'
alias -g F='| fzf'
alias -g G='| rg --color=auto'
alias -g H='| head'
alias -g L='| less'
alias -g S='| sort'
alias -g T='| tail'
alias -g U='| uniq'

case ${OSTYPE} in
    darwin*)
        alias -g C='| pbcopy'
        ;;
    linux*)
        alias -g C='| xsel --input --clipboard'
        ;;
esac

alias untar='tar -zxvf'
alias -s gz='tar -xzvf' # ./foo.tar.gz

alias kc='kubectl'
alias kx='kubectx'
