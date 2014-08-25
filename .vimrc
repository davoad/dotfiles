runtime macros/matchit.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/rbenv-ctags'
Plugin 'thoughtbot/vim-rspec'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'joequery/Stupid-EasyMotion'
Plugin 'SirVer/ultisnips.git'
Plugin 'honza/vim-snippets'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
"Plugin 'tpope/vim-cucumber'
"Plugin 'tpope/vim-haml'
"Plugin 'pangloss/vim-javascript'
"Plugin 'kchmck/vim-coffee-script'
" Javascript
Plugin 'jelera/vim-javascript-syntax'
Plugin 'marijnh/tern_for_vim'
"Plugin 'Raimondi/delimitMate'
"Plugin 'jiangmiao/auto-pairs'
" Web Tools
Plugin 'mattn/emmet-vim'
Plugin 'chrisbra/color_highlight'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-ragtag'
" tmux
Plugin 'andersoncustodio/vim-tmux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'
" git
Plugin 'sjl/splice.vim'
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

"Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsSnippetDirectories=["UltiSnips"]
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
