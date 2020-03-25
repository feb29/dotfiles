" `:set nocp` is done automatically when .vimrc is found.
" However, this might be useful when you execute `vim -u .vimrc` from the command line.
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done only when 'compatible' is set.
  set nocompatible
endif

" if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
"   set shell=/usr/bin/env\ bash
" endif

set hidden
set wildmenu
set autoread

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set encoding=utf-8
set fileencoding=utf-8
set formatoptions+=j " Delete comment character when joining commented lines

" ★ ※
" set ambiwidth=double

set nobackup
set noswapfile
set noundofile

set t_vb=
set visualbell
set noerrorbells

set mouse=a
set mousehide

set scrolloff=1
set sidescrolloff=5
set display+=lastline

set clipboard=unnamed,unnamedplus
set completeopt=menuone,noselect

set showcmd
set cmdheight=2
set laststatus=2

set fillchars=""
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

set complete-=i
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]

set autoindent smartindent

set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
set smarttab
set showtabline=1

set ignorecase smartcase
set infercase
set incsearch
set nohlsearch

set number
" set cursorline
set signcolumn=yes

set foldenable

set equalalways
set splitright

set title
set titlestring=%.99f
set linespace=0
set noshowmode

set showmatch
set shellslash
set history=1000
set nowrap

nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

let mapleader      = "\<Space>"
let maplocalleader = ","

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if !has('gui_running')
  set t_Co=256
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

if $HOME != $USERPROFILE && $GIT_EXEC_PATH != ''
    finish
end

if has('nvim')
    let $VIMDIR = expand($HOME.'/.config/nvim')
else
    let $VIMDIR = expand($HOME.'/.vim')
endif

let $PLUGVIM = $VIMDIR.'/autoload/plug.vim'

if empty(glob($PLUGVIM))
    silent !curl -fLo $PLUGVIM --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" Plugins
call plug#begin($VIMDIR.'/plugged')

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

Plug 'editorconfig/editorconfig-vim'

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'

""" LSP
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'LnL7/vim-nix'
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
Plug 'google/vim-jsonnet'

Plug 'rust-lang/rust.vim'
Plug 'mattn/vim-goimports'

call plug#end()

runtime! macros/matchit.vim

filetype plugin indent on
set background=dark

let g:gruvbox_sign_column = 'bg0'
colorscheme gruvbox

highlight Normal     guibg=NONE ctermbg=NONE
highlight Signcolumn guibg=NONE ctermbg=NONE

""" Load settings in `.vim/rc/*.vim`.
call map(sort(split(globpath(&runtimepath, 'rc/*.vim'))), {->[execute('exec "so" v:val')]})
