if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/ueno-t/.cache/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/ueno-t/.cache')
  call dein#begin('/home/ueno-t/.cache')

  " Let dein manage dein
  " Required:
  call dein#add('/home/ueno-t/.cache/repos/github.com/Shougo/dein.vim')

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

