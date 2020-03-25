# zmodload zsh/zprof && zprof

bindkey -e
setopt ignore_eof           # Do not exit by `Ctrl-D` key
setopt interactive_comments # comment at commandline
setopt extended_glob        # `#` `~` `*` as glob
setopt notify               # notify background job
setopt no_beep
setopt no_flow_control      # disable C-q C-s

LISTMAX=1000

setopt auto_menu
setopt auto_param_slash
setopt auto_param_keys
setopt mark_dirs
setopt list_types
setopt no_listbeep
setopt always_last_prompt
setopt print_eight_bit

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

HISTFILE=$HOME/.zsh/zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

if [[ $UID == 0 ]]; then
    unset HISTFILE
    unset HISTSIZE
    SAVEHIST=0
fi

setopt hist_expand
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_no_functions
setopt share_history
setopt append_history
setopt inc_append_history

autoload -Uz select-word-style; select-word-style default
autoload -Uz colors           ; colors
autoload -Uz compinit         ; compinit
# autoload -Uz predict-on       ; predict-on
# autoload -Uz zmv

zstyle ':zle:*' word-chars " -=./;@"
zstyle ':zle:*' word-style unspecified

zstyle ':completion:*' verbose       yes
zstyle ':completion:*' menu          select=2
zstyle ':completion:*' group-name    ''
zstyle ':completion:*' matcher-list  'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' special-dirs  true

if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
else
    zstyle ':completion:*' list-colors ''
fi

zstyle ':completion::*'                   use-cache   on
zstyle ':completion::*'                   cache-path  $HOME/.zsh/cache
zstyle ':completion:*:cd:*'               tag-order   local-directories directory-stack path-directories
zstyle ':completion:*:*:*:*:processes'    command     "ps -u $USER -o pid,user,comm -w -w"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

if [ -d $ZSHRCS -a -r $ZSHRCS -a -x $ZSHRCS ]; then
    for i in $ZSHRCS/*; do
        [[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

whichcomp() {
    for 1; do
        ( print -raC 2 -- $^fpath/${_comps[$1]:?unknown command}(NP*$1*) )
    done
}

goto_repository() {
    local dir; dir="$(ghq list | fzf --query="$LBUFFER")"
    if [ -n "$dir" ]; then
        BUFFER="builtin cd $(ghq root)/$dir"
        zle accept-line
    fi
}
zle -N goto_repository
bindkey '^]' goto_repository

source ~/.zplug/init.zsh

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "agkozak/zsh-z"

zplug load # --verbose

# if (which zprof > /dev/null 2>&1) ;then
#     zprof | less
# fi

if [ $commands[direnv] ]; then
    eval "$(direnv hook zsh)"
fi

if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi
