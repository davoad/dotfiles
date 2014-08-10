runtime macros/matchit.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'bling/vim-airline'
Bundle 'flazz/vim-colorschemes'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/rbenv-ctags'
Bundle 'tpope/vim-dispatch'
Bundle 'thoughtbot/vim-rspec'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-user'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'joequery/Stupid-EasyMotion'
"Bundle 'guns/ultisnips'
Bundle 'SirVer/ultisnips.git'
"Bundle 'msanders/snipmate.vim'
"Bundle 'ervandew/supertab'
"Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
"Bundle 'mattn/zencoding-vim'
"Bundle 'vim-scripts/IndexedSearch'
"Bundle 'vim-scripts/L9.git'
"Bundle 'vim-scripts/matchit.zip'
Bundle 'godlygeek/tabular'
"Bundle 'tpope/vim-cucumber'
"Bundle 'tpope/vim-haml'
"Bundle 'pangloss/vim-javascript'
"Bundle 'kchmck/vim-coffee-script'
" Javascript
Bundle 'jelera/vim-javascript-syntax'
Bundle 'marijnh/tern_for_vim'
"Bundle 'Raimondi/delimitMate'
Bundle 'jiangmiao/auto-pairs'
" Web Tools
Bundle "mattn/emmet-vim"
Bundle "chrisbra/color_highlight"
Bundle "groenewege/vim-less"

" tmux
Bundle 'andersoncustodio/vim-tmux'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'benmills/vimux'
" Set syntax highlighting options.
syntax on
set t_Co=256
set background=dark
colorscheme badwolf

set number            " line numbers
set relativenumber

set title

let mapleader = ","
set autoindent
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
compiler ruby         " Enable compiler support for ruby
set ts=2
set backspace=2
set expandtab
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
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" map Silver Searcher
 map <leader>a :Ag!<space>

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
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Paste
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>T :call RunAllSpecs()<CR>

" Vimux
map <leader>x :VimuxPromptCommand<CR>

let g:rspec_command = 'call VimuxRunCommand("clear; rspec {spec}")'
"let g:rspec_command = "Dispatch rspec {spec}"
let g:html_indent_inctags = "html,body,head,tbody,template"
