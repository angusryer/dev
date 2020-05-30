" ~/.vimrc

" Sections:
"   - Basic setup
"   - Displaying text
"   - Windows
"   - GUI
"   - Messages and info
"   - Text, tab and indent
"   - Folding and comments
"   - Maps
"   - Reading and writing files
"   - Command line editing
"   - Moving around, searching, patterns and tags
"   - Filetype settings
"   - Plugin settings

" Section: Basic setup

set nocompatible

filetype plugin indent on

" Section: Displaying text

set lazyredraw
set cmdheight=1

" Section: Windows

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Section: GUI

syntax enable
set background=dark
colorscheme monokai

set number
set relativenumber
set numberwidth=5

set guioptions-=l guioptions-=L guioptions-=r guioptions-=R

" Section: Messages and info

set confirm
set showcmd

" Section: Text, tab and indent

set backspace=2

set expandtab

set softtabstop=2
set shiftwidth=2

set tabstop=8

set breakindent
set breakindentopt=shift:4,min:40,sbr
set showbreak=>>

set infercase
set showmatch

" Section: Folding and comments

setglobal commentstring=#\ %s

autocmd FileType js,scss,sass setlocal commentstring=//\ %s
autocmd FileType html setlocal commentstring=<!--\ %s

" Section: Maps

let mapleader=","

set timeoutlen=1200
set ttimeoutlen=50

nnoremap <leader>w :w<return>
nnoremap <leader><esc> :noh<return><esc>

" Section: Reading and writing files

set autoread
set autowrite

" Section: Command line editing

set history=200
set wildmenu
set wildmode=full
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Section: Moving around, searching, patterns and tags

set ignorecase
set smartcase
set incsearch

" Search down into subfolders
set path+=**

" Section: Filetype settings

" Section: Plugin settings

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:airline_theme='molokai'
