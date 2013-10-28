set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'flazz/vim-colorschemes'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'msanders/snipmate.vim'
"Bundle 'ervandew/supertab'
"Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'
"Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
"Bundle 'Raimondi/delimitMate'
"Bundle 'mattn/zencoding-vim'
"Bundle 'vim-scripts/IndexedSearch'
"Bundle 'vim-scripts/L9.git'
"Bundle 'vim-scripts/matchit.zip'
"Bundle 'godlygeek/tabular'
"Bundle 'git://gist.github.com/287147.git'
 
"Bundle 'tpope/vim-cucumber'
"Bundle 'tpope/vim-haml'
"Bundle 'pangloss/vim-javascript'
"Bundle 'kchmck/vim-coffee-script'

" Set syntax highlighting options.
syntax on
set t_Co=256
set background=dark
colorscheme badwolf

set number            " line numbers
set title

let mapleader = ","
set autoindent
set expandtab
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set ts=2
set expandtab
compiler ruby         " Enable compiler support for ruby
set hlsearch
set showmatch
set laststatus=2
set smarttab
set shiftwidth=2

" edit file in path of current file
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" map ctrlp to leader f
map <Leader>f :CtrlP<CR>
map <Leader>b :CtrlPBuffer<CR>
" use silver searcher for ctrlp
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Faster split resizing (+,-)
if bufwinnr(1)
   map + <C-W>+
   map - <C-W>-
 endif

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
