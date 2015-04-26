" Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'bling/vim-airline'


" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" Affichage {{{ 
" VIM Configuration - Emmanuel LONGEAU
set title " Met a jour le titre de votre fenetre ou de votre terminal
set number " Affiche le numero des lignes
set ruler " Affiche la position actuelle du curseur
set wrap " Affiche les lignes trop longues sur plusieurs lignes
set scrolloff=3 " Affiche un minimum de 3 lignes autour du curseur (pour le scroll)
set wildmenu            " visual autocomplete for command menu
" }}}
" Recherche {{{
set ignorecase " Ignore la casse lors dune recherche
set smartcase " Si une recherche contient une majuscule, re-active la sensibilite a la casse
set incsearch " Surligne les resultats de recherche pendant la saisie
set hlsearch " Surligne les resultats de recherche
" }}}
" Divers {{{
set visualbell " Empeche Vim de beeper
set noerrorbells " Empeche Vim de beeper
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
nnoremap <leader>v :e ~/.vimrc<RETURN>
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
" Autocommand {{{
" automatically reload vimrc when it's saved
autocmd! bufwritepost .vimrc source %
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
" }}}" Completion {{{

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
colorscheme solarized
let g:seoul256_background = 234
" colorscheme seoul256 
" colorscheme gruvbox
" colorscheme base16-atelierdune 
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
let g:airline_theme='solarized'
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
