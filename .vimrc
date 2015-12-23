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

" neobundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

  " base
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/vimfiler'

  " lightline
  NeoBundle 'itchyny/lightline.vim'

  " color schema
  NeoBundle 'altercation/vim-colors-solarized'

  " typescript
  NeoBundle 'Shougo/vimproc'
  NeoBundle 'Quramy/tsuquyomi'
  NeoBundle 'leafgarland/typescript-vim'
  NeoBundle 'jason0x43/vim-js-indent'
call neobundle#end()

NeoBundleCheck

filetype plugin indent on

" color scheme
set background=dark
" colorscheme desert
colorscheme solarized

" remap key
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy

