" main {{{ 
set nocompatible
filetype off                  " required
filetype plugin indent on    " required

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
" }}}
" Affichage {{{ 
" VIM Configuration - Emmanuel LONGEAU
set title " Met a jour le titre de votre fenetre ou de votre terminal
set number " Affiche le numero des lignes
set ruler " Affiche la position actuelle du curseur
set wrap " Affiche les lignes trop longues sur plusieurs lignes
set scrolloff=3 " Affiche un minimum de 3 lignes autour du curseur (pour le scroll)
" }}}
" Recherche {{{
set ignorecase " Ignore la casse lors dune recherche
set smartcase " Si une recherche contient une majuscule, re-active la sensibilite a la casse
set incsearch " Surligne les resultats de recherche pendant la saisie
set hlsearch " Surligne les resultats de recherche
" }}}
" Divers {{{
let g:bookmark_sign = 'X'
let g:bookmark_annotation_sign = '##'
let g:notes_directories=['~/notes']
set visualbell " Empeche Vim de beeper
set noerrorbells " Empeche Vim de beeper
set cursorline 
set wildmenu            " visual autocomplete for command menu
" Active le comportement habituel de la touche retour en arriere
set backspace=indent,eol,start
" Cache les fichiers lors de louverture dautres fichiers
set hidden
set autoread			"Reload files changed outside vim
let g:ctrlp_working_path_mode = 'ra'
" Ignore these directories
set wildignore+=*/build/**
set wildignore+=*/target/**
" disable caching
let g:ctrlp_use_caching=0
" }}}
" Syntaxe {{{
" Active la coloration syntaxique
syntax enable
syntax on
" acive les comportements spécifiques aux types de fichier comme la syntaxe et
" l'indentation
filetype on
filetype plugin on
filetype indent on
" }}}
" Raccourci {{{
:let mapleader = ","

" ============== Fonctions ==================

function! MultiScroll(OnOff)
if a:OnOff == 1
  noremap j 5j
  noremap k 5k
else
  noremap j j
  noremap k k
endif
endfunction 

" ========= Motion ==========
inoremap jk <Esc>
imap <Esc> <nop>
nnoremap j gj
nnoremap k gk
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :RainbowParenthesesToggle<CR>

" Scroll plus rapide
nnoremap <leader>j :call MultiScroll(1)<RETURN>
nnoremap <leader>k :call MultiScroll(0)<RETURN>

" noremap w <C-w>
" noremap W <C-w><C-w>

nnoremap <leader>p :bp<RETURN>
nnoremap <leader>n :bn<RETURN>
nnoremap tt :e ~/.todo/todo.txt<RETURN>
nnoremap <C-w> :w<RETURN>
nnoremap <leader>v :e ~/_vimrc<RETURN>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

nnoremap <silent> <Leader><Leader> :nohlsearch<CR>
inoremap <leader>x !%C:\Users\elongeau\.babun\cygwin\bin\xmllint.exe --format --recover -<CR>
nnoremap NN :enew<RETURN>

" ========= Note =========
nnoremap no :Note 

" ======== Files =========
" ouvre un fichier dans le HOME
nnoremap oh :e ~/
" recharge le fichier courant dans vim
noremap <silent><buffer> <F5> :exec 'source '.bufname('%')<CR>

" ======= ClipBoard ======
nnoremap <leader>y "+y
nnoremap <leader>p "+p

" ======= Numbers =======
" to an easily access of numbers with command on a french keyboad
nnoremap & 1
nnoremap é 2
nnoremap " 3
nnoremap ' 4
nnoremap ( 5
nnoremap - 6
nnoremap è 7
nnoremap _ 8
nnoremap ç 9
nnoremap à 0
nnoremap = + 

" ====== Insert Mode ======
inoremap <c-d> <esc>ddi
inoremap <c-z> <esc>ui

" ====== Move lines =======
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap QQ :q<CR>
nnoremap qq :BD<CR> 
nnoremap zq :bd!<CR>
nnoremap ZQ :q!<CR>

" Reload syntax highlighting
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>
" }}}
" Vundle {{{
" =============== Vundle Initialization ===============
" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Theme
Plugin 'solarized'
Bundle 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'sjl/badwolf'
Plugin 'chriskempson/base16-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'MaxSt/FlatColor'
Plugin 'fmoralesc/molokayo'
" Coding
Plugin 'derekwyatt/vim-scala'
" Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'
Plugin 'ekalinin/Dockerfile.vim'
" Plugin 'airblade/vim-gitgutter'
" TO SORT...
Plugin 'junegunn/goyo.vim'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'amix/vim-zenroom2'
Plugin 'junegunn/seoul256.vim'
Plugin 'xolox/vim-misc'
Plugin 'jceb/vim-orgmode'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Plugin 'vim-scripts/YankRing.vim'
Plugin 'vim-scripts/TagHighlight'
Plugin 'xolox/vim-notes'
Plugin 'freitass/todo.txt-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'rainbow.zip'
Plugin 'rking/ag.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'ggreer/the_silver_searcher'
Plugin 'xolox/vim-session'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
" Plugin 'Shougo/unite.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'moll/vim-bbye'
Plugin 'MattesGroeger/vim-bookmarks'
" All of your Plugins must be added before the following line
call vundle#end()            " required


" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}
" Autocommand {{{
" automatically reload vimrc when it's saved
autocmd! bufwritepost _vimrc source %
autocmd BufEnter * :syntax sync fromstart
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
" }}}
" Backup {{{
set backup
set backupdir=~/.vim-tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp
set writebackup 
" }}}
" Indentation {{{
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on


set nowrap       "Don't wrap lines
" set wrap
set linebreak
set nolist  " list disables linebreak
" set showbreak=
set linebreak    "Wrap lines at convenient points
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10    " start with fold level of 1
" }}}
" Completion {{{

set wildmode=longest,list,full
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
" }}}
" Scrolling {{{
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
" }}}
" Session {{{
let g:session_autosave="yes"
let g:session_autoload="yes"
" }}}
" GUI {{{
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions+=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'
" }}}
" Theme {{{
set t_Co=256
set background=dark
" set background=light
" colorscheme solarized
let g:seoul256_background = 234
" colorscheme seoul256 
" colorscheme gruvbox
colorscheme base16-atelierdune 
set antialias

set encoding=utf-8 
set fileencoding=utf-8
" set guifont=Anonymice_Powerline:h10
set guifont=Fantasque\ Sans\ Mono:h14
" set guifont=Sauce_Code_Powerline:h12
"set guifont=ProFontWindows:h10
"set guifont=Inconsolata_for_Powerline:h10
" }}}
" Clipboad {{{
set clipboard=unnamed
" }}}
" Airline {{{
let g:airline_theme='wombat'
set laststatus=2
let g:airline_powerline_fonts = 1
"powerline symbols
let g:Powerline_symbols="fancy"
let g:airline_section_z = ' %l / %L : %c '
let g:airline#extensions#tabline#enabled = 1
" }}}
" Markdown {{{
" disable folding
let g:vim_markdown_folding_disabled=1
" }}}
" delimitMate {{{
let g:delimitMate_autoclose = 1  
let g:delimitMate_expand_cr = 2  
let g:delimitMate_expand_space = 1  
let delimitMate_expand_inside_quotes = 1  
let g:delimitMate_smart_quotes = 1  
let g:delimitMate_jump_expansion = 1  
let g:delimitMate_matchpairs = "(:),[:],{:},<:>"
" }}}
" vim:foldmethod=marker:foldlevel=0

