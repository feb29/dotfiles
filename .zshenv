export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export PAGER=less
export EDITOR=vim

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export GOPATH=$HOME

export ZSHRCS=$HOME/.zsh/rc
export VIMRCS=$HOME/.vim/rc

export DOTFILES=$HOME/.dotfiles

#export FZF_DEFAULT_COMMAND="fd --list-details --type file --color=always --follow --hidden --exclude .git"
export FZF_DEFAULT_COMMAND="rg --sort=path --files --hidden --follow --glob='!.git/'"
export FZF_DEFAULT_OPTS="--ansi --prompt='❯ ' --height 70% --reverse"

typeset -U PATH path
path=(
    "$HOME/bin"(N-/)
    /usr/local/{bin,sbin}(N-/)
    "$path[@]"
)
export PATH

[[ $- == *i* ]] && exec fish # if running interactively

[ -f $HOME/.fzf.zsh ]                          && . $HOME/.fzf.zsh
[ -f $HOME/.asdf/asdf.sh ]                     && . $HOME/.asdf/asdf.sh
[ -f $HOME/.nix-profile/etc/profile.d/nix.sh ] && . $HOME/.nix-profile/etc/profile.d/nix.sh

typeset -U FPATH fpath
fpath=(
    $HOME/.zsh/functions(N-/)
    $HOME/.asdf/completions(N-/)
    $fpath
)
export FPATH

# typeset -U MANPATH manpath
#
# typeset -U CDPATH cdpath
# cdpath=(
#     $HOME/src/*(N-/)
#     $cdpath
# )

