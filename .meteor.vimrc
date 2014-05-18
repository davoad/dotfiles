runtime macros/matchit.vim
" #Bundles 
" Bundler that knows how to 'make' 
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
"set nocompatible
"filetype off
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

" let Vundle manage Vundle
NeoBundle 'gmarik/vundle'
NeoBundle 'bling/vim-airline'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'godlygeek/tabular'

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Vim JS autocompletion with type hints 
NeoBundle 'marijnh/tern_for_vim'
let g:tern_show_argument_hints = 'on_move'

" Ultimate UI system for running fuzzy-search on different things 
NeoBundle 'Shougo/unite.vim'
" Always start insert mode
let g:unite_enable_start_insert = 0
let g:unite_source_history_yank_enable = 1
let g:unite_split_rule = "botright"

" `ag` is a faster and better replacement for the standard `find`, let Unite use
" it if it exists and configure to properly use `.gitignore` or `.hgignore`
" files if those exist.
" To install `ag`: brew install ag
" or: https://github.com/ggreer/the_silver_searcher
if executable("ag")
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" Auto-completion plugin integrated with Unite and vimshell
NeoBundle 'Shougo/neocomplete.vim'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#min_keyword_length = 3

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Unite
let g:unite_source_file_rec_max_cache_files = 0
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file,file/new,buffer,file_rec,line', 'matchers', 'matcher_fuzzy')


autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Expand/shrink the visual selection by text-object blocks with `+` and `_` in
" the visual mode
NeoBundle 'terryma/vim-expand-region'

" Undo/Redo tree
NeoBundle 'sjl/gundo.vim'

" Insert/Delete brackets in pairs
NeoBundle 'jiangmiao/auto-pairs'

" Syntax definitions 
NeoBundle "slava/vim-spacebars"
NeoBundle "groenewege/vim-less"
NeoBundle "elzr/vim-json"
NeoBundle "tpope/vim-markdown"
NeoBundle "pangloss/vim-javascript"
NeoBundle "leafgarland/typescript-vim"
" Actually does much more than syntax highlighting but that's overkill for me
NeoBundle "kchmck/vim-coffee-script"
NeoBundle "hdima/python-syntax"

" Visually sets marks
NeoBundle "kshenoy/vim-signature"

" OMG OMG, shell in my VIM 
NeoBundle "Shougo/vimshell"
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
" open new splits actually in new tab
let g:vimshell_split_command = "tabnew"

if has("gui_running")
  let g:vimshell_editor_command = "mvim"
endif

" Set syntax highlighting options.
syntax on

" Colorscheme 
colorscheme badwolf
set t_Co=256
set background=dark


set number            " line numbers
set relativenumber

set title
set ruler
set cursorline

let mapleader = ","
set autoindent
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
compiler ruby         " Enable compiler support for ruby
set ts=2
set expandtab
set hlsearch
set incsearch
set showmatch
set laststatus=2
set smarttab
set shiftwidth=2

" Tweak the behavior of <Tab> in command mode
set wildmenu
set wildmode=longest:full,full

" Buffers tweaks
" Allow to switch from changed buffer
set hidden

" ##AutoCmd essentials
if has("autocmd")
  " Enable file type detection
  filetype on
  filetype plugin indent on
endif

" Wrapping tweaks 
set wrap
set linebreak
set textwidth=80
set formatoptions=cq " format using textwidth, including comments and gq

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

" Save undo history persistently on disk, takes extra space 
if has('persistent_undo')         " persistend undo history
  " create the directory if it doesn't exist
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
  set undofile                  " Save undo's after file closes
  set undodir=~/.vim/undo/      " where to save undo histories
  set undolevels=100            " How many undos
  set undoreload=3000           " number of lines to save for undo
endif

" create the directory if it doesn't exist
silent !mkdir ~/.vim/swap > /dev/null 2>&1
set backupdir=~/.vim/swap/
set directory=~/.vim/swap/

" #Other mappings 
" Quickly open files or buffers
nnoremap <leader>f :Unite -start-insert file_rec -profile-name=files<CR>
" #Leader mappings 
" Show/hide invisibles by <leader>l
nnoremap <leader>l :set list!<CR>
" Toggle spelling on/off
nnoremap <silent> <leader>s :set spell!<CR>
" Tab movements
nnoremap <leader>m :tabn<CR>
nnoremap <leader>n :tabp<CR>
" Save file quickly
nnoremap <leader>w :w<CR>
" Quickly cd to directory
nnoremap <leader>d :Unite -start-insert directory<CR>
" Paste from the yank history
nnoremap <leader>p :Unite -start-insert history/yank<CR>
" Trigger the git menu
nnoremap <leader>g :Unite -silent -start-insert menu:git<CR>
" Open all menus with useful stuff
nnoremap <leader>j :Unite -silent -start-insert menu:all menu:git<CR>

" #Other mappings 
" Quickly open files or buffers
nnoremap <leader>f :Unite -start-insert file_rec -profile-name=files<CR>
nnoremap <leader>b :Unite -start-insert buffer<CR>
nnoremap <leader>a :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>


" Fugitive menu in Unite (depends on both Fugitive and Unite.vim)
let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.git = {}
let g:unite_source_menu_menus.git.description = 'git (Fugitive)'
let g:unite_source_menu_menus.git.command_candidates = [
      \['▷ git status       (Fugitive)',
      \'Gstatus'],
      \['▷ git diff         (Fugitive)',
      \'Gdiff'],
      \['▷ git commit       (Fugitive)',
      \'Gcommit'],
      \['▷ git log          (Fugitive)',
      \'exe "silent Glog | Unite quickfix"'],
      \['▷ git blame        (Fugitive)',
      \'Gblame'],
      \['▷ git stage        (Fugitive)',
      \'Gwrite'],
      \['▷ git checkout     (Fugitive)',
      \'Gread'],
      \['▷ git rm           (Fugitive)',
      \'Gremove'],
      \['▷ git mv           (Fugitive)',
      \'exe "Gmove " input("destino: ")'],
      \['▷ git push         (Fugitive, output buffer)',
      \'Git! push'],
      \['▷ git pull         (Fugitive, output buffer)',
      \'Git! pull'],
      \['▷ git prompt       (Fugitive, output buffer)',
      \'exe "Git! " input("comando git: ")'],
      \['▷ git cd           (Fugitive)',
      \'Gcd'],
      \]
"

" Different stuff in the menu (depends on Unite.vim) 
let g:unite_source_menu_menus.all = {}
let g:unite_source_menu_menus.all.description = 'All things'
let g:unite_source_menu_menus.all.command_candidates = [
      \['▷ gundo toggle undo tree', 'GundoToggle'],
      \['▷ save file', 'write'],
      \['▷ save all opened files', 'wall'],
      \['▷ make the current window the only one on the screen', 'only'],
      \['▷ open file (Unite)', 'Unite -start-insert file'],
      \['▷ open file recursively (Unite)', 'Unite -start-insert file_rec/async'],
      \['▷ open buffer (Unite)', 'Unite -start-insert buffer'],
      \['▷ open directory (Unite)', 'Unite -start-insert directory'],
      \['▷ toggle the background color', 'ToggleBG'],
      \['▷ open the shell (VimShell)', 'VimShell'],
      \['▷ open a new shell (VimShell)', 'VimShellCreate'],
      \['▷ open a new shell in a tab (VimShell)', 'VimShellTab'],
      \['▷ open a node interpreter (VimShell)', 'VimShellInteractive node'],
      \['▷ install bundles (NeoBundleInstall)', 'NeoBundleInstall'],
      \['▷ clean bundles (NeoBundleClean)', 'NeoBundleClean'],
      \['▷ update bundles (NeoBundleUpdate)', 'NeoBundleUpdate'],
      \]
" 
