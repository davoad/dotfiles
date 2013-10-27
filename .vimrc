set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'flazz/vim-colorschemes'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'ervandew/supertab'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'Raimondi/delimitMate'
Bundle 'mattn/zencoding-vim'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'vim-scripts/L9.git'
Bundle 'vim-scripts/matchit.zip'
Bundle 'godlygeek/tabular'
Bundle 'git://gist.github.com/287147.git'
 
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'

" Set syntax highlighting options.
set t_Co=256
set background=dark
syntax on
colorscheme badwolf

set number " line numbers
