syntax enable

set nocompatible

" view
set number
set ruler
set cursorline
" set cursorcolumn
set laststatus=2
set cmdheight=2
set showmatch
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<
set helplang=en
set t_Co=256

" cursor
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]

" file
set hidden
set autoread
set nobackup
set noswapfile

" search
set incsearch
set hlsearch
set wrapscan
set ignorecase
set smartcase
set gdefault

" tab,indent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noautoindent
set nosmartindent

" os setting
" set iminsert=2

" command line
set history=2000

filetype plugin indent on

" color scheme
set background=dark
colorscheme desert
" colorscheme solarized

" remap key
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy

" dein Scripts
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/ueno-t/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/ueno-t/.cache/dein')
  call dein#begin('/home/ueno-t/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/ueno-t/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

