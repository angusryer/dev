" Sections:
"   - Basic setup
"   - Editor
"   - Text, tab and indent
"   - Mappings and keycodes
"   - File search
"   - Plugin configuration
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enter the current millenium
set nocompatible

" Native third-party package loading
packloadall

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Scheme
colorscheme monokai

" Line numbers
set number
set relativenumber
set numberwidth=5

" Break indent
set breakindent
set breakindentopt=shift:4,min:40,sbr
set showbreak=>>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" 1 tab == 2 spaces
set softtabstop=2
set shiftwidth=2

" Display of existing tabs
set tabstop=8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings and keycodes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

" Wait for a key code or mapped key sequence to complete
set timeoutlen=250

" Write
nnoremap <leader>w :w<return>

" Clear highlighting
nnoremap <leader><esc> :noh<return><esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search down into subfolders
set path+=**
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

