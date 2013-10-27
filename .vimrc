set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'flazz/vim-colorschemes'

" Set syntax highlighting options.
set t_Co=256
set background=dark
syntax on
colorscheme badwolf
