runtime macros/matchit.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'DeleteTrailingWhitespace'
Plugin 'bkad/CamelCaseMotion'
Plugin 'gmarik/Vundle.vim'
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
Plugin 'tpope/vim-rbenv'
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
" api blueprint
Plugin 'kylef/apiblueprint.vim'
call vundle#end()

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

" quick save
nnoremap <leader>w :w<CR>

" Stript trailing whitespace
nnoremap <Leader>ws :call StripTrailingWhitespaces()<CR>
" Removes trailing whitespace
fun! StripTrailingWhitespaces()
 let line = line(".")
 let col = col(".")
 let search = @/
 keepjumps %s/\s\+$//e
 let @/=search
 call cursor(line, col)
endfun

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

" YCM - use tags from files
let g:ycm_collect_identifiers_from_tags_files = 1

" Ultisnips
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

let g:rspec_command = 'call VimuxRunCommand("clear; be rspec {spec}")'
let g:html_indent_inctags = "html,body,head,tbody,template"

" CamelCase Motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie
